function flush_ui_block() {
    if (!in_ui_block)
        return

    if (has_jcl_setup) {
        sub(/^\*OpenUI /, "*JCLOpenUI ", ui_block)
        sub(/\n\*CloseUI:/, "\n*JCLCloseUI:", ui_block)
    }

    printf "%s", ui_block
    ui_block = ""
    in_ui_block = 0
    has_jcl_setup = 0
}

/^\*cupsFilter:/ &&
/application\/vnd\.cups-pdf/ &&
/(ptps|phase2filter)"[[:space:]]*$/ {
    sub(/application\/vnd\.cups-pdf/, "application/pdf")
    print
    next
}

/^\*OpenUI / {
    flush_ui_block()
    in_ui_block = 1
    ui_block = $0 ORS
    next
}

in_ui_block {
    ui_block = ui_block $0 ORS

    if ($0 ~ /^\*OrderDependency:.*[[:space:]]JCLSetup[[:space:]]/)
        has_jcl_setup = 1

    if ($0 ~ /^\*CloseUI:/)
        flush_ui_block()

    next
}

{ print }

END {
    flush_ui_block()
}
