#!/bin/env tclsh
package require Mk4tcl
package require zlib
package require vfs::mk4
package require vfs::cookfs
package require tdom

if {$argc < 2} {
    puts "Usage: installFiles.tcl <installer> <install dir>"
    exit 1
}

set installer [lindex $argv 0]

set fd [open $installer rb]
seek $fd -16 end
binary scan [read $fd 16] IIII guard1 offset guard2 guard3
seek $fd [expr {-16-$offset}] end

mk::file open db
mk::file load db $fd
close $fd

vfs::filesystem mount installerFiles [list vfs::mk4::handler db]

set fd [open installerFiles/cookfsinfo.txt r]
set cookfsinfo [read $fd]
close $fd

lappend auto_path [file normalize installerFiles/libraries]
package require Tcllzmadec

set fd [open installerFiles/project.xml r]
set proj [dom parse -channel $fd]
close $fd

set fd [open installerFiles/manifest.txt r]
set manifest [read $fd]
close $fd

set components [$proj selectNodes /project//componentList/component]
set variables [$proj selectNodes /project/initializationActionList//setInstallerVariable]
set mappings [dict create]
foreach component $components {
    foreach folder [$component selectNodes folderList/folder] {
        dict set mappings [string cat [[$component selectNodes name] text] "/" [[$folder selectNodes name] text]] [[$folder selectNodes destination] text]
    }
}

vfs::cookfs::Mount {*}$cookfsinfo $installer files

set installdir [lindex $argv 1]

proc setVariables {} {
    uplevel {
        global variables
        global argc
        global argv
        foreach var $variables {
            set varname [$var selectNodes name]
            set varvalue [$var selectNodes value]
            if {$varname ne "" && $varvalue ne ""} {
                set [$varname text] [$varvalue text]
            }
        }
        if {$argc >= 3} {
            dict for {var value} [lindex $argv 2] {
                set $var $value
            }
        }
    }
}

proc extractFiles {dic type} {
    global mappings
    global installdir

    setVariables

    dict for {path fstat} $dic {
        set filt [dict filter $mappings script {k v} {
            set a [string first $k $path 0]
            expr !$a
        }]

        if {[dict size $filt] == 1} {
            set mapping [dict get $filt]
            set dest [subst -nobackslashes -nocommands [lindex $mapping 1]]/
            set final_path [string replace $path 0 [string length [lindex $mapping 0]] $dest]

            switch $type {
                "directory" {
                    file mkdir $final_path
                    set fatt [lindex $fstat 1]
                    file attributes $final_path -permissions [string range $fatt [expr {[string length $fatt]-4}] [string length $fatt]]
                }
                "file" {
                    if {[file exists $final_path]} {
                        file delete -force -- $final_path
                    }
                    set fatt [lindex $fstat 1]
                    set fout [open $final_path wb [string range $fatt [expr {[string length $fatt]-4}] [string length $fatt]]]
                    set fin [open files/$path rb]
                    fcopy $fin $fout
                    close $fin
                    set counter 1
                    while {[file exists files/${path}___bitrockBigFile$counter]} {
                        set fin [open files/${path}___bitrockBigFile$counter rb]
                        fcopy $fin $fout
                        close $fin
                        incr counter
                    }
                    close $fout
                }
                "link" {
                    exec ln -s [lindex $fstat 1] $final_path
                }
            }
        }
    }
}

setVariables

foreach mapping [dict values $mappings] {
    file mkdir [subst -nobackslashes -nocommands $mapping]
}

set directories [dict filter $manifest script {k v} {
    expr {[lindex $v 0] eq "directory"}
}]

set files [dict filter $manifest script {k v} {
    expr {[lindex $v 0] eq "file"}
}]

set links [dict filter $manifest script {k v} {
    expr {[lindex $v 0] eq "link"}
}]

extractFiles $directories "directory"
extractFiles $files "file"
extractFiles $links "link"
