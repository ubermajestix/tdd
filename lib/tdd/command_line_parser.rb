class Tdd::CommandLineParser
  def self.parse
    parser = self.new
    [parser.paths.flatten, parser.test_command]
  end

  attr_accessor :paths, :test_framework

  def initialize
    pos = ARGV.index('--')
    if pos
      @paths = ARGV[0 ... pos]
      @test_args = ARGV[pos + 1 .. -1].join(' ')
    else
      @paths = []
      @test_args = ARGV[0..-1].join(' ')
    end
    @test_file = @test_args.scan(/^.+.rb/).first
    glob_for_test_file_matches
    parse_all_files_mode
    parse_controller_mode
    parse_test_framework
  end

  def test_command
    "#{@test_framework} #{@test_args}"
  end

  private

  def exit_if_no_test_framework
    say("No test or spec command could be built.", :color => :red)
    say("Pass -h option to see examples.", :color => :red)
    exit 1
  end

  def glob_for_test_file_matches
    return unless @test_file
    search = File.basename(@test_file).gsub(/(_spec|_test)/, '')
    @paths << Dir.glob("**/#{search}")
    @paths << @test_file
  end

  def parse_all_files_mode
    if @paths.first == 'all'
      @paths = %w[app lib config test spec]
    end
  end

  def parse_controller_mode
    if @paths.first == "controller"
      resource = File.basename(@test_file).gsub(/(_controller_spec.rb|_controller_test.rb)/, '')
      search = File.basename(@test_file).gsub(/(_spec|_test)/, '')
      @paths = Dir.glob("app/views/#{resource}/**")
      @paths += Dir.glob("**/#{search}")
      @paths << @test_file
    end
  end

  def parse_test_framework
    if @test_args.match(/^spec/) || @test_file && @test_file.match(/_spec.rb/)
      @test_framework = 'rspec'
    elsif @test_file && @test_file.match(/_test.rb/)
      @test_framework = 'ruby -Itest'
    elsif @test_args.match(/^rake/)
      @test_framework = @test_args
      @test_args = nil
    else
      exit_if_no_test_framework
    end
  end
end
