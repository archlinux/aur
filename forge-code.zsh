#compdef forge-code
#
# Forge-Code ZSH plugin
# Intercept lines starting with `:` and route to forge-code binary.
# Works with oh-my-zsh, zinit, prezto, or standalone.
#
# Usage: at any ZSH prompt, type : followed by your prompt
#   : refactor the auth module
#   :sage how does the caching work?
#   :commit
#
# Built-in agents: forge (default, modifies files), sage (read-only), muse (planning)
# Built-in commands: :new, :commit, :conversation, :clone, :retry, :compact, etc.

# Prevent double-loading
[[ -n "${_FORGE_CODE_ZSH_LOADED}" ]] && return 0
_FORGE_CODE_ZSH_LOADED=1

# ------------------------------------------------------------------
# Core: intercept : lines and hand off to forge binary
# ------------------------------------------------------------------
forge-code-zsh-intercept() {
    # Skip if already inside forge (prevent loops)
    [[ -n "${FORGE_ACTIVE}" ]] && return 0

    local cmd="${BUFFER}"
    local first_word="${cmd%% *}"

    # Only intercept if line starts with :
    [[ "${first_word}" != ":" ]] && return 0

    # Strip the leading colon(s)
    cmd="${cmd#:}"
    cmd="${cmd#"${cmd%%[![:space:]]*}"}"

    # Empty after colon — open forge interactively
    if [[ -z "${cmd}" ]]; then
        BUFFER="forge-code"
        return 0
    fi

    # Everything else: pass to forge-code binary
    # Strip any leading agent prefix (e.g. ":sage", ":ask", ":plan", ":muse")
    local agent_cmd=""
    case "${cmd}" in
        sage|ask|plan|muse)
            agent_cmd="${cmd}"
            cmd="${cmd#* }"
            ;;
    esac

    BUFFER="forge-code ${agent_cmd} ${cmd}"
    return 0
}

# Hook into ZLE — intercept just before the line is executed
forge-code-accept-line() {
    forge-code-zsh-intercept
    zle .accept-line
}

# Register widget once
if ! zle -L | grep -q 'forge-code-accept-line'; then
    zle -N accept-line forge-code-accept-line
fi

# ------------------------------------------------------------------
# Completion for forge-code commands (basic — forge provides smart completion)
# ------------------------------------------------------------------
forge-code-zsh-completion() {
    local -a forge_cmds=(
        'new:Start a fresh conversation'
        'conversation:Browse/switch conversations via fzf'
        'clone:Branch the current conversation'
        'retry:Retry the last prompt'
        'compact:Free up token budget'
        'commit:AI writes and commits your diff'
        'commit-preview:Write commit message to buffer for review'
        'agent:Switch active agent (forge/sage/muse)'
        'model:Change model for this session only'
        'config-model:Set default model globally'
        'config-provider:Switch provider globally'
        'info:Show current session info'
        'config:Display effective TOML configuration'
        'config-edit:Open config in $EDITOR'
        'tools:List available tools for current agent'
        'skill:List available skills'
        'suggest:Translate natural language to shell command'
        'edit:Open $EDITOR for complex multi-line prompts'
        'copy:Copy last AI response as markdown to clipboard'
        'dump:Export conversation as JSON'
        'dump-html:Export conversation as formatted HTML'
        'rename:Rename current conversation'
        'ask:Read-only research agent (alias for :sage)'
        'plan:Planning agent (alias for :muse)'
        'sage:Read-only research agent'
        'muse:Planning agent (writes to plans/)'
    )
    _describe 'forge-code commands' forge_cmds
}

# Also complete @ filenames (forge handles the fuzzy search at runtime)
forge-code-file-argument() {
    _files
}

compdef forge-code-zsh-completion forge-code

# ------------------------------------------------------------------
# Optional: key binding hint on first run
# ------------------------------------------------------------------
if [[ -o interact ]] && [[ ! -f "${HOME}/.forge/initialized" ]]; then
    # Don't print during non-interactive loading — zsh -c loads this too
    # Only show if being sourced interactively
    :
fi

# Make forge-code available as a function that routes to /usr/bin/forge-code
forge-code() {
    /usr/bin/forge-code "$@"
}
