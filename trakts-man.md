% TRAKTS(1) trakt-scrobbler User Manual
# NAME

trakts - a trakt.tv scrobbler for vlc, plex, mpv, mpc-be/mpc-hc.

# SYNOPSIS

 `trakts` [*OPTION...*] \<command> [args]

# DESCRIPTION

Trakt.tv has a lot of [plugins](https://trakt.tv/apps) to automatically scrobble the movies and episodes you watch from your media center. But there is a dearth of up-to-date apps for syncing your progress on Desktop environments. This is where `trakt-scrobbler` comes in! It is a Python application that runs in the background and monitors your media players for any new activity. When it detects some file being played, it determines the media info (such as name of the movie/show, episode number, etc.) and sends this to trakt servers, so that it can be marked as "Currently Watching" on your profile. No manual intervention required!

# COMMANDS
`auth`
:   Runs the authetication flow for trakt.tv

`autostart`
:   Controls the autostart behaviour of the scrobbler

`backlog`
:   Manage  the  backlog  of  watched media that haven't been synced with trakt servers yet

`config`
:   Edits the scrobbler config settings

`help`
:   Display the manual of a command

`init`
:   Runs the initial setup of the scrobbler

`log`
:   Access the log file, mainly for debugging purposes

`plex`
:   Runs the authetication flow for plex media server.

`run`
:   Run the scrobbler in the foreground

`start`
:   Starts the trakt-scrobbler service. If already running, does nothing

`status`
:   Shows the status trakt-scrobbler service


`stop`
:   Stops the trakt-scrobbler service

`whitelist`
:   Adds the given folder(s) to whitelist

# GLOBAL OPTIONS

`-h`, `--help`
:   Display this help message

`-q`, `--quiet`
:   Do not output any message

`-v`, `--verbose`
:   Increase the verbosity of  messages:  "-v"  for  normal  output,"-vv" for more verbose output and "-vvv" for debug

`-V`, `--version`
:   Display this application version

`--ansi`, `--no-ansi`
:   Force/Disable ANSI output

`-n`, `--no-interaction`
:   Do not ask any interactive question

# COMMANDS SECTION

`auth` [-f]
:   `-f`    Force run the flow, ignoring already existing credentials

`autostart` [enable|disable]
   `enable`    Installs and enables the autostart service
   `disable`   Disables the autostart service

`backlog` [list|clear]
   `clear`  Try to sync the backlog with trakt servers
   `list`   List the files in backlog

`config` list [--all]
   `list`   Lists configuration settings. By default, only overriden values are shown
      `--all`  Include default values too

`config` set [--add] \<key> \<value1> ... [<valueN>]
   `set` Set the value for a config parameter.
      Separate multiple values with spaces.
      For values containing space(s), surround them with double-quotes

      <key>   Config parameter
      <value> Setting value
      --add  In case of list values, add them to the end
             instead of overwriting
      Eg:
           $ trakts config set players.monitored mpv vlc mpc-be
           will set: players.monitored = ['mpv', 'vlc' ]
           $ trakts config set --add players.monitored plex mpc-hc
           will add: players.monitored = ['mpv', 'vlc', 'plex', 'mpc-hc]
`config` unset \<key>
   `unset` Reset a config value to its default
   \<key>   Config parameter

`help` [\<command1>] ... [\<commandN>]
:   \<command>  The command name

`log` [path|open]
   `open`   Open the latest log file in your default editor
   `path`   Prints the location of the log file

`plex` [-f]
:  `-f`    Force run the flow, ignoring already existing credentials

`start` [-r]
:  -r    Restart the service
# AUTHORS

This program is written by Krut Patel(@iamkroot:github.com).

This manpage is written by Mubashshir(@ahmubashshir:github.com).

# REPORTING BUGS
Report bugs and issues to [github](https://github.com/iamkroot/trakt-scrobbler/issues).
