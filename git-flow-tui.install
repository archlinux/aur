#!/bin/bash

GIT_FLOW_TUI_EXEC=/usr/bin/git-flow-tui
GIT_FLOW_EXEC=/usr/bin/git-flow
GIT_FLOW_BASH_COMP=/usr/share/bash-completion/completions/git-flow


generate_bash_completion(){
    GFT_GEN_COMPLETION=1 "$GIT_FLOW_EXEC" > "$GIT_FLOW_BASH_COMP"
    chmod 644 "$GIT_FLOW_BASH_COMP"
}

remove_bash_completion(){
    rm -f "$GIT_FLOW_BASH_COMP"
}

create_git_flow_symlink(){
    ln -sfn "$GIT_FLOW_TUI_EXEC" "$GIT_FLOW_EXEC"
}

remove_git_flow_symlink(){
    rm -f "$GIT_FLOW_EXEC"
}

post_install() {
    create_git_flow_symlink
    generate_bash_completion
}

post_upgrade() {
    create_git_flow_symlink
    generate_bash_completion
}

post_remove() {
    remove_git_flow_symlink
    remove_bash_completion
}