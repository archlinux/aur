#!/bin/bash

GIT_FLOW_EXEC=/usr/bin/git-flow
GIT_FLOW_BASH_COMP=/usr/share/bash-completion/completions/git-flow


generate_bash_completion(){
    GFT_GEN_COMPLETION=1 "$GIT_FLOW_EXEC" > "$GIT_FLOW_BASH_COMP"
    chmod 644 "$GIT_FLOW_BASH_COMP"
}

remove_bash_completion(){
    rm -f "$GIT_FLOW_BASH_COMP"
}


post_install() {
    generate_bash_completion
}

post_upgrade() {
    generate_bash_completion
}

post_remove() {
    remove_bash_completion
}