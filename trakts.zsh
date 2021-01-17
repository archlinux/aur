#compdef trakts
#
# Zsh auto complete function for trakts
#

# Section: trakts autostart
_trakts_autostart_actions()
{
    local actions
    actions=(
        "enable:Install and enable the autostart service"
        "disable:Disable the autostart service"
    )
    _describe 'actions' actions
}
# command: trakts autostart
_trakts_autostart()
{
    _arguments '1:action:_trakts_autostart_actions'
}
# Section: trakts backlog
_trakts_backlog_actions()
{
    local actions
    actions=(
        "clear:Try to sync the backlog with trakt servers"
        "list:List the files in backlog"
    )
    _describe 'actions' actions
}
# command: trakts backlog
_trakts_backlog()
{
    _arguments '1:action:_trakts_backlog_actions'
}

# Section: trakts config
_trakts_config_actions()
{
    local actions
    actions=(
        'list:List configuration settings'
        'set:Set the value for a config parameter'
        'unset:Reset a config value to its default'
    )
    _describe 'actions' actions
}
# command: trakts config
_trakts_config()
{
    local args line
    args=(
        '1:action:_trakts_config_actions'
        '*::arg:->args'
    )
    _arguments -s "${args[@]}"
    case $line[1] in
        (list)
            _arguments '--all[Include default values]'
        ;;
        (set)
            _trakts_config_set "$@"
        ;;
        (unset)
            _trakts_config_list "$@"
        ;;
    esac
}
# command: trakts config set
_trakts_config_set()
{
    local args
    args=(
        '1:key:_trakts_config_list'
        '2:value:'
        '--add[Append to list instead of overwriting]'
    )
    _arguments -s "${args[@]}"
}
# command: trakts config list
_trakts_config_list()
{
    local keys
    keys=(
        $(trakts config list --all|cut -d\  -f1)
    )
    _describe 'keys' keys
}

# Section: trakts init
_trakts_init_actions()
{
    true
}
# command: trakts init
_trakts_init()
{
    _arguments '1:action:_trakts_init_actions'
}
# no subcommand or options provided

# Section: trakts log
_trakts_log_actions()
{
    local actions
    actions=(
        'open:Open Latest log.'
        'path:Prints the location of the log file'
    )
    _describe 'actions' actions
}
# command: trakts log
_trakts_log()
{
    _arguments '1:action:_trakts_log_actions'
}

# Section: trakts plex
# command: trakts plex
_trakts_plex()
{
    _arguments -s '-f[Force run the flow]'
}

# Section: trakts run
# command: trakts run
_trakts_run()
{
    true
}

# Section: trakts start
# command: trakts start
_trakts_start()
{
    _arguments -s {-r,--restart}'[Restart the service]'
}

# Section: trakts status
# command: trakts status
_trakts_status()
{
    true
}

# Section: trakts stop
# command: trakts stop
_trakts_stop()
{
    true
}

# Section: trakts whitelist
_trakts_whitelist_actions()
{
    local actions
    actions=(
        'add:Add folder(s) to whitelist'
        'remove:Remove folder(s) from whitelist'
        'show:Show the current whitelist'
        'test:Check whether the given file/folder is whitelisted'
    )
    _describe 'actions' actions
}
# command: trakts whitelist
_trakts_whitelist()
{
    local line state
    _arguments '1:action:_trakts_whitelist_actions' '::path:->path'
    case $line[1] in
        (add)
            _path_files -/
        ;;
        (test)
            _path_files
        ;;
        (*) true;;
    esac
}

# Section: trakts
_trakts_actions()
{
    local state actions
    actions=(
        "auth:Runs the authetication flow for trakt.tv"
        "autostart:Controls the autostart behaviour of the scrobbler"
        "backlog:Manage the not-yet-synced backlog of watched media"
        "config:Edit the scrobbler config settings"
        "help:Display the manual of a command"
        "init:Run the initial setup of the scrobble"
        "log:Access the log file"
        "plex:Run the authetication flow for plex media server"
        "run:Run the scrobbler in the foreground"
        "start:Start the trakt-scrobbler service"
        "status:Show the status trakt-scrobbler service"
        "stop:Stop the trakt-scrobbler service"
        "whitelist:Add the given folder(s) to whitelist"
    )
    _describe 'actions' actions
}
# command: trakts
local line args
args=(
    "1:actions:_trakts_actions"
    {-h,--help}"[Display help message]"
    {-q,--quiet}"[Do not output any message]"
    {-v,--verbose}"[Increase the verbosity of messages]"
    {-V,--version}"[Display this application version]"
    {-n,--no-interaction}"[Do not ask any interactive question]"
    "--ansi[Force ANSI output]"
    "--no-ansi[Disable ANSI output]"
    "*::arg:->args"
)
_arguments -s "${args[@]}"
case $line[1] in
    (help)
        case $CURRENT in
            (2)
                _trakts_actions "$@"
            ;;
            (3)
                if [ -n "$functions[_trakts_$line[2]_actions]" ];then
                    _trakts_$line[2]_actions "$@"
                fi
            ;;
            (4)
                if [ -n "$functions[_trakts_$line[2]_$line[3]_actions]" ];then
                    _trakts_$line[2]_$line[3]_actions "$@"
                fi
            ;;
            (5)
                if [ -n "$functions[_trakts_$line[2]_$line[3]_$line[4]_actions]" ];then
                    _trakts_$line[2]_$line[3]_$line[4]_actions "$@"
                fi
            ;;
            (6)
                if [ -n "$functions[_trakts_$line[2]_$line[3]_$line[4]_$line[5]_actions]" ];then
                    _trakts_$line[2]_$line[3]_$line[4]_$line[5]_actions "$@"
                fi
            ;;
        esac
    ;;
    (auth)
        _arguments '-f[Force run the flow]'
    ;;
    (*)
        if [ -n "$functions[_trakts_$line[1]]" ] ;then
            _trakts_$line[1] "$@"
        fi
    ;;
esac
