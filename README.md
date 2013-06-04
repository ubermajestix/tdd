tdd
===  

[![Gem Version](https://badge.fury.io/rb/tdd.png)](http://badge.fury.io/rb/tdd) 
[![Code Climate](https://codeclimate.com/github/ubermajestix/tdd.png)](https://codeclimate.com/github/ubermajestix/tdd)

Watch files and run test/unit or rspec tests when those files change.

Is it awesome?
--------------
Yes.


Examples
--------

Use with test/unit:

    $ tdd test/unit/some_unit_test.rb

Use with rspec:

    $ tdd spec/some_spec.rb
    # Run all specs
    $ tdd spec

Use with rake:

    $ tdd rake test:functional
    $ tdd rake spec

You can pass arguments you would normally pass to `ruby -Itest` or `rspec`
  
    $ tdd -- test/unit/some_unit_test.rb -n /some_test_name/
    $ tdd -- spec/some_spec.rb:42 --fail-fast

By default, tdd will watch files in app, lib, config, test, and spec
directories, if they exist, and run your test command if any file being
watched changes.

tdd also ignores, by default, any files ignored by git, either through the local .gitignore 
file or the global ~/.gitignore_global . You can turn this off by passing --gitignore=false:

    $ tdd --gitignore=false some_file.rb -- test/unit/some_unit.rb -n/some_test_name/

You can specify which files to watch (note the double dashes `--`
separating the files to watch from the test file and options):

    $ tdd lib/some_unit.rb config/setup.rb -- test/unit/some_unit.rb -n/some_test_name/

You can use wildcards in any of the watched filepaths:

    $ tdd lib/other_class.rb app/models/*class.rb -- test/unit/some_class_test.rb -n/some_test_name/

You can tell it to find a similarly named file to your test to watch
with glob mode:

    $ tdd glob -- test/unit/some_unit_test.rb

This will look for `some_unit.rb` in your project and watch it for changes,
along with the test file.

In a Rails project you can ask tdd to watch view and controller files
related to a functional or controller test:

    $ tdd controller -- test/functional/users_controller_test.rb

will watch all view files in app/views/users, the users_controller and the
test file for changes.

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

This library heavily borrows from rego by Ara Howard. Its a really
useful tool and I used it to watch project files and run tests when they
changed. But bouncing between projects that use test/unit and
rspec several times a day there was still overhead in typing out the
list of files to watch and the full test command for rego to work.

