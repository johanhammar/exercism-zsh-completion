# Exercism autocompletion for oh-my-zsh
# Author: Johan Hammar (@johanh)
_exercism() {

local -a _1st_arguments
_1st_arguments=(
  'debug:Outputs useful debug information.'
  'configure:Writes config values to a JSON file.'
  ''{fetch,f}':Fetches the next unsubmitted problem in each track.'
  ''{restore,r}':Downloads your the most recent iteration for each of your solutions on exercism.io.'
  'skip:Skips a problem given a track ID and problem slug.'
  ''{submit,s}':Submits a new iteration to a problem on exercism.io.'
  'upgrade:Upgrades the CLI to the latest released version.'
  ''{tracks,t}':Lists the available language tracks.'
  ''{open,op}':Opens exercism.io to your most recent iteration of a problem given the track ID and problem slug.'
  ''{download,dl}':Downloads a solution given the ID of the latest iteration.'
  ''{list,li}':Lists the available problems for a language track, given its ID.'
  ''{status,st}':Fetches information about your progress with a given language track.'
  ''{help,h}':Shows a list of commands or help for one command'
)

_arguments \
  {--config,-c}'[path to config file \[$EXERCISM_CONFIG_FILE, $XDG_CONFIG_HOME\]]' \
  '--verbose[turn on verbose logging]' \
  {--help,-h}'[show help]' \
  {--version,-v}'[print the version]' \
  '*:: :->subcmds' && return 0

if (( CURRENT == 1 )); then
	_describe -t commands "exercism subcommand" _1st_arguments
	return
fi

local -a command_args
case "$words[1]" in
  configure)
    _arguments \
      '(--dir -d)'{--dir,-d}'[path to exercises directory]' \
      '(--host -u)'{--host,-u}'[exercism api host]' \
      '(--key -k)'{--key,-k}'[exercism.io API key (see http://exercism.io/account/key)]' \
      '(--api -a)'{--api,-a}'[exercism xapi host]'
  ;;
  submit)
    _arguments \
      '--test[allow submission of test files]' \
      '--comment[includes a comment with the submission]'
  ;;
    *)
  ;;
esac
}

compdef '_exercism' exercism
