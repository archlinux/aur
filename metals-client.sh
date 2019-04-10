#!/bin/bash

set -e

declare -r _INSTALL_DIR='/usr/share/java/metals'
declare _CP="${_INSTALL_DIR}/lib:${_INSTALL_DIR}/metals"

function build_cp {
    for name in $(find ${_INSTALL_DIR}/jars -regex '.*\.jar')
    do
        _CP="${name}:${_CP}"
    done
}

function main {
    build_cp

    # Java options taken from metals-emacs documentation
    # https://scalameta.org/metals/docs/editors/emacs.HTML
    java -XX:+UseG1GC -XX:+UseStringDeduplication -Xss4m -Xms100m -Dmetals.client="${_METALS_CLIENT}" -cp "$_CP" scala.meta.metals.Main $@
}

main $@
