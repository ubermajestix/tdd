tdd
===  

[![Gem Version](https://badge.fury.io/rb/tdd.png)](http://badge.fury.io/rb/tdd) 
[![Code Climate](https://codeclimate.com/github/ubermajestix/tdd.png)](https://codeclimate.com/github/ubermajestix/tdd)

#### A simple command line tool for running tests when files change. 
##### Yes, it is awesome. :red_circle: :green_heart: :repeat:

Examples
--------

### Test::Unit

    $ tdd test/unit/some_unit_test.rb

### RSpec

    $ tdd spec/some_spec.rb
    # Run all specs
    $ tdd spec

### Rake

    $ tdd rake test:functional
    $ tdd rake spec

### Pass framework specific arguments
You can pass arguments you would normally pass to `ruby -Itest` or `rspec`, note the double-dash "--".
  
    $ tdd -- test/unit/some_unit_test.rb -n /some_test_name/
    $ tdd -- spec/some_spec.rb:42 --fail-fast

### Globs by default
By default, tdd will search for similarly named files to your test to watch. tdd will look for `some_unit.rb` 
in your project and watch it for changes, along with the test file.
    
    $ tdd -- test/unit/some_unit.rb
    Running: ruby -Itest test/unit/some_unit_test.rb
    Watching:
    /Users/ubermajestix/some_project/lib/some_unit.rb
    /Users/ubermajestix/some_project/lib/modules/plugins/stuff/some_unit.rb
    /Users/ubermajestix/some_project/test/unit/some_unit_test.rb

### All of the files
Run tdd in the "all" mode to watch all files in app, lib, config, test, and spec
directories, if they exist. The double-dash "--" seperates tdd's modes from the testing command.

    $ tdd all -- test/unit/some_unit_test.rb
    Running: ruby -Itest test/unit/some_unit_test.rb
    Watching 3417 files in app/ lib/ config/ test/ spec/

### Some of the files
You can specify which files to watch, again, note the double-dash "--"
separating the files to watch from the test file and options):

    $ tdd lib/some_unit.rb config/setup.rb -- test/unit/some_unit_test.rb -n/some_test_name/
### Wildcard the files
You can use wildcards in any of the watched filepaths:

    $ tdd lib/other_class.rb app/models/*class.rb -- test/unit/some_class_test.rb -n/some_test_name/

### Respects gitignore
By default tdd ignores any files ignored by git, either through the local .gitignore 
file or the global ~/.gitignore_global . You can turn this off by passing --gitignore=false:

    $ tdd --gitignore=false some_file.rb -- test/unit/some_unit.rb -n/some_test_name/

### Weird Rails specific mode
In a Rails project you can ask tdd to watch view and controller files
related to a functional or controller test:

    $ tdd controller -- test/functional/users_controller_test.rb

will watch all view files in app/views/users, the users_controller and the
test file for changes.

### Now with more Growl
Supports Growl notifs. To enable, pass in --growl like so:

    $ tdd controller --growl -- spec/controllers/users_controller_spec.rb

In Growl's preferences you can enable/disable both 'passed' and 'failed' notifs.

Isn't this what Guard does?
---------------------------
Yeah, but its more flexible. I found myself wanting to use rspec's
feature of running a single test, or group of tests, over and over while
I tdd'd a class. With Guard, I would have to change the Guardfile to
use different command line options for rspec. Maybe there's a way to
solve this now, but in general Guard is just too much overhead for me.

This library heavily borrows from [rego by Ara Howard](http://github.com/ahoward/rego). Its a really
useful tool and I used it to watch project files and run tests when they
changed. But bouncing between projects that use test/unit and
rspec several times a day there was still overhead in typing out the
list of files to watch and the full test command for rego to work.
Thus, tdd was born. 

Contributors
----
* [ubermajestix](http://ubermajestix.com)
* [Dave Sims](https://github.com/davesims)

