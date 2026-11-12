package require ::quartus::project
set relay [file normalize [lindex $quartus(args) 0]]
if {![file executable [file join $relay vsim]]} {
    error "Questa launcher is missing from $relay"
}
foreach name {EDA_TOOL_PATH_QUESTA_INTEL EDA_TOOL_PATH_QUESTASIM} {
    puts "$name: [get_user_option -name $name] -> $relay"
    set_user_option -name $name $relay
}
