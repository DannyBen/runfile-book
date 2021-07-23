---
icon: dot
order: 90
---

# Program Actions

Commands to define program actions.

```ruby Runfile
# --- Action Definition

usage   "server PORT [--background]"
help    "Start the server, optionally in the background"
option  "-b --background", "Start in the background"
param   "PORT", "Server port to listen on"
env_var "HOST", "Host address to listen to"
example "server 3000 -b"
action  :server do |args|
  # ... action code here
end

# --- Command Prefix

command 'prefix'

# all actions here will be prefixed by 'prefix'

action :anything do
  # ...
end

endcommand
```

## `usage`

=== `usage string`

[!badge variant="warning" text="Optional"] - unless the action requires arguments.

Specify the usage pattern of the following `action`. This string is expected to be in any format recognized by docopt.

In some cases ([compact usage example](https://github.com/DannyBen/runfile/blob/master/examples/l_compact_usage/Runfile)) you may want to force-disable the usage text for the following action. Simply use `usage false`.

```ruby Examples
# The next action (:command) has no arguments.
# Calling `usage` is optional in this case.
usage "command"

# The next action (:greet) has one required argument, called `name`.
usage "greet <name>"

# The next action (:run) has two optional flags.
usage "run [--fast --slow]"

# Disable usage pattern for the next action.
usage false
```
===


## `help`

=== `help string`

[!badge variant="success" text="Optional"]

Specify the help message for the following action. This is the message that will be displayed when you execute `run --help`


```ruby Example
help "Greet the user with a colorful 'Hello!'"
```
===


## `option`

=== `option string, description [, label]`

[!badge variant="warning" text="Optional"] - unless `usage` is ambiguous. 

Specify the help information for any of the option flags. This is the place where you can specify that a certain flag also has a short version.

Normally, the help message for all options appear under the `Options:` caption. If you provide the third `label` argument, it will appear under a different caption.


[!button variant="primary" icon="code-review" text="Options Label Example"](https://github.com/DannyBen/runfile/blob/master/examples/o_options_label/Runfile)

```ruby Example
option "-c --color", "Show message with a color"
option "--force", "Force delete", "Delete Options"
```
===


## `param`

=== `param string, description [, label]`

[!badge variant="success" text="Optional"]

Specify the help information for any of the positional parameters. This is purely decorative and has no impact on the operation of the Runfile.

Normally, the help message for all parameters appear under the `Parameters:` caption. If you provide the third `label` argument, it will appear under a different caption.


[!button variant="primary" icon="code-review" text="Parameters Example"](https://github.com/DannyBen/runfile/blob/master/examples/u_params/Runfile)


```ruby Example
param "PORT", "Server port to listen to"
param "SOURCE", "File to copy", "Copy Options"
```
===


## `env_var`

=== `env_var string, description [, label]`

[!badge variant="success" text="Optional"]

Specify the help information for any environment variables your Runfile may need. This is purely decorative and has no impact on the operation of the Runfile.

Normally, the help message for all environment variables appears under the `Environment Variables:` caption. If you provide the third `label` argument, it will appear under a different caption.

[!button variant="primary" icon="code-review" text="Environment Variables Example"](https://github.com/DannyBen/runfile/blob/master/examples/w_env_vars/Runfile)

```ruby Example
env_var "HOST", "Host address to listen on"
env_var "USER", "SSH user", "SSH Environment Variables"
```
===

## `example`

=== `example string`

[!badge variant="success" text="Optional"]

Add an example command to the general help information. When adding an example, the command `run --help` will show an `Examples:` section at the end of the help text, with all added examples.

You do not need to include the `run` or `run runfile_name` at the beginning of your example text, it is done automatically.

[!button variant="primary" icon="code-review" text="Example Command Example"](https://github.com/DannyBen/runfile/blob/master/examples/q_example/Runfile)

```ruby Example
example "copy source.txt dest.txt --force"
example "copy source.txt --here"
```
===


## `action`


=== `action name [, alias] { block }`

[!badge variant="danger" text="Required"]

Define the actual action block that will be called.

```ruby Example
# If you do not need to process any arguments:
action :command do 
  # your code here
end

# if you want to handle arguments defined in `usage`:
action :command do |args|
  # your code here
  # access any argument with arg['--flagname'] or arg['<arg>']
end

# If you wish to use commands with hyphen, simply use single quotes:
action :'drink-beer' do 
  # your code here
end

# To define an alias (shortcut) to a command, use:
action :command, :c do 
  # your code here
end
```

[!button variant="primary" icon="code-review" text="Alias Example"](https://github.com/DannyBen/runfile/blob/master/examples/p_alias/Runfile)

===

## `command`

=== `command string`

[!badge variant="success" text="Optional"]

The `command` command lets you define a namespace. Once you use this command, any subsequent action will be associated with this namespace.

This is a way to create sub commands.

Call without parameter to revert back to the global namespace.

```ruby Example
command 'server'

# all actions here will be prefixed by 'server'

action :start do
  # ...
end

action :stop do
  # ...
end

endcommand
```

[!button variant="primary" icon="code-review" text="Namespace Example"](https://github.com/DannyBen/runfile/blob/master/examples/f_namespace/Runfile)


===

## `endcommand`

=== `endcommand`

[!badge variant="success" text="Optional"]

Alias for `command`. Intended as a syntactic sugar so that you can end a `command 'namespace'` with `endcommand` instead of an empty `command`.

===