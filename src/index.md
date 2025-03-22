---
label: Overview
icon: home
meta:
  title: Runfile - Command line for your projects
---

# Welcome to Runfile

**Runfile** is a command line utility and a Ruby library that helps you create
feature-rich command line utilities for your projects.

You create a `runfile`, and execute commands with `run command
arguments -and --flags`.

[![Runfile Demo](/assets/cast.gif)](/demo/)
[!button variant="info" icon="screen-full" text="Enlarge Demo"](/demo/)

If you are familiar with Ruby's [Rake][rake], or with Makefile, then the concept
of Runfile should be familiar to you.

Under the hood, Runfile makes use of the [Docopt][docopt] library, so that you
can define your command's argument in an intuitive way, and create expressive
command line utilities with ease.

For example, the below `usage` methods uses a docopt string, to define a command
named `greet` with one required argument (`NAME`) and one optional flag (`
[--color]`).

```ruby
usage 'greet NAME [--color]'
```

## What is Runfile

Runfile is:

1. A command line utility named `run`
2. A Domain Specific Language (DSL) in the form of Ruby methods, to help you
   define your program's behavior.

A simple runfile looks like this:

```ruby
usage  "greet NAME"
help   "Say hello"
action :greet do |args|
  puts "Hello #{args['NAME']}" 
end
```

And this Runfile can be executed by running:

```shell
$ run
Usage:
  run greet NAME
  run (--help | -h)

$ run greet you
Hello you
```

## Examples

The GitHub repository of Runfile contains many examples, showing different
aspects of its functionality.

For convenience, you can also get these examples directly in your terminal by
running any of these commands in a directory without any runfile:

```ruby
$ run example --help

# Show list
$ run example

# Copy examples files for a given example to the current directory
$ run example minimal
```

[!button variant="primary" icon="code-review" text="Open Examples"](https://github.com/DannyBen/runfile/tree/master/examples#readme)


## Installation

Runfile comes as a Ruby gem and is primarily designed for Ruby developers.

To install Runfile, run:

```shell
$ gem install runfile
```

## Quick Start

```shell
$ run new        # create a new runfile
$ run --help     # show the usage patterns
$ vi runfile     # edit the runfile
```



[rake]: https://github.com/ruby/rake
[docopt]: http://docopt.org/
