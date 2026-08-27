_herdr() {
    local i cur prev opts cmd
    COMPREPLY=()
    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
        cur="$2"
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
    fi
    prev="$3"
    cmd=""
    opts=""

    for i in "${COMP_WORDS[@]:0:COMP_CWORD}"
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="herdr"
                ;;
            herdr,agent)
                cmd="herdr__subcmd__agent"
                ;;
            herdr,api)
                cmd="herdr__subcmd__api"
                ;;
            herdr,channel)
                cmd="herdr__subcmd__channel"
                ;;
            herdr,completion)
                cmd="herdr__subcmd__completion"
                ;;
            herdr,completions)
                cmd="herdr__subcmd__completion"
                ;;
            herdr,config)
                cmd="herdr__subcmd__config"
                ;;
            herdr,integration)
                cmd="herdr__subcmd__integration"
                ;;
            herdr,notification)
                cmd="herdr__subcmd__notification"
                ;;
            herdr,pane)
                cmd="herdr__subcmd__pane"
                ;;
            herdr,plugin)
                cmd="herdr__subcmd__plugin"
                ;;
            herdr,server)
                cmd="herdr__subcmd__server"
                ;;
            herdr,session)
                cmd="herdr__subcmd__session"
                ;;
            herdr,status)
                cmd="herdr__subcmd__status"
                ;;
            herdr,tab)
                cmd="herdr__subcmd__tab"
                ;;
            herdr,terminal)
                cmd="herdr__subcmd__terminal"
                ;;
            herdr,update)
                cmd="herdr__subcmd__update"
                ;;
            herdr,workspace)
                cmd="herdr__subcmd__workspace"
                ;;
            herdr,worktree)
                cmd="herdr__subcmd__worktree"
                ;;
            herdr__subcmd__agent,attach)
                cmd="herdr__subcmd__agent__subcmd__attach"
                ;;
            herdr__subcmd__agent,explain)
                cmd="herdr__subcmd__agent__subcmd__explain"
                ;;
            herdr__subcmd__agent,focus)
                cmd="herdr__subcmd__agent__subcmd__focus"
                ;;
            herdr__subcmd__agent,get)
                cmd="herdr__subcmd__agent__subcmd__get"
                ;;
            herdr__subcmd__agent,list)
                cmd="herdr__subcmd__agent__subcmd__list"
                ;;
            herdr__subcmd__agent,prompt)
                cmd="herdr__subcmd__agent__subcmd__prompt"
                ;;
            herdr__subcmd__agent,read)
                cmd="herdr__subcmd__agent__subcmd__read"
                ;;
            herdr__subcmd__agent,rename)
                cmd="herdr__subcmd__agent__subcmd__rename"
                ;;
            herdr__subcmd__agent,send-keys)
                cmd="herdr__subcmd__agent__subcmd__send__subcmd__keys"
                ;;
            herdr__subcmd__agent,start)
                cmd="herdr__subcmd__agent__subcmd__start"
                ;;
            herdr__subcmd__agent,wait)
                cmd="herdr__subcmd__agent__subcmd__wait"
                ;;
            herdr__subcmd__api,schema)
                cmd="herdr__subcmd__api__subcmd__schema"
                ;;
            herdr__subcmd__api,snapshot)
                cmd="herdr__subcmd__api__subcmd__snapshot"
                ;;
            herdr__subcmd__channel,set)
                cmd="herdr__subcmd__channel__subcmd__set"
                ;;
            herdr__subcmd__channel,show)
                cmd="herdr__subcmd__channel__subcmd__show"
                ;;
            herdr__subcmd__config,check)
                cmd="herdr__subcmd__config__subcmd__check"
                ;;
            herdr__subcmd__config,reset-keys)
                cmd="herdr__subcmd__config__subcmd__reset__subcmd__keys"
                ;;
            herdr__subcmd__integration,install)
                cmd="herdr__subcmd__integration__subcmd__install"
                ;;
            herdr__subcmd__integration,status)
                cmd="herdr__subcmd__integration__subcmd__status"
                ;;
            herdr__subcmd__integration,uninstall)
                cmd="herdr__subcmd__integration__subcmd__uninstall"
                ;;
            herdr__subcmd__notification,show)
                cmd="herdr__subcmd__notification__subcmd__show"
                ;;
            herdr__subcmd__pane,close)
                cmd="herdr__subcmd__pane__subcmd__close"
                ;;
            herdr__subcmd__pane,current)
                cmd="herdr__subcmd__pane__subcmd__current"
                ;;
            herdr__subcmd__pane,edges)
                cmd="herdr__subcmd__pane__subcmd__edges"
                ;;
            herdr__subcmd__pane,focus)
                cmd="herdr__subcmd__pane__subcmd__focus"
                ;;
            herdr__subcmd__pane,get)
                cmd="herdr__subcmd__pane__subcmd__get"
                ;;
            herdr__subcmd__pane,input)
                cmd="herdr__subcmd__pane__subcmd__input"
                ;;
            herdr__subcmd__pane,layout)
                cmd="herdr__subcmd__pane__subcmd__layout"
                ;;
            herdr__subcmd__pane,list)
                cmd="herdr__subcmd__pane__subcmd__list"
                ;;
            herdr__subcmd__pane,move)
                cmd="herdr__subcmd__pane__subcmd__move"
                ;;
            herdr__subcmd__pane,neighbor)
                cmd="herdr__subcmd__pane__subcmd__neighbor"
                ;;
            herdr__subcmd__pane,process-info)
                cmd="herdr__subcmd__pane__subcmd__process__subcmd__info"
                ;;
            herdr__subcmd__pane,read)
                cmd="herdr__subcmd__pane__subcmd__read"
                ;;
            herdr__subcmd__pane,release-agent)
                cmd="herdr__subcmd__pane__subcmd__release__subcmd__agent"
                ;;
            herdr__subcmd__pane,rename)
                cmd="herdr__subcmd__pane__subcmd__rename"
                ;;
            herdr__subcmd__pane,report-agent)
                cmd="herdr__subcmd__pane__subcmd__report__subcmd__agent"
                ;;
            herdr__subcmd__pane,report-agent-session)
                cmd="herdr__subcmd__pane__subcmd__report__subcmd__agent__subcmd__session"
                ;;
            herdr__subcmd__pane,report-metadata)
                cmd="herdr__subcmd__pane__subcmd__report__subcmd__metadata"
                ;;
            herdr__subcmd__pane,resize)
                cmd="herdr__subcmd__pane__subcmd__resize"
                ;;
            herdr__subcmd__pane,run)
                cmd="herdr__subcmd__pane__subcmd__run"
                ;;
            herdr__subcmd__pane,send-keys)
                cmd="herdr__subcmd__pane__subcmd__send__subcmd__keys"
                ;;
            herdr__subcmd__pane,send-text)
                cmd="herdr__subcmd__pane__subcmd__send__subcmd__text"
                ;;
            herdr__subcmd__pane,split)
                cmd="herdr__subcmd__pane__subcmd__split"
                ;;
            herdr__subcmd__pane,swap)
                cmd="herdr__subcmd__pane__subcmd__swap"
                ;;
            herdr__subcmd__pane,wait-output)
                cmd="herdr__subcmd__pane__subcmd__wait__subcmd__output"
                ;;
            herdr__subcmd__pane,zoom)
                cmd="herdr__subcmd__pane__subcmd__zoom"
                ;;
            herdr__subcmd__plugin,action)
                cmd="herdr__subcmd__plugin__subcmd__action"
                ;;
            herdr__subcmd__plugin,config-dir)
                cmd="herdr__subcmd__plugin__subcmd__config__subcmd__dir"
                ;;
            herdr__subcmd__plugin,disable)
                cmd="herdr__subcmd__plugin__subcmd__disable"
                ;;
            herdr__subcmd__plugin,enable)
                cmd="herdr__subcmd__plugin__subcmd__enable"
                ;;
            herdr__subcmd__plugin,install)
                cmd="herdr__subcmd__plugin__subcmd__install"
                ;;
            herdr__subcmd__plugin,link)
                cmd="herdr__subcmd__plugin__subcmd__link"
                ;;
            herdr__subcmd__plugin,list)
                cmd="herdr__subcmd__plugin__subcmd__list"
                ;;
            herdr__subcmd__plugin,log)
                cmd="herdr__subcmd__plugin__subcmd__log"
                ;;
            herdr__subcmd__plugin,logs)
                cmd="herdr__subcmd__plugin__subcmd__log"
                ;;
            herdr__subcmd__plugin,pane)
                cmd="herdr__subcmd__plugin__subcmd__pane"
                ;;
            herdr__subcmd__plugin,uninstall)
                cmd="herdr__subcmd__plugin__subcmd__uninstall"
                ;;
            herdr__subcmd__plugin,unlink)
                cmd="herdr__subcmd__plugin__subcmd__unlink"
                ;;
            herdr__subcmd__plugin__subcmd__action,invoke)
                cmd="herdr__subcmd__plugin__subcmd__action__subcmd__invoke"
                ;;
            herdr__subcmd__plugin__subcmd__action,list)
                cmd="herdr__subcmd__plugin__subcmd__action__subcmd__list"
                ;;
            herdr__subcmd__plugin__subcmd__log,list)
                cmd="herdr__subcmd__plugin__subcmd__log__subcmd__list"
                ;;
            herdr__subcmd__plugin__subcmd__pane,close)
                cmd="herdr__subcmd__plugin__subcmd__pane__subcmd__close"
                ;;
            herdr__subcmd__plugin__subcmd__pane,focus)
                cmd="herdr__subcmd__plugin__subcmd__pane__subcmd__focus"
                ;;
            herdr__subcmd__plugin__subcmd__pane,open)
                cmd="herdr__subcmd__plugin__subcmd__pane__subcmd__open"
                ;;
            herdr__subcmd__server,agent-manifests)
                cmd="herdr__subcmd__server__subcmd__agent__subcmd__manifests"
                ;;
            herdr__subcmd__server,reload-agent-manifests)
                cmd="herdr__subcmd__server__subcmd__reload__subcmd__agent__subcmd__manifests"
                ;;
            herdr__subcmd__server,reload-config)
                cmd="herdr__subcmd__server__subcmd__reload__subcmd__config"
                ;;
            herdr__subcmd__server,stop)
                cmd="herdr__subcmd__server__subcmd__stop"
                ;;
            herdr__subcmd__server,update-agent-manifests)
                cmd="herdr__subcmd__server__subcmd__update__subcmd__agent__subcmd__manifests"
                ;;
            herdr__subcmd__session,attach)
                cmd="herdr__subcmd__session__subcmd__attach"
                ;;
            herdr__subcmd__session,delete)
                cmd="herdr__subcmd__session__subcmd__delete"
                ;;
            herdr__subcmd__session,list)
                cmd="herdr__subcmd__session__subcmd__list"
                ;;
            herdr__subcmd__session,stop)
                cmd="herdr__subcmd__session__subcmd__stop"
                ;;
            herdr__subcmd__status,client)
                cmd="herdr__subcmd__status__subcmd__client"
                ;;
            herdr__subcmd__status,server)
                cmd="herdr__subcmd__status__subcmd__server"
                ;;
            herdr__subcmd__tab,close)
                cmd="herdr__subcmd__tab__subcmd__close"
                ;;
            herdr__subcmd__tab,create)
                cmd="herdr__subcmd__tab__subcmd__create"
                ;;
            herdr__subcmd__tab,focus)
                cmd="herdr__subcmd__tab__subcmd__focus"
                ;;
            herdr__subcmd__tab,get)
                cmd="herdr__subcmd__tab__subcmd__get"
                ;;
            herdr__subcmd__tab,list)
                cmd="herdr__subcmd__tab__subcmd__list"
                ;;
            herdr__subcmd__tab,rename)
                cmd="herdr__subcmd__tab__subcmd__rename"
                ;;
            herdr__subcmd__terminal,attach)
                cmd="herdr__subcmd__terminal__subcmd__attach"
                ;;
            herdr__subcmd__terminal,session)
                cmd="herdr__subcmd__terminal__subcmd__session"
                ;;
            herdr__subcmd__terminal,title)
                cmd="herdr__subcmd__terminal__subcmd__title"
                ;;
            herdr__subcmd__terminal__subcmd__session,control)
                cmd="herdr__subcmd__terminal__subcmd__session__subcmd__control"
                ;;
            herdr__subcmd__terminal__subcmd__session,observe)
                cmd="herdr__subcmd__terminal__subcmd__session__subcmd__observe"
                ;;
            herdr__subcmd__terminal__subcmd__title,clear)
                cmd="herdr__subcmd__terminal__subcmd__title__subcmd__clear"
                ;;
            herdr__subcmd__terminal__subcmd__title,set)
                cmd="herdr__subcmd__terminal__subcmd__title__subcmd__set"
                ;;
            herdr__subcmd__workspace,close)
                cmd="herdr__subcmd__workspace__subcmd__close"
                ;;
            herdr__subcmd__workspace,create)
                cmd="herdr__subcmd__workspace__subcmd__create"
                ;;
            herdr__subcmd__workspace,focus)
                cmd="herdr__subcmd__workspace__subcmd__focus"
                ;;
            herdr__subcmd__workspace,get)
                cmd="herdr__subcmd__workspace__subcmd__get"
                ;;
            herdr__subcmd__workspace,list)
                cmd="herdr__subcmd__workspace__subcmd__list"
                ;;
            herdr__subcmd__workspace,rename)
                cmd="herdr__subcmd__workspace__subcmd__rename"
                ;;
            herdr__subcmd__workspace,report-metadata)
                cmd="herdr__subcmd__workspace__subcmd__report__subcmd__metadata"
                ;;
            herdr__subcmd__worktree,create)
                cmd="herdr__subcmd__worktree__subcmd__create"
                ;;
            herdr__subcmd__worktree,list)
                cmd="herdr__subcmd__worktree__subcmd__list"
                ;;
            herdr__subcmd__worktree,open)
                cmd="herdr__subcmd__worktree__subcmd__open"
                ;;
            herdr__subcmd__worktree,remove)
                cmd="herdr__subcmd__worktree__subcmd__remove"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        herdr)
            opts="-h -V --help --no-session --session --remote --remote-keybindings --handoff --default-config --skill --version completion completions update status config channel server api workspace worktree tab notification agent pane terminal session integration plugin"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --session)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --remote-keybindings)
                    COMPREPLY=($(compgen -W "local server" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent)
            opts="list get read send-keys prompt rename focus wait attach start explain"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__attach)
            opts="--takeover <TARGET>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__explain)
            opts="-v --file --agent --json --format --verbose [TARGET]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "text json" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__focus)
            opts="<target>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__get)
            opts="<target>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__prompt)
            opts="--wait --until --timeout <TARGET> <TEXT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --until)
                    COMPREPLY=($(compgen -W "idle working blocked done unknown" -- "${cur}"))
                    return 0
                    ;;
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__read)
            opts="--source --lines --format --ansi <TARGET>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --source)
                    COMPREPLY=($(compgen -W "visible recent recent-unwrapped detection" -- "${cur}"))
                    return 0
                    ;;
                --lines)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "text ansi" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__rename)
            opts="--clear <TARGET> [NAME]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__send__subcmd__keys)
            opts="<TARGET> <KEY>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__start)
            opts="--kind --pane --timeout <NAME> [AGENT_ARG]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --kind)
                    COMPREPLY=($(compgen -W "pi claude codex gemini cursor devin agy cline omp mastracode opencode copilot kimi kiro droid amp grok hermes kilo qodercli qwen maki" -- "${cur}"))
                    return 0
                    ;;
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__agent__subcmd__wait)
            opts="--until --timeout <TARGET>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --until)
                    COMPREPLY=($(compgen -W "idle working blocked done unknown" -- "${cur}"))
                    return 0
                    ;;
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__api)
            opts="snapshot schema"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__api__subcmd__schema)
            opts="--json --output"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__api__subcmd__snapshot)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__channel)
            opts="show set"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__channel__subcmd__set)
            opts="stable preview"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__channel__subcmd__show)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__completion)
            opts="bash elvish fish powershell zsh"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__config)
            opts="check reset-keys"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__config__subcmd__check)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__config__subcmd__reset__subcmd__keys)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__integration)
            opts="install uninstall status"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__integration__subcmd__install)
            opts="pi omp claude codex copilot devin droid kimi opencode kilo hermes qodercli qwen cursor mastracode antigravity-cli grok"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__integration__subcmd__status)
            opts="--outdated-only"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__integration__subcmd__uninstall)
            opts="pi omp claude codex copilot devin droid kimi opencode kilo hermes qodercli qwen cursor mastracode antigravity-cli grok"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__notification)
            opts="show"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__notification__subcmd__show)
            opts="--body --position --sound <TITLE>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --body)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --position)
                    COMPREPLY=($(compgen -W "top-left top-right bottom-left bottom-right" -- "${cur}"))
                    return 0
                    ;;
                --sound)
                    COMPREPLY=($(compgen -W "none done request" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane)
            opts="list current get layout process-info neighbor edges focus resize zoom read rename input split swap move close send-text send-keys wait-output run report-agent report-agent-session release-agent report-metadata"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__close)
            opts="<pane_id>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__current)
            opts="--pane --current"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__edges)
            opts="--pane --current"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__focus)
            opts="--direction --pane --current"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --direction)
                    COMPREPLY=($(compgen -W "left right up down" -- "${cur}"))
                    return 0
                    ;;
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__get)
            opts="<pane_id>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__input)
            opts="--pane --current --right-click [PANE_ID]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --right-click)
                    COMPREPLY=($(compgen -W "herdr pane" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__layout)
            opts="--pane --current"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__list)
            opts="--workspace"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__move)
            opts="--tab --split --target-pane --ratio --new-tab --workspace --new-workspace --label --tab-label --focus --no-focus <PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --tab)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --split)
                    COMPREPLY=($(compgen -W "right down" -- "${cur}"))
                    return 0
                    ;;
                --target-pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ratio)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --label)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --tab-label)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__neighbor)
            opts="--direction --pane --current"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --direction)
                    COMPREPLY=($(compgen -W "left right up down" -- "${cur}"))
                    return 0
                    ;;
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__process__subcmd__info)
            opts="--pane --current"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__read)
            opts="--source --lines --format --ansi --raw <PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --source)
                    COMPREPLY=($(compgen -W "visible recent recent-unwrapped detection" -- "${cur}"))
                    return 0
                    ;;
                --lines)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "text ansi" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__release__subcmd__agent)
            opts="--source --agent --seq <PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --source)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seq)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__rename)
            opts="--clear <PANE_ID> [LABEL]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__report__subcmd__agent)
            opts="--source --agent --state --message --seq --agent-session-id --agent-session-path <PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --source)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --state)
                    COMPREPLY=($(compgen -W "idle working blocked unknown" -- "${cur}"))
                    return 0
                    ;;
                --message)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seq)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent-session-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent-session-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__report__subcmd__agent__subcmd__session)
            opts="--source --agent --seq --agent-session-id --agent-session-path --session-start-source <PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --source)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seq)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent-session-id)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent-session-path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --session-start-source)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__report__subcmd__metadata)
            opts="--source --agent --applies-to-source --title --clear-title --display-agent --clear-display-agent --state-label --clear-state-labels --token --clear-token --seq --ttl-ms <PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --source)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --agent)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --applies-to-source)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --title)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --display-agent)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --state-label)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --clear-token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seq)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ttl-ms)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__resize)
            opts="--direction --amount --pane --current"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --direction)
                    COMPREPLY=($(compgen -W "left right up down" -- "${cur}"))
                    return 0
                    ;;
                --amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__run)
            opts="<PANE_ID> <COMMAND>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__send__subcmd__keys)
            opts="<PANE_ID> <KEY>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__send__subcmd__text)
            opts="<PANE_ID> <TEXT>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__split)
            opts="--pane --current --direction --ratio --cwd --env --right-click --focus --no-focus [PANE_ID]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --direction)
                    COMPREPLY=($(compgen -W "right down" -- "${cur}"))
                    return 0
                    ;;
                --ratio)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --right-click)
                    COMPREPLY=($(compgen -W "herdr pane" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__swap)
            opts="--direction --pane --current --source-pane --target-pane"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --direction)
                    COMPREPLY=($(compgen -W "left right up down" -- "${cur}"))
                    return 0
                    ;;
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --source-pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --target-pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__wait__subcmd__output)
            opts="--match --regex --source --lines --timeout --raw <PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --match)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --regex)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --source)
                    COMPREPLY=($(compgen -W "visible recent recent-unwrapped" -- "${cur}"))
                    return 0
                    ;;
                --lines)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__pane__subcmd__zoom)
            opts="--pane --current --toggle --on --off [PANE_ID]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin)
            opts="install uninstall link unlink enable disable list config-dir action log logs pane"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__action)
            opts="list invoke"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__action__subcmd__invoke)
            opts="--plugin <ACTION_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --plugin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__action__subcmd__list)
            opts="--plugin"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --plugin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__config__subcmd__dir)
            opts="<PLUGIN_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__disable)
            opts="<PLUGIN_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__enable)
            opts="<PLUGIN_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__install)
            opts="-y --ref --yes <OWNER/REPO[/SUBDIR]>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --ref)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__link)
            opts="--disabled --enabled <PATH>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__list)
            opts="--plugin --json"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --plugin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__log)
            opts="list"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__log__subcmd__list)
            opts="--plugin --limit"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --plugin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__pane)
            opts="open focus close"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__pane__subcmd__close)
            opts="<PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__pane__subcmd__focus)
            opts="<PANE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__pane__subcmd__open)
            opts="--plugin --entrypoint --placement --workspace --target-pane --direction --cwd --env --focus --no-focus"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --plugin)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --entrypoint)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --placement)
                    COMPREPLY=($(compgen -W "overlay split tab zoomed" -- "${cur}"))
                    return 0
                    ;;
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --target-pane)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --direction)
                    COMPREPLY=($(compgen -W "right down" -- "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__uninstall)
            opts="<PLUGIN>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__plugin__subcmd__unlink)
            opts="<PLUGIN_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__server)
            opts="stop reload-config agent-manifests update-agent-manifests reload-agent-manifests"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__server__subcmd__agent__subcmd__manifests)
            opts="--json"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__server__subcmd__reload__subcmd__agent__subcmd__manifests)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__server__subcmd__reload__subcmd__config)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__server__subcmd__stop)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__server__subcmd__update__subcmd__agent__subcmd__manifests)
            opts="--json"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__session)
            opts="list attach stop delete"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__session__subcmd__attach)
            opts="<NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__session__subcmd__delete)
            opts="--json <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__session__subcmd__list)
            opts="--json"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__session__subcmd__stop)
            opts="--json <NAME>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__status)
            opts="--json server client"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__status__subcmd__client)
            opts="--json"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__status__subcmd__server)
            opts="--json"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__tab)
            opts="list create get focus rename close"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__tab__subcmd__close)
            opts="<tab_id>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__tab__subcmd__create)
            opts="--workspace --cwd --label --env --focus --no-focus"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --label)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__tab__subcmd__focus)
            opts="<tab_id>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__tab__subcmd__get)
            opts="<tab_id>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__tab__subcmd__list)
            opts="--workspace"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__tab__subcmd__rename)
            opts="<TAB_ID> <LABEL>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__terminal)
            opts="attach session title"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__terminal__subcmd__attach)
            opts="--takeover <TERMINAL_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__terminal__subcmd__session)
            opts="control observe"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__terminal__subcmd__session__subcmd__control)
            opts="--takeover --cols --rows <TARGET>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --cols)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rows)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__terminal__subcmd__session__subcmd__observe)
            opts="--cols --rows <TARGET>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --cols)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rows)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__terminal__subcmd__title)
            opts="set clear"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__terminal__subcmd__title__subcmd__clear)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__terminal__subcmd__title__subcmd__set)
            opts="<TITLE>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__update)
            opts="--handoff"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__workspace)
            opts="list create get focus rename report-metadata close"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__workspace__subcmd__close)
            opts="<workspace_id>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__workspace__subcmd__create)
            opts="--cwd --label --env --focus --no-focus"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --label)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --env)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__workspace__subcmd__focus)
            opts="<workspace_id>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__workspace__subcmd__get)
            opts="<workspace_id>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__workspace__subcmd__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__workspace__subcmd__rename)
            opts="<WORKSPACE_ID> <LABEL>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__workspace__subcmd__report__subcmd__metadata)
            opts="--source --token --clear-token --seq --ttl-ms <WORKSPACE_ID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --source)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --clear-token)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --seq)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ttl-ms)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__worktree)
            opts="list create open remove"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__worktree__subcmd__create)
            opts="--workspace --cwd --branch --base --path --label --focus --no-focus"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --branch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --base)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --label)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__worktree__subcmd__list)
            opts="--workspace --cwd"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__worktree__subcmd__open)
            opts="--workspace --cwd --path --branch --label --focus --no-focus"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cwd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --path)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --branch)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --label)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        herdr__subcmd__worktree__subcmd__remove)
            opts="--workspace --force"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --workspace)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _herdr -o nosort -o bashdefault -o default herdr
else
    complete -F _herdr -o bashdefault -o default herdr
fi
