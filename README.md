# Rea::Robot

The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.

## Installation

Not in scope in this version

## Usage

At this stage, the program can be initialize by invoking the main.rb file with a command line argument of filename. such as 

ruby main.rb test.txt

following are the sample data files which are located on the root of this project:

test.txt

test2.txt

test3.txt

test4.txt

test5.txt

## Testing

Have used TDD approach to develop this program and Rspec is being used to test the Robot, Table, Controller etc. Please refer to the spec folder.

## TODOs

In future, a gem will be released on GitHub which can be used with your ruby projects

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rea-robot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
