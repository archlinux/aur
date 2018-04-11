#!/bin/sh
# The next line is executed by /bin/sh, but not tcl \
exec wish "$0" -- $*

## iSpin GUI -- http::/spinroot.com/
## (c) 2010-2014 All Rights Reserved
## This software is for educational purposes only.
## No guarantee whatsoever is expressed or implied
## by the distribution of this code.

wm title . "ispin"
wm geometry . 1200x600+20+20

set xversion "iSpin Version 1.1.4 -- 27 November 2014"
set version "Spin Version unknown";   # updated below
set Unix 1;                           # updated below

### Tools
	set SPIN    spin   ;# essential
	set CC      gcc    ;# essential
	set DOT     dot    ;# recommended, for automata view
#	set DOT     "C:/Program\ Files\ \(x86\)/Graphviz2.36/bin/dot"
	set SWARM   swarm  ;# optional, for swarm verification panel
	set CURL    curl   ;# optional, for version check information

	set CC_alt1 gcc-4
	set CC_alt2 gcc-3
	set RM      "rm -f"
	set KILL    "kill -2"

	## check if we have the right version of Spin
	if {[auto_execok $SPIN] == "" \
	||  [auto_execok $SPIN] == 0} {
		puts "No executable $SPIN found..."
		puts "iSpin requires Spin Version 6.0 or later"
		exit 0
	} else {
		catch { set fd [open "|$SPIN -V" r] } errmsg
		if {$fd == -1} {
			puts "$errmsg"
			exit 0
		} else {
			set version "Spin Version unknown"
			if {[gets $fd line] > -1} {
				set version "$line"
			}
			catch "close $fd"
		}
		if {[string first "Spin Version "  $version] < 0 \
		||  [string first "Spin Version 5" $version] >= 0 \
		||  [string first "Spin Version 4" $version] >= 0 \
		||  [string first "Spin Version 3" $version] >= 0 } {
			puts "iSpin requires Spin Version 6.0 or later"
			puts "You have: $version"
			exit 0
	}	}

	if {[file isfile $CC] == 0} {	;# symbolic link
		if {[auto_execok $CC_alt1] != ""} {
			set CC $CC_alt1
		} elseif {[auto_execok $CC_alt2] != ""} {
			set CC $CC_alt2
	}	}

	if [info exists tcl_platform] {
		set sys $tcl_platform(platform)
		if {[string match windows $sys]} {
			set Unix 0	;# Windows
	}	}

### Some other configurable items
	set ScrollBarSize	10

### Colors
	set MBG azure     ;# menu
	set MFG black

	set XBB ivory     ;# MSC canvas color
	set XBG black     ;# MSC rectangle border
	set XFG	gold      ;# MSC rectangles
	set XTX black     ;# MSC text
	set XAR blue      ;# MSC arrows
	set XPR gray      ;# MSC process line color

	set TBG	azure	  ;#WhiteSmoke	;# text window
	set TFG	black

	set CBG black     ;# command window
	set CFG azure     ;# gold

	set NBG	darkblue  ;# main tabs
	set NFG gold

	set SFG	red       ;# text selections - standout from TBG

	set LTLbg darkblue
	set LTL_Panel	0 ;# mostly overtaken by extensions in 6.0
	set V_Panel_1	0 ;# Advanced verification options 1: Error trapping
	set V_Panel_3	0 ;# ditto 3: Default Parameters

### Fonts
	set HV0 "helvetica 10"
	set HV1 "helvetica 11"

### end of configurable items ##########################################
##                                                                    ##
## The first part of this code is based on the BWidget-1.9.2 package  ##
## To skip ahead to where the iSpin specific code starts,             ##
## search for "iSpin GUI code" which starts about half-way down       ##
##                                                                    ##
########################################################################

#######
## The BWidget Toolkit comes with the following
## license text that is reproduced here.
#######
## BWidget ToolKit
## Copyright (c) 1998-1999 UNIFIX.
## Copyright (c) 2001-2002 ActiveState Corp.
## 
## The following terms apply to all files associated with the software
## unless explicitly disclaimed in individual files.
## 
## The authors hereby grant permission to use, copy, modify, distribute,
## and license this software and its documentation for any purpose, provided
## that existing copyright notices are retained in all copies and that this
## notice is included verbatim in any distributions. No written agreement,
## license, or royalty fee is required for any of the authorized uses.
## Modifications to this software may be copyrighted by their authors
## and need not follow the licensing terms described here, provided that
## the new terms are clearly indicated on the first page of each file where
## they apply.
## 
## IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY PARTY
## FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
## ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION, OR ANY
## DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED OF THE
## POSSIBILITY OF SUCH DAMAGE.
## 
## THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
## INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.  THIS SOFTWARE
## IS PROVIDED ON AN "AS IS" BASIS, AND THE AUTHORS AND DISTRIBUTORS HAVE
## NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
## MODIFICATIONS.
## 
## GOVERNMENT USE: If you are acquiring this software on behalf of the
## U.S. government, the Government shall have only "Restricted Rights"
## in the software and related documentation as defined in the Federal
## Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
## are acquiring the software on behalf of the Department of Defense, the
## software shall be classified as "Commercial Computer Software" and the
## Government shall have only "Restricted Rights" as defined in Clause
## 252.227-7013 (c) (1) of DFARs.  Notwithstanding the foregoing, the
## authors grant the U.S. Government and others acting in its behalf
## permission to use and distribute the software in accordance with the
## terms specified in this license.
#######

namespace eval Widget {}

proc Widget::_opt_defaults {{prio widgetDefault}} {
    if {$::tcl_version >= 8.4} {
	set plat [tk windowingsystem]
    } else {
	set plat $::tcl_platform(platform)
    }
    switch -exact $plat {
	"aqua" {
	}
	"win32" -
	"windows" {
	    option add *ListBox.background	SystemWindow $prio
	    option add *Dialog.padY		0 $prio
	    option add *Dialog.anchor		e $prio
	}
	"x11" -
	default {
	    option add *Scrollbar.width		12 $prio
	    option add *Scrollbar.borderWidth	1  $prio
	    option add *Dialog.separator	1  $prio
	    option add *MainFrame.relief	raised $prio
	    option add *MainFrame.separator	none   $prio
	}
    }
}

Widget::_opt_defaults

bind Entry <<TraverseIn>> { %W selection range 0 end; %W icursor end }
bind all   <Key-Tab>      { Widget::traverseTo [Widget::focusNext %W] }
bind all   <<PrevWindow>> { Widget::traverseTo [Widget::focusPrev %W] }

# ----------------------------------------------------------------------------
#  widget.tcl -- part of Unifix BWidget Toolkit
# ----------------------------------------------------------------------------

# Uses newer string operations
package require Tcl 8.1.1

namespace eval Widget {
    variable _optiontype
    variable _class
    variable _tk_widget

    # This controls whether we try to use themed widgets from Tile
    variable _theme 0

    variable _aqua [expr {($::tcl_version >= 8.4) &&
			  [string equal [tk windowingsystem] "aqua"]}]

    array set _optiontype {
        TkResource Widget::_test_tkresource
        BwResource Widget::_test_bwresource
        Enum       Widget::_test_enum
        Int        Widget::_test_int
        Boolean    Widget::_test_boolean
        String     Widget::_test_string
        Flag       Widget::_test_flag
        Synonym    Widget::_test_synonym
        Color      Widget::_test_color
        Padding    Widget::_test_padding
    }

    proc use {} {}
}

proc Widget::tkinclude { class tkwidget subpath args } {
    foreach {cmd lopt} $args {
        switch -- $cmd {
            remove {
                foreach option $lopt {
                    set remove($option) 1
                }
            }
            include {
                foreach option $lopt {
                    set include($option) 1
                }
            }
            prefix {
                set prefix [lindex $lopt 0]
                foreach option [lrange $lopt 1 end] {
                    set rename($option) "-$prefix[string range $option 1 end]"
                }
            }
            rename     -
            readonly   -
            initialize {
                array set $cmd $lopt
            }
            default {
                return -code error "invalid argument \"$cmd\""
            }
        }
    }

    namespace eval $class {}
    upvar 0 ${class}::opt classopt
    upvar 0 ${class}::map classmap
    upvar 0 ${class}::map$subpath submap
    upvar 0 ${class}::optionExports exports

    set foo [$tkwidget ".ericFoo###"]
    # create resources informations from tk widget resources
    foreach optdesc [_get_tkwidget_options $tkwidget] {
        set option [lindex $optdesc 0]
        if { (![info exists include] || [info exists include($option)]) &&
             ![info exists remove($option)] } {
            if { [llength $optdesc] == 3 } {
                # option is a synonym
                set syn [lindex $optdesc 1]
                if { ![info exists remove($syn)] } {
                    # original option is not removed
                    if { [info exists rename($syn)] } {
                        set classopt($option) [list Synonym $rename($syn)]
                    } else {
                        set classopt($option) [list Synonym $syn]
                    }
                }
            } else {
                if { [info exists rename($option)] } {
                    set realopt $option
                    set option  $rename($option)
                } else {
                    set realopt $option
                }
                if { [info exists initialize($option)] } {
                    set value $initialize($option)
                } else {
                    set value [lindex $optdesc 1]
                }
                if { [info exists readonly($option)] } {
                    set ro $readonly($option)
                } else {
                    set ro 0
                }
                set classopt($option) \
			[list TkResource $value $ro [list $tkwidget $realopt]]

		# Add an option database entry for this option
		set optionDbName ".[lindex [_configure_option $realopt ""] 0]"
		if { ![string equal $subpath ":cmd"] } {
		    set optionDbName "$subpath$optionDbName"
		}
		option add *${class}$optionDbName $value widgetDefault
		lappend exports($option) "$optionDbName"

		# Store the forward and backward mappings for this
		# option <-> realoption pair
                lappend classmap($option) $subpath "" $realopt
		set submap($realopt) $option
            }
        }
    }
    ::destroy $foo
}

proc Widget::bwinclude { class subclass subpath args } {
    foreach {cmd lopt} $args {
        switch -- $cmd {
            remove {
                foreach option $lopt {
                    set remove($option) 1
                }
            }
            include {
                foreach option $lopt {
                    set include($option) 1
                }
            }
            prefix {
                set prefix [lindex $lopt 0]
                foreach option [lrange $lopt 1 end] {
                    set rename($option) "-$prefix[string range $option 1 end]"
                }
            }
            rename     -
            readonly   -
            initialize {
                array set $cmd $lopt
            }
            default {
                return -code error "invalid argument \"$cmd\""
            }
        }
    }

    namespace eval $class {}
    upvar 0 ${class}::opt classopt
    upvar 0 ${class}::map classmap
    upvar 0 ${class}::map$subpath submap
    upvar 0 ${class}::optionExports exports
    upvar 0 ${subclass}::opt subclassopt
    upvar 0 ${subclass}::optionExports subexports

    # create resources informations from BWidget resources
    foreach {option optdesc} [array get subclassopt] {
	set subOption $option
        if { (![info exists include] || [info exists include($option)]) &&
             ![info exists remove($option)] } {
            set type [lindex $optdesc 0]
            if { [string equal $type "Synonym"] } {
                # option is a synonym
                set syn [lindex $optdesc 1]
                if { ![info exists remove($syn)] } {
                    if { [info exists rename($syn)] } {
                        set classopt($option) [list Synonym $rename($syn)]
                    } else {
                        set classopt($option) [list Synonym $syn]
                    }
                }
            } else {
                if { [info exists rename($option)] } {
                    set realopt $option
                    set option  $rename($option)
                } else {
                    set realopt $option
                }
                if { [info exists initialize($option)] } {
                    set value $initialize($option)
                } else {
                    set value [lindex $optdesc 1]
                }
                if { [info exists readonly($option)] } {
                    set ro $readonly($option)
                } else {
                    set ro [lindex $optdesc 2]
                }
                set classopt($option) \
			[list $type $value $ro [lindex $optdesc 3]]

		# Add an option database entry for this option
		foreach optionDbName $subexports($subOption) {
		    if { ![string equal $subpath ":cmd"] } {
			set optionDbName "$subpath$optionDbName"
		    }
		    # Only add the option db entry if we are overriding the
		    # normal widget default
		    if { [info exists initialize($option)] } {
			option add *${class}$optionDbName $value \
				widgetDefault
		    }
		    lappend exports($option) "$optionDbName"
		}

		# Store the forward and backward mappings for this
		# option <-> realoption pair
                lappend classmap($option) $subpath $subclass $realopt
		set submap($realopt) $option
            }
        }
    }
}

proc Widget::declare { class optlist } {
    variable _optiontype

    namespace eval $class {}
    upvar 0 ${class}::opt classopt
    upvar 0 ${class}::optionExports exports
    upvar 0 ${class}::optionClass optionClass

    foreach optdesc $optlist {
        set option  [lindex $optdesc 0]
        set optdesc [lrange $optdesc 1 end]
        set type    [lindex $optdesc 0]

        if { ![info exists _optiontype($type)] } {
            # invalid resource type
            return -code error "invalid option type \"$type\""
        }

        if { [string equal $type "Synonym"] } {
            # test existence of synonym option
            set syn [lindex $optdesc 1]
            if { ![info exists classopt($syn)] } {
                return -code error "unknow option \"$syn\" for Synonym \"$option\""
            }
            set classopt($option) [list Synonym $syn]
            continue
        }

        # all other resource may have default value, readonly flag and
        # optional arg depending on type
        set value [lindex $optdesc 1]
        set ro    [lindex $optdesc 2]
        set arg   [lindex $optdesc 3]

        if { [string equal $type "BwResource"] } {
            # We don't keep BwResource. We simplify to type of sub BWidget
            set subclass    [lindex $arg 0]
            set realopt     [lindex $arg 1]
            if { ![string length $realopt] } {
                set realopt $option
            }

            upvar 0 ${subclass}::opt subclassopt
            if { ![info exists subclassopt($realopt)] } {
                return -code error "unknow option \"$realopt\""
            }
            set suboptdesc $subclassopt($realopt)
            if { $value == "" } {
                # We initialize default value
                set value [lindex $suboptdesc 1]
            }
            set type [lindex $suboptdesc 0]
            set ro   [lindex $suboptdesc 2]
            set arg  [lindex $suboptdesc 3]
	    set optionDbName ".[lindex [_configure_option $option ""] 0]"
	    option add *${class}${optionDbName} $value widgetDefault
	    set exports($option) $optionDbName
            set classopt($option) [list $type $value $ro $arg]
            continue
        }

        # retreive default value for TkResource
        if { [string equal $type "TkResource"] } {
            set tkwidget [lindex $arg 0]
	    set foo [$tkwidget ".ericFoo##"]
            set realopt  [lindex $arg 1]
            if { ![string length $realopt] } {
                set realopt $option
            }
            set tkoptions [_get_tkwidget_options $tkwidget]
            if { ![string length $value] } {
                # We initialize default value
		set ind [lsearch $tkoptions [list $realopt *]]
                set value [lindex [lindex $tkoptions $ind] end]
            }
	    set optionDbName ".[lindex [_configure_option $option ""] 0]"
	    option add *${class}${optionDbName} $value widgetDefault
	    set exports($option) $optionDbName
            set classopt($option) [list TkResource $value $ro \
		    [list $tkwidget $realopt]]
	    set optionClass($option) [lindex [$foo configure $realopt] 1]
	    ::destroy $foo
            continue
        }

	set optionDbName ".[lindex [_configure_option $option ""] 0]"
	option add *${class}${optionDbName} $value widgetDefault
	set exports($option) $optionDbName
        # for any other resource type, we keep original optdesc
        set classopt($option) [list $type $value $ro $arg]
    }
}

proc Widget::define { class filename args } {
    variable ::BWidget::use
    set use($class)      $args
    set use($class,file) $filename
    lappend use(classes) $class

    if {[set x [lsearch -exact $args "-classonly"]] > -1} {
	set args [lreplace $args $x $x]
    } else {
	interp alias {} ::${class} {} ${class}::create
	proc ::${class}::use {} {}

	bind $class <Destroy> [list Widget::destroy %W]
    }

    foreach class $args { ${class}::use }
}

proc Widget::create { class path {rename 1} } {
    if {$rename} { rename $path ::$path:cmd }
    proc ::$path { cmd args } \
    	[subst {return \[eval \[linsert \$args 0 ${class}::\$cmd [list $path]\]\]}]
    return $path
}

proc Widget::addmap { class subclass subpath options } {
    upvar 0 ${class}::opt classopt
    upvar 0 ${class}::optionExports exports
    upvar 0 ${class}::optionClass optionClass
    upvar 0 ${class}::map classmap
    upvar 0 ${class}::map$subpath submap

    foreach {option realopt} $options {
        if { ![string length $realopt] } {
            set realopt $option
        }
	set val [lindex $classopt($option) 1]
	set optDb ".[lindex [_configure_option $realopt ""] 0]"
	if { ![string equal $subpath ":cmd"] } {
	    set optDb "$subpath$optDb"
	}
	option add *${class}${optDb} $val widgetDefault
	lappend exports($option) $optDb
	# Store the forward and backward mappings for this
	# option <-> realoption pair
        lappend classmap($option) $subpath $subclass $realopt
	set submap($realopt) $option
    }
}

proc Widget::syncoptions { class subclass subpath options } {
    upvar 0 ${class}::sync classync

    foreach {option realopt} $options {
        if { ![string length $realopt] } {
            set realopt $option
        }
        set classync($option) [list $subpath $subclass $realopt]
    }
}

proc Widget::init { class path options } {
    variable _inuse
    variable _class
    variable _optiontype

    upvar 0 ${class}::opt classopt
    upvar 0 ${class}::$path:opt  pathopt
    upvar 0 ${class}::$path:mod  pathmod
    upvar 0 ${class}::map classmap
    upvar 0 ${class}::$path:init pathinit

    if { [info exists pathopt] } {
	unset pathopt
    }
    if { [info exists pathmod] } {
	unset pathmod
    }

    set fpath $path
    set rdbclass [string map [list :: ""] $class]
    if { ![winfo exists $path] } {
	set fpath ".#BWidget.#Class#$class"
	# encapsulation frame to not pollute '.' childspace
	if {![winfo exists ".#BWidget"]} { frame ".#BWidget" }
	if { ![winfo exists $fpath] } {
	    frame $fpath -class $rdbclass
	}
    }
    foreach {option optdesc} [array get classopt] {
        set pathmod($option) 0
	if { [info exists classmap($option)] } {
	    continue
	}
        set type [lindex $optdesc 0]
        if { [string equal $type "Synonym"] } {
	    continue
        }
        if { [string equal $type "TkResource"] } {
            set alt [lindex [lindex $optdesc 3] 1]
        } else {
            set alt ""
        }
        set optdb [lindex [_configure_option $option $alt] 0]
        set def   [option get $fpath $optdb $rdbclass]
        if { [string length $def] } {
            set pathopt($option) $def
        } else {
            set pathopt($option) [lindex $optdesc 1]
        }
    }

    if {![info exists _inuse($class)]} { set _inuse($class) 0 }
    incr _inuse($class)

    set _class($path) $class
    foreach {option value} $options {
        if { ![info exists classopt($option)] } {
            unset pathopt
            unset pathmod
            return -code error "unknown option \"$option\""
        }
        set optdesc $classopt($option)
        set type    [lindex $optdesc 0]
        if { [string equal $type "Synonym"] } {
            set option  [lindex $optdesc 1]
            set optdesc $classopt($option)
            set type    [lindex $optdesc 0]
        }
        # this may fail if a wrong enum element was used
        if {[catch {
             $_optiontype($type) $option $value [lindex $optdesc 3]
        } msg]} {
            if {[info exists pathopt]} {
                unset pathopt
            }
            unset pathmod
            return -code error $msg
        }
        set pathopt($option) $msg
	set pathinit($option) $pathopt($option)
    }
}

proc Widget::parseArgs {class options} {
    variable _optiontype
    upvar 0 ${class}::opt classopt
    upvar 0 ${class}::map classmap
    
    foreach {option val} $options {
	if { ![info exists classopt($option)] } {
	    error "unknown option \"$option\""
	}
        set optdesc $classopt($option)
        set type    [lindex $optdesc 0]
        if { [string equal $type "Synonym"] } {
            set option  [lindex $optdesc 1]
            set optdesc $classopt($option)
            set type    [lindex $optdesc 0]
        }
	if { [string equal $type "TkResource"] } {
	    # Make sure that the widget used for this TkResource exists
	    Widget::_get_tkwidget_options [lindex [lindex $optdesc 3] 0]
	}
	set val [$_optiontype($type) $option $val [lindex $optdesc 3]]
		
	if { [info exists classmap($option)] } {
	    foreach {subpath subclass realopt} $classmap($option) {
		lappend maps($subpath) $realopt $val
	    }
	} else {
	    lappend maps($class) $option $val
	}
    }
    return [array get maps]
}

proc Widget::initFromODB {class path options} {
    variable _inuse
    variable _class

    upvar 0 ${class}::$path:opt  pathopt
    upvar 0 ${class}::$path:mod  pathmod
    upvar 0 ${class}::map classmap

    if { [info exists pathopt] } {
	unset pathopt
    }
    if { [info exists pathmod] } {
	unset pathmod
    }

    set fpath [_get_window $class $path]
    set rdbclass [string map [list :: ""] $class]
    if { ![winfo exists $path] } {
	set fpath ".#BWidget.#Class#$class"
	# encapsulation frame to not pollute '.' childspace
	if {![winfo exists ".#BWidget"]} { frame ".#BWidget" }
	if { ![winfo exists $fpath] } {
	    frame $fpath -class $rdbclass
	}
    }

    foreach {option optdesc} [array get ${class}::opt] {
        set pathmod($option) 0
	if { [info exists classmap($option)] } {
	    continue
	}
        set type [lindex $optdesc 0]
        if { [string equal $type "Synonym"] } {
	    continue
        }
	if { [string equal $type "TkResource"] } {
            set alt [lindex [lindex $optdesc 3] 1]
        } else {
            set alt ""
        }
        set optdb [lindex [_configure_option $option $alt] 0]
        set def   [option get $fpath $optdb $rdbclass]
        if { [string length $def] } {
            set pathopt($option) $def
        } else {
            set pathopt($option) [lindex $optdesc 1]
        }
    }

    if {![info exists _inuse($class)]} { set _inuse($class) 0 }
    incr _inuse($class)

    set _class($path) $class
    array set pathopt $options
}

proc Widget::destroy { path } {
    variable _class
    variable _inuse

    if {![info exists _class($path)]} { return }

    set class $_class($path)
    upvar 0 ${class}::$path:opt pathopt
    upvar 0 ${class}::$path:mod pathmod
    upvar 0 ${class}::$path:init pathinit

    if {[info exists _inuse($class)]} { incr _inuse($class) -1 }

    if {[info exists pathopt]} {
        unset pathopt
    }
    if {[info exists pathmod]} {
        unset pathmod
    }
    if {[info exists pathinit]} {
        unset pathinit
    }

    if {![string equal [info commands $path] ""]} { rename $path "" }

    ## Unset any variables used in this widget.
    foreach var [info vars ::${class}::$path:*] { unset $var }

    unset _class($path)
}

proc Widget::configure { path options } {
    set len [llength $options]
    if { $len <= 1 } {
        return [_get_configure $path $options]
    } elseif { $len % 2 == 1 } {
        return -code error "incorrect number of arguments"
    }

    variable _class
    variable _optiontype

    set class $_class($path)
    upvar 0 ${class}::opt  classopt
    upvar 0 ${class}::map  classmap
    upvar 0 ${class}::$path:opt pathopt
    upvar 0 ${class}::$path:mod pathmod

    set window [_get_window $class $path]
    foreach {option value} $options {
        if { ![info exists classopt($option)] } {
            return -code error "unknown option \"$option\""
        }
        set optdesc $classopt($option)
        set type    [lindex $optdesc 0]
        if { [string equal $type "Synonym"] } {
            set option  [lindex $optdesc 1]
            set optdesc $classopt($option)
            set type    [lindex $optdesc 0]
        }
        if { ![lindex $optdesc 2] } {
            set newval [$_optiontype($type) $option $value [lindex $optdesc 3]]
            if { [info exists classmap($option)] } {
		set window [_get_window $class $window]
                foreach {subpath subclass realopt} $classmap($option) {
                    if { [string length $subclass] && ! [string equal $subclass ":cmd"] } {
                        if { [string equal $subpath ":cmd"] } {
                            set subpath ""
                        }
                        set curval [${subclass}::cget $window$subpath $realopt]
                        ${subclass}::configure $window$subpath $realopt $newval
                    } else {
                        set curval [$window$subpath cget $realopt]
                        $window$subpath configure $realopt $newval
                    }
                }
            } else {
		set curval $pathopt($option)
		set pathopt($option) $newval
	    }
	    set pathmod($option) [expr {![string equal $newval $curval]}]
        }
    }

    return {}
}

proc Widget::cget { path option } {
    variable _class
    if { ![info exists _class($path)] } {
        return -code error "unknown widget $path"
    }

    set class $_class($path)
    if { ![info exists ${class}::opt($option)] } {
        return -code error "unknown option \"$option\""
    }

    set optdesc [set ${class}::opt($option)]
    set type    [lindex $optdesc 0]
    if {[string equal $type "Synonym"]} {
        set option [lindex $optdesc 1]
    }

    if { [info exists ${class}::map($option)] } {
	foreach {subpath subclass realopt} [set ${class}::map($option)] {break}
	set path "[_get_window $class $path]$subpath"
	return [$path cget $realopt]
    }
    upvar 0 ${class}::$path:opt pathopt
    set pathopt($option)
}

proc Widget::subcget { path subwidget } {
    variable _class
    set class $_class($path)
    upvar 0 ${class}::$path:opt pathopt
    upvar 0 ${class}::map$subwidget submap
    upvar 0 ${class}::$path:init pathinit

    set result {}
    foreach realopt [array names submap] {
	if { [info exists pathinit($submap($realopt))] } {
	    lappend result $realopt $pathopt($submap($realopt))
	}
    }
    return $result
}

proc Widget::hasChanged { path option pvalue } {
    variable _class
    upvar $pvalue value
    set class $_class($path)
    upvar 0 ${class}::$path:mod pathmod

    set value   [Widget::cget $path $option]
    set result  $pathmod($option)
    set pathmod($option) 0

    return $result
}

proc Widget::hasChangedX { path option args } {
    variable _class
    set class $_class($path)
    upvar 0 ${class}::$path:mod pathmod

    set result  $pathmod($option)
    set pathmod($option) 0
    foreach option $args {
	lappend result $pathmod($option)
	set pathmod($option) 0
    }

    set result
}

proc Widget::setoption { path option value } {
    Widget::configure $path [list $option $value]
}

proc Widget::getoption { path option } {
    return [Widget::cget $path $option]
}

proc Widget::getMegawidgetOption {path option} {
    variable _class
    set class $_class($path)
    upvar 0 ${class}::${path}:opt pathopt
    set pathopt($option)
}

proc Widget::setMegawidgetOption {path option value} {
    variable _class
    set class $_class($path)
    upvar 0 ${class}::${path}:opt pathopt
    set pathopt($option) $value
}

proc Widget::_get_window { class path } {
    set idx [string last "#" $path]
    if { $idx != -1 && [string equal [string range $path [expr {$idx+1}] end] $class] } {
        return [string range $path 0 [expr {$idx-1}]]
    } else {
        return $path
    }
}

proc Widget::_get_configure { path options } {
    variable _class

    set class $_class($path)
    upvar 0 ${class}::opt classopt
    upvar 0 ${class}::map classmap
    upvar 0 ${class}::$path:opt pathopt
    upvar 0 ${class}::$path:mod pathmod

    set len [llength $options]
    if { !$len } {
        set result {}
        foreach option [lsort [array names classopt]] {
            set optdesc $classopt($option)
            set type    [lindex $optdesc 0]
            if { [string equal $type "Synonym"] } {
                set syn     $option
                set option  [lindex $optdesc 1]
                set optdesc $classopt($option)
                set type    [lindex $optdesc 0]
            } else {
                set syn ""
            }
            if { [string equal $type "TkResource"] } {
                set alt [lindex [lindex $optdesc 3] 1]
            } else {
                set alt ""
            }
            set res [_configure_option $option $alt]
            if { $syn == "" } {
                lappend result [concat $option $res [list [lindex $optdesc 1]] [list [cget $path $option]]]
            } else {
                lappend result [list $syn [lindex $res 0]]
            }
        }
        return $result
    } elseif { $len == 1 } {
        set option  [lindex $options 0]
        if { ![info exists classopt($option)] } {
            return -code error "unknown option \"$option\""
        }
        set optdesc $classopt($option)
        set type    [lindex $optdesc 0]
        if { [string equal $type "Synonym"] } {
            set option  [lindex $optdesc 1]
            set optdesc $classopt($option)
            set type    [lindex $optdesc 0]
        }
        if { [string equal $type "TkResource"] } {
            set alt [lindex [lindex $optdesc 3] 1]
        } else {
            set alt ""
        }
        set res [_configure_option $option $alt]
        return [concat $option $res [list [lindex $optdesc 1]] [list [cget $path $option]]]
    }
}

proc Widget::_configure_option { option altopt } {
    variable _optiondb
    variable _optionclass

    if { [info exists _optiondb($option)] } {
        set optdb $_optiondb($option)
    } else {
        set optdb [string range $option 1 end]
    }
    if { [info exists _optionclass($option)] } {
        set optclass $_optionclass($option)
    } elseif { [string length $altopt] } {
        if { [info exists _optionclass($altopt)] } {
            set optclass $_optionclass($altopt)
        } else {
            set optclass [string range $altopt 1 end]
        }
    } else {
        set optclass [string range $option 1 end]
    }
    return [list $optdb $optclass]
}

proc Widget::_get_tkwidget_options { tkwidget } {
    variable _tk_widget
    variable _optiondb
    variable _optionclass

    set widget ".#BWidget.#$tkwidget"
    # encapsulation frame to not pollute '.' childspace
    if {![winfo exists ".#BWidget"]} { frame ".#BWidget" }
    if { ![winfo exists $widget] || ![info exists _tk_widget($tkwidget)] } {
	set widget [$tkwidget $widget]
	# JDC: Withdraw toplevels, otherwise visible
	if {[string equal $tkwidget "toplevel"]} {
	    wm withdraw $widget
	}
	set config [$widget configure]
	foreach optlist $config {
	    set opt [lindex $optlist 0]
	    if { [llength $optlist] == 2 } {
		set refsyn [lindex $optlist 1]
		# search for class
		set idx [lsearch $config [list * $refsyn *]]
		if { $idx == -1 } {
		    if { [string index $refsyn 0] == "-" } {
			# search for option (tk8.1b1 bug)
			set idx [lsearch $config [list $refsyn * *]]
		    } else {
			# last resort
			set idx [lsearch $config [list -[string tolower $refsyn] * *]]
		    }
		    if { $idx == -1 } {
			# fed up with "can't read classopt()"
			return -code error "can't find option of synonym $opt"
		    }
		}
		set syn [lindex [lindex $config $idx] 0]
		# JDC: used 4 (was 3) to get def from optiondb
		set def [lindex [lindex $config $idx] 4]
		lappend _tk_widget($tkwidget) [list $opt $syn $def]
	    } else {
		# JDC: used 4 (was 3) to get def from optiondb
		set def [lindex $optlist 4]
		lappend _tk_widget($tkwidget) [list $opt $def]
		set _optiondb($opt)    [lindex $optlist 1]
		set _optionclass($opt) [lindex $optlist 2]
	    }
	}
    }
    return $_tk_widget($tkwidget)
}

proc Widget::_test_tkresource { option value arg } {
    foreach {tkwidget realopt} $arg break
    set path     ".#BWidget.#$tkwidget"
    set old      [$path cget $realopt]
    $path configure $realopt $value
    set res      [$path cget $realopt]
    $path configure $realopt $old

    return $res
}

proc Widget::_test_bwresource { option value arg } {
    return -code error "bad option type BwResource in widget"
}

proc Widget::_test_synonym { option value arg } {
    return -code error "bad option type Synonym in widget"
}

proc Widget::_test_color { option value arg } {
    if {[catch {winfo rgb . $value} color]} {
        return -code error "bad $option value \"$value\": must be a colorname \
		or #RRGGBB triplet"
    }

    return $value
}

proc Widget::_test_string { option value arg } {
    set value
}

proc Widget::_test_flag { option value arg } {
    set len [string length $value]
    set res ""
    for {set i 0} {$i < $len} {incr i} {
        set c [string index $value $i]
        if { [string first $c $arg] == -1 } {
            return -code error "bad [string range $option 1 end] value \"$value\": characters must be in \"$arg\""
        }
        if { [string first $c $res] == -1 } {
            append res $c
        }
    }
    return $res
}

proc Widget::_test_enum { option value arg } {
    if { [lsearch $arg $value] == -1 } {
        set last [lindex   $arg end]
        set sub  [lreplace $arg end end]
        if { [llength $sub] } {
            set str "[join $sub ", "] or $last"
        } else {
            set str $last
        }
        return -code error "bad [string range $option 1 end] value \"$value\": must be $str"
    }
    return $value
}

proc Widget::_test_int { option value arg } {
    if { ![string is int -strict $value] || \
	    ([string length $arg] && \
	    ![expr [string map [list %d $value] $arg]]) } {
		    return -code error "bad $option value\
			    \"$value\": must be integer ($arg)"
    }
    return $value
}

proc Widget::_test_boolean { option value arg } {
    if { ![string is boolean -strict $value] } {
        return -code error "bad $option value \"$value\": must be boolean"
    }

    # Get the canonical form of the boolean value (1 for true, 0 for false)
    return [string is true $value]
}

proc Widget::_test_padding { option values arg } {
    set len [llength $values]
    if {$len < 1 || $len > 2} {
        return -code error "bad pad value \"$values\":\
                        must be positive screen distance"
    }

    foreach value $values {
        if { ![string is int -strict $value] || \
            ([string length $arg] && \
            ![expr [string map [list %d $value] $arg]]) } {
                return -code error "bad pad value \"$value\":\
                                must be positive screen distance ($arg)"
        }
    }
    return $values
}

proc Widget::_get_padding { path option {index 0} } {
    set pad [Widget::cget $path $option]
    set val [lindex $pad $index]
    if {$val == ""} { set val [lindex $pad 0] }
    return $val
}

proc Widget::focusNext { w } {
    set cur $w
    while 1 {
	# Descend to just before the first child of the current widget.
	set parent $cur
	set children [winfo children $cur]
	set i -1

	# Look for the next sibling that isn't a top-level.
	while 1 {
	    incr i
	    if {$i < [llength $children]} {
		set cur [lindex $children $i]
		if {[string equal [winfo toplevel $cur] $cur]} {
		    continue
		} else {
		    break
		}
	    }

	    set cur $parent
	    if {[string equal [winfo toplevel $cur] $cur]} {
		break
	    }
	    set parent [winfo parent $parent]
	    set children [winfo children $parent]
	    set i [lsearch -exact $children $cur]
	}
	if {[string equal $cur $w] || [focusOK $cur]} {
	    return $cur
	}
    }
}

proc Widget::focusPrev { w } {
    set cur $w
    set origParent [winfo parent $w]
    while 1 {

	if {[string equal [winfo toplevel $cur] $cur]}  {
	    set parent $cur
	    set children [winfo children $cur]
	    set i [llength $children]
	} else {
	    set parent [winfo parent $cur]
	    set children [winfo children $parent]
	    set i [lsearch -exact $children $cur]
	}

	while {$i > 0} {
	    incr i -1
	    set cur [lindex $children $i]
	    if {[string equal [winfo toplevel $cur] $cur]} {
		continue
	    }
	    set parent $cur
	    set children [winfo children $parent]
	    set i [llength $children]
	}
	set cur $parent
	if {[string equal $cur $w]} {
	    return $cur
	}

	if {[string equal $cur $origParent]
	    && [info procs ::$origParent] != ""} {
	    continue
	}
	if {[focusOK $cur]} {
	    return $cur
	}
    }
}

proc Widget::focusOK { w } {
    set code [catch {$w cget -takefocus} value]
    if { $code == 1 } {
        return 0
    }
    if {($code == 0) && ($value != "")} {
	if {$value == 0} {
	    return 0
	} elseif {$value == 1} {
	    return [winfo viewable $w]
	} else {
	    set value [uplevel \#0 $value $w]
            if {$value != ""} {
		return $value
	    }
        }
    }
    if {![winfo viewable $w]} {
	return 0
    }
    set code [catch {$w cget -state} value]
    if {($code == 0) && ($value == "disabled")} {
	return 0
    }
    set code [catch {$w cget -editable} value]
    if {($code == 0) && ($value == 0)} {
        return 0
    }

    set top [winfo toplevel $w]
    foreach tags [bindtags $w] {
        if { ![string equal $tags $top]  &&
             ![string equal $tags "all"] &&
             [regexp Key [bind $tags]] } {
            return 1
        }
    }
    return 0
}

proc Widget::traverseTo { w } {
    set focus [focus]
    if {![string equal $focus ""]} {
	event generate $focus <<TraverseOut>>
    }
    focus $w

    event generate $w <<TraverseIn>>
}

proc Widget::getVariable { path varName {newVarName ""} } {
    variable _class
    set class $_class($path)
    if {![string length $newVarName]} { set newVarName $varName }
    uplevel 1 [list upvar \#0 ${class}::$path:$varName $newVarName]
}

proc Widget::options { path args } {
    if {[llength $args]} {
        foreach option $args {
            lappend options [_get_configure $path $option]
        }
    } else {
        set options [_get_configure $path {}]
    }

    set result [list]
    foreach list $options {
        if {[llength $list] < 5} { continue }
        lappend result [lindex $list 0] [lindex $list end]
    }
    return $result
}

proc Widget::exists { path } {
    variable _class
    return [info exists _class($path)]
}
# ----------------------------------------------------------------------------
#  utils.tcl -- part of Unifix BWidget Toolkit
# ----------------------------------------------------------------------------

namespace eval BWidget {
    variable _top
    variable _gstack {}
    variable _fstack {}
    proc use {} {}
}

proc BWidget::get3dcolor { path bgcolor } {
    foreach val [winfo rgb $path $bgcolor] {
        lappend dark [expr {60*$val/100}]
        set tmp1 [expr {14*$val/10}]
        if { $tmp1 > 65535 } {
            set tmp1 65535
        }
        set tmp2 [expr {(65535+$val)/2}]
        lappend light [expr {($tmp1 > $tmp2) ? $tmp1:$tmp2}]
    }
    return [list [eval format "#%04x%04x%04x" $dark] [eval format "#%04x%04x%04x" $light]]
}
# ----------------------------------------------------------------------------
#  panedw.tcl -- part of Unifix BWidget Toolkit
# ----------------------------------------------------------------------------

namespace eval PanedWindow {
    Widget::define PanedWindow panedw

    namespace eval Pane {
        Widget::declare PanedWindow::Pane {
            {-minsize Int 0 0 "%d >= 0"}
            {-weight  Int 1 0 "%d >= 0"}
        }
    }

    Widget::declare PanedWindow {
        {-side       Enum       top   1 {top left bottom right}}
        {-width      Int        10    1 "%d >=3"}
        {-pad        Int        4     1 "%d >= 0"}
        {-background TkResource ""    0 frame}
        {-bg         Synonym    -background}
        {-activator  Enum       ""    1 {line button}}
	{-weights    Enum       extra 1 {extra available}}
    }

    variable _panedw
}

proc PanedWindow::create { path args } {
    variable _panedw

    Widget::init PanedWindow $path $args

    frame $path -background [Widget::cget $path -background] -class PanedWindow
    set _panedw($path,nbpanes) 0
    set _panedw($path,weights) ""
    set _panedw($path,configuredone) 0

    set activator [Widget::getoption $path -activator]
    if {[string equal $activator ""]} {
        if { $::tcl_platform(platform) != "windows" } {
            Widget::setMegawidgetOption $path -activator button
        } else {
            Widget::setMegawidgetOption $path -activator line
        }
    }
    if {[string equal [Widget::getoption $path -activator] "line"]} {
        Widget::setMegawidgetOption $path -width 3
    }
    
    bind $path <Configure> [list PanedWindow::_realize $path %w %h]
    bind $path <Destroy>   [list PanedWindow::_destroy $path]

    return [Widget::create PanedWindow $path]
}

proc PanedWindow::configure { path args } {
    variable _panedw

    set res [Widget::configure $path $args]

    if { [Widget::hasChanged $path -background bg] && $_panedw($path,nbpanes) > 0 } {
        $path:cmd configure -background $bg
        $path.f0 configure -background $bg
        for {set i 1} {$i < $_panedw($path,nbpanes)} {incr i} {
            set frame $path.sash$i
            $frame configure -background $bg
            $frame.sep configure -background $bg
            $frame.but configure -background $bg
            $path.f$i configure -background $bg
            $path.f$i.frame configure -background $bg
        }
    }
    return $res
}

proc PanedWindow::cget { path option } {
    return [Widget::cget $path $option]
}

proc PanedWindow::add { path args } {
    variable _panedw

    set num $_panedw($path,nbpanes)
    Widget::init PanedWindow::Pane $path.f$num $args
    set bg [Widget::getoption $path -background]

    set wbut   [Widget::getoption $path -width]
    set pad    [Widget::getoption $path -pad]
    set width  [expr {$wbut+2*$pad}]
    set side   [Widget::getoption $path -side]
    set weight [Widget::getoption $path.f$num -weight]
    lappend _panedw($path,weights) $weight

    if { $num > 0 } {
        set frame [frame $path.sash$num -relief flat -bd 0 \
                       -highlightthickness 0 -width $width -height $width -bg $bg]
        set sep [frame $frame.sep -bd 5 -relief raised \
                     -highlightthickness 0 -bg $bg]
        set but [frame $frame.but -bd 1 -relief raised \
                     -highlightthickness 0 -bg $bg -width $wbut -height $wbut]
	set sepsize 2

        set activator [Widget::getoption $path -activator]
	if {$activator == "button"} {
	    set activator $but
	    set placeButton 1
	} else {
	    set activator $sep
	    $sep configure -bd 1
	    set placeButton 0
	}
        if {[string equal $side "top"] || [string equal $side "bottom"]} {
            place $sep -relx 0.5 -y 0 -width $sepsize -relheight 1.0 -anchor n
	    if { $placeButton } {
		if {[string equal $side "top"]} {
		    place $but -relx 0.5 -y [expr {6+$wbut/2}] -anchor c
		} else {
		    place $but -relx 0.5 -rely 1.0 -y [expr {-6-$wbut/2}] \
			    -anchor c
		}
	    }
            $activator configure -cursor sb_h_double_arrow 
            grid $frame -column [expr {2*$num-1}] -row 0 -sticky ns
            grid columnconfigure $path [expr {2*$num-1}] -weight 0
        } else {
            place $sep -x 0 -rely 0.5 -height $sepsize -relwidth 1.0 -anchor w
	    if { $placeButton } {
		if {[string equal $side "left"]} {
		    place $but -rely 0.5 -x [expr {6+$wbut/2}] -anchor c
		} else {
		    place $but -rely 0.5 -relx 1.0 -x [expr {-6-$wbut/2}] \
			    -anchor c
		}
	    }
            $activator configure -cursor sb_v_double_arrow 
            grid $frame -row [expr {2*$num-1}] -column 0 -sticky ew
            grid rowconfigure $path [expr {2*$num-1}] -weight 0
        }
        bind $activator <ButtonPress-1> \
	    [list PanedWindow::_beg_move_sash $path $num %X %Y]
    } else {
        if { [string equal $side "top"] || \
		[string equal $side "bottom"] } {
            grid rowconfigure $path 0 -weight 1
        } else {
            grid columnconfigure $path 0 -weight 1
        }
    }

    set pane [frame $path.f$num -bd 0 -relief flat \
	    -highlightthickness 0 -bg $bg]
    set user [frame $path.f$num.frame  -bd 0 -relief flat \
	    -highlightthickness 0 -bg $bg]
    if { [string equal $side "top"] || [string equal $side "bottom"] } {
        grid $pane -column [expr {2*$num}] -row 0 -sticky nsew
        grid columnconfigure $path [expr {2*$num}] -weight $weight
    } else {
        grid $pane -row [expr {2*$num}] -column 0 -sticky nsew
        grid rowconfigure $path [expr {2*$num}] -weight $weight
    }
    pack $user -fill both -expand yes
    incr _panedw($path,nbpanes)
    if {$_panedw($path,configuredone)} {
	_realize $path [winfo width $path] [winfo height $path]
    }

    return $user
}

proc PanedWindow::getframe { path index } {
    if { [winfo exists $path.f$index.frame] } {
        return $path.f$index.frame
    }
}
    
proc PanedWindow::_beg_move_sash { path num x y } {
    variable _panedw

    set fprev $path.f[expr {$num-1}]
    set fnext $path.f$num
    set wsash [expr {[Widget::getoption $path -width] + 2*[Widget::getoption $path -pad]}]

    $path.sash$num.but configure -relief sunken
    set top  [toplevel $path.sash -borderwidth 1 -relief raised]

    set minszg [Widget::getoption $fprev -minsize]
    set minszd [Widget::getoption $fnext -minsize]
    set side   [Widget::getoption $path -side]

    if { [string equal $side "top"] || [string equal $side "bottom"] } {
        $top configure -cursor sb_h_double_arrow
        set h    [winfo height $path]
        set yr   [winfo rooty $path.sash$num]
        set xmin [expr {$wsash/2+[winfo rootx $fprev]+$minszg}]
        set xmax [expr {-$wsash/2-1+[winfo rootx $fnext]+[winfo width $fnext]-$minszd}]
        wm overrideredirect $top 1
        wm geom $top "2x${h}+$x+$yr"

        update idletasks
        grab set $top
        bind $top <ButtonRelease-1> [list PanedWindow::_end_move_sash $path $top $num $xmin $xmax %X rootx width]
        bind $top <Motion>          [list PanedWindow::_move_sash $top $xmin $xmax %X +%%d+$yr]
        _move_sash $top $xmin $xmax $x "+%d+$yr"
    } else {
        $top configure -cursor sb_v_double_arrow
        set w    [winfo width $path]
        set xr   [winfo rootx $path.sash$num]
        set ymin [expr {$wsash/2+[winfo rooty $fprev]+$minszg}]
        set ymax [expr {-$wsash/2-1+[winfo rooty $fnext]+[winfo height $fnext]-$minszd}]
        wm overrideredirect $top 1
        wm geom $top "${w}x2+$xr+$y"

        update idletasks
        grab set $top
        bind $top <ButtonRelease-1> [list PanedWindow::_end_move_sash \
		$path $top $num $ymin $ymax %Y rooty height]
        bind $top <Motion>          [list PanedWindow::_move_sash \
		$top $ymin $ymax %Y +$xr+%%d]
        _move_sash $top $ymin $ymax $y "+$xr+%d"
    }
}

proc PanedWindow::_move_sash { top min max v form } {

    if { $v < $min } {
	set v $min
    } elseif { $v > $max } {
	set v $max
    }
    wm geom $top [format $form $v]
}

proc PanedWindow::_end_move_sash { path top num min max v rootv size } {
    variable _panedw

    destroy $top
    if { $v < $min } {
	set v $min
    } elseif { $v > $max } {
	set v $max
    }
    set fprev $path.f[expr {$num-1}]
    set fnext $path.f$num

    $path.sash$num.but configure -relief raised

    set wsash [expr {[Widget::getoption $path -width] + 2*[Widget::getoption $path -pad]}]
    set dv    [expr {$v-[winfo $rootv $path.sash$num]-$wsash/2}]
    set w1    [winfo $size $fprev]
    set w2    [winfo $size $fnext]

    for {set i 0} {$i < $_panedw($path,nbpanes)} {incr i} {
        if { $i == $num-1} {
            $fprev configure -$size [expr {[winfo $size $fprev]+$dv}]
        } elseif { $i == $num } {
            $fnext configure -$size [expr {[winfo $size $fnext]-$dv}]
        } else {
            $path.f$i configure -$size [winfo $size $path.f$i]
        }
    }
}

proc PanedWindow::_realize { path width height } {
    variable _panedw

    set x    0
    set y    0
    set hc   [winfo reqheight $path]
    set hmax 0
    for {set i 0} {$i < $_panedw($path,nbpanes)} {incr i} {
        $path.f$i configure \
            -width  [winfo reqwidth  $path.f$i.frame] \
            -height [winfo reqheight $path.f$i.frame]
        place $path.f$i.frame -x 0 -y 0 -relwidth 1 -relheight 1
    }

    bind $path <Configure> {}

    _apply_weights $path
    set _panedw($path,configuredone) 1
    return
}

proc PanedWindow::_apply_weights { path } {
    variable _panedw

    set weights [Widget::getoption $path -weights]
    if {[string equal $weights "extra"]} {
	return
    }

    set side   [Widget::getoption $path -side]
    if {[string equal $side "top"] || [string equal $side "bottom"] } {
	set size width
    } else {
	set size height
    }
    set wsash [expr {[Widget::getoption $path -width] + 2*[Widget::getoption $path -pad]}]
    set rs [winfo $size $path]
    set s [expr {$rs - ($_panedw($path,nbpanes) - 1) * $wsash}]
    
    set tw 0.0
    foreach w $_panedw($path,weights) { 
	set tw [expr {$tw + $w}]
    }

    for {set i 0} {$i < $_panedw($path,nbpanes)} {incr i} {
	set rw [lindex $_panedw($path,weights) $i]
	set ps [expr {int($rw / $tw * $s)}]
	$path.f$i configure -$size $ps
    }    
    return
}

proc PanedWindow::_destroy { path } {
    variable _panedw

    for {set i 0} {$i < $_panedw($path,nbpanes)} {incr i} {
        Widget::destroy $path.f$i
    }
    unset _panedw($path,nbpanes)
    Widget::destroy $path
}
# ------------------------------------------------------------------------------
#  arrow.tcl -- part of Unifix BWidget Toolkit
# ------------------------------------------------------------------------------

namespace eval ArrowButton {
    Widget::define ArrowButton arrow

    Widget::tkinclude ArrowButton button .c \
	    include [list \
		-borderwidth -bd \
		-relief -highlightbackground \
		-highlightcolor -highlightthickness -takefocus]

    Widget::declare ArrowButton [list \
	    [list -type		Enum button 0 [list arrow button]] \
	    [list -dir		Enum top    0 [list top bottom left right]] \
	    [list -width	Int	15	0	"%d >= 0"] \
	    [list -height	Int	15	0	"%d >= 0"] \
	    [list -ipadx	Int	0	0	"%d >= 0"] \
	    [list -ipady	Int	0	0	"%d >= 0"] \
	    [list -clean	Int	2	0	"%d >= 0 && %d <= 2"] \
	    [list -activeforeground	TkResource	""	0 button] \
	    [list -activebackground	TkResource	""	0 button] \
	    [list -disabledforeground 	TkResource	""	0 button] \
	    [list -foreground		TkResource	""	0 button] \
	    [list -background		TkResource	""	0 button] \
	    [list -state		TkResource	""	0 button] \
	    [list -troughcolor		TkResource	""	0 scrollbar] \
	    [list -arrowbd	Int	1	0	"%d >= 0 && %d <= 2"] \
	    [list -arrowrelief	Enum	raised	0	[list raised sunken]] \
	    [list -command		String	""	0] \
	    [list -armcommand		String	""	0] \
	    [list -disarmcommand	String	""	0] \
	    [list -repeatdelay		Int	0	0	"%d >= 0"] \
	    [list -repeatinterval	Int	0	0	"%d >= 0"] \
	    [list -fg	Synonym	-foreground] \
	    [list -bg	Synonym	-background] \
	    ]

    bind BwArrowButtonC <Enter>           {ArrowButton::_enter %W}
    bind BwArrowButtonC <Leave>           {ArrowButton::_leave %W}
    bind BwArrowButtonC <ButtonPress-1>   {ArrowButton::_press %W}
    bind BwArrowButtonC <ButtonRelease-1> {ArrowButton::_release %W}
    bind BwArrowButtonC <Key-space>       {ArrowButton::invoke %W; break}
    bind BwArrowButtonC <Return>          {ArrowButton::invoke %W; break}
    bind BwArrowButton <Configure>       {ArrowButton::_redraw_whole %W %w %h}
    bind BwArrowButton <Destroy>         {ArrowButton::_destroy %W}

    variable _grab
    variable _moved

    array set _grab {current "" pressed "" oldstate "normal" oldrelief ""}
}

proc ArrowButton::create { path args } {
    # Initialize configuration mappings and parse arguments
    array set submaps [list ArrowButton [list ] .c [list ]]
    array set submaps [Widget::parseArgs ArrowButton $args]

    # Create the class frame (so we can do the option db queries)
    frame $path -class ArrowButton -borderwidth 0 -highlightthickness 0 
    Widget::initFromODB ArrowButton $path $submaps(ArrowButton)

    # Create the canvas with the initial options
    eval [list canvas $path.c] $submaps(.c)

    # Compute the width and height of the canvas from the width/height
    # of the ArrowButton and the borderwidth/hightlightthickness.
    set w   [Widget::getMegawidgetOption $path -width]
    set h   [Widget::getMegawidgetOption $path -height]
    set bd  [Widget::cget $path -borderwidth]
    set ht  [Widget::cget $path -highlightthickness]
    set pad [expr {2*($bd+$ht)}]

    $path.c configure -width [expr {$w-$pad}] -height [expr {$h-$pad}]
    bindtags $path [list $path BwArrowButton [winfo toplevel $path] all]
    bindtags $path.c [list $path.c BwArrowButtonC [winfo toplevel $path.c] all]
    pack $path.c -expand yes -fill both

    set ::ArrowButton::_moved($path) 0

    return [Widget::create ArrowButton $path]
}

proc ArrowButton::configure { path args } {
    set res [Widget::configure $path $args]

    set ch1 [expr {[Widget::hasChanged $path -width  w] |
                   [Widget::hasChanged $path -height h] |
                   [Widget::hasChanged $path -borderwidth bd] |
                   [Widget::hasChanged $path -highlightthickness ht]}]
    set ch2 [expr {[Widget::hasChanged $path -type    val] |
                   [Widget::hasChanged $path -ipadx   val] |
                   [Widget::hasChanged $path -ipady   val] |
                   [Widget::hasChanged $path -arrowbd val] |
                   [Widget::hasChanged $path -clean   val] |
                   [Widget::hasChanged $path -dir     val]}]

    if { $ch1 } {
        set pad [expr {2*($bd+$ht)}]
        $path.c configure \
            -width [expr {$w-$pad}] -height [expr {$h-$pad}] \
            -borderwidth $bd -highlightthickness $ht
	set ch2 1
    }
    if { $ch2 } {
        _redraw_whole $path [winfo width $path] [winfo height $path]
    } else {
        _redraw_relief $path
        _redraw_state $path
    }

    return $res
}

proc ArrowButton::cget { path option } {
    return [Widget::cget $path $option]
}

proc ArrowButton::invoke { path } {
    if { ![string equal [winfo class $path] "ArrowButton"] } {
	set path [winfo parent $path]
    }
    if { ![string equal [Widget::getoption $path -state] "disabled"] } {
        set oldstate [Widget::getoption $path -state]
        if { [string equal [Widget::getoption $path -type] "button"] } {
            set oldrelief [Widget::getoption $path -relief]
            configure $path -state active -relief sunken
        } else {
            set oldrelief [Widget::getoption $path -arrowrelief]
            configure $path -state active -arrowrelief sunken
        }
	update idletasks
        if {[llength [set cmd [Widget::getoption $path -armcommand]]]} {
            uplevel \#0 $cmd
        }
	after 10
        if { [string equal [Widget::getoption $path -type] "button"] } {
            configure $path -state $oldstate -relief $oldrelief
        } else {
            configure $path -state $oldstate -arrowrelief $oldrelief
        }
        if {[llength [set cmd [Widget::getoption $path -disarmcommand]]]} {
            uplevel \#0 $cmd
        }
        if {[llength [set cmd [Widget::getoption $path -command]]]} {
            uplevel \#0 $cmd
        }
    }
}

proc ArrowButton::_redraw { path width height } {
    variable _moved

    set _moved($path) 0
    set type  [Widget::getoption $path -type]
    set dir   [Widget::getoption $path -dir]
    set bd    [expr {[$path.c cget -borderwidth] + [$path.c cget -highlightthickness] + 1}]
    set clean [Widget::getoption $path -clean]
    if { [string equal $type "arrow"] } {
        if { [set id [$path.c find withtag rect]] == "" } {
            $path.c create rectangle $bd $bd [expr {$width-$bd-1}] [expr {$height-$bd-1}] -tags rect
        } else {
            $path.c coords $id $bd $bd [expr {$width-$bd-1}] [expr {$height-$bd-1}]
        }
        $path.c lower rect
        set arrbd [Widget::getoption $path -arrowbd]
        set bd    [expr {$bd+$arrbd-1}]
    } else {
        $path.c delete rect
    }
    # w and h are max width and max height of arrow
    set w [expr {$width  - 2*([Widget::getoption $path -ipadx]+$bd)}]
    set h [expr {$height - 2*([Widget::getoption $path -ipady]+$bd)}]

    if { $w < 2 } {set w 2}
    if { $h < 2 } {set h 2}

    if { $clean > 0 } {
        # arrange for base to be odd
        if { [string equal $dir "top"] || [string equal $dir "bottom"] } {
            if { !($w % 2) } {
                incr w -1
            }
            if { $clean == 2 } {
                # arrange for h = (w+1)/2
                set h2 [expr {($w+1)/2}]
                if { $h2 > $h } {
                    set w [expr {2*$h-1}]
                } else {
                    set h $h2
                }
            }
        } else {
            if { !($h % 2) } {
                incr h -1
            }
            if { $clean == 2 } {
                # arrange for w = (h+1)/2
                set w2 [expr {($h+1)/2}]
                if { $w2 > $w } {
                    set h [expr {2*$w-1}]
                } else {
                    set w $w2
                }
            }
        }
    }

    set x0 [expr {($width-$w)/2}]
    set y0 [expr {($height-$h)/2}]
    set x1 [expr {$x0+$w-1}]
    set y1 [expr {$y0+$h-1}]

    switch $dir {
        top {
            set xd [expr {($x0+$x1)/2}]
            if { [set id [$path.c find withtag poly]] == "" } {
                $path.c create polygon $x0 $y1 $x1 $y1 $xd $y0 -tags poly
            } else {
                $path.c coords $id $x0 $y1 $x1 $y1 $xd $y0
            }
            if { [string equal $type "arrow"] } {
                if { [set id [$path.c find withtag bot]] == "" } {
                    $path.c create line $x0 $y1 $x1 $y1 $xd $y0 -tags bot
                } else {
                    $path.c coords $id $x0 $y1 $x1 $y1 $xd $y0
                }
                if { [set id [$path.c find withtag top]] == "" } {
                    $path.c create line $x0 $y1 $xd $y0 -tags top
                } else {
                    $path.c coords $id $x0 $y1 $xd $y0
                }
                $path.c itemconfigure top -width $arrbd
                $path.c itemconfigure bot -width $arrbd
            } else {
                $path.c delete top
                $path.c delete bot
            }
        }
        bottom {
            set xd [expr {($x0+$x1)/2}]
            if { [set id [$path.c find withtag poly]] == "" } {
                $path.c create polygon $x1 $y0 $x0 $y0 $xd $y1 -tags poly
            } else {
                $path.c coords $id $x1 $y0 $x0 $y0 $xd $y1
            }
            if { [string equal $type "arrow"] } {
                if { [set id [$path.c find withtag top]] == "" } {
                    $path.c create line $x1 $y0 $x0 $y0 $xd $y1 -tags top
                } else {
                    $path.c coords $id $x1 $y0 $x0 $y0 $xd $y1
                }
                if { [set id [$path.c find withtag bot]] == "" } {
                    $path.c create line $x1 $y0 $xd $y1 -tags bot
                } else {
                    $path.c coords $id $x1 $y0 $xd $y1
                }
                $path.c itemconfigure top -width $arrbd
                $path.c itemconfigure bot -width $arrbd
            } else {
                $path.c delete top
                $path.c delete bot
            }
        }
        left {
            set yd [expr {($y0+$y1)/2}]
            if { [set id [$path.c find withtag poly]] == "" } {
                $path.c create polygon $x1 $y0 $x1 $y1 $x0 $yd -tags poly
            } else {
                $path.c coords $id $x1 $y0 $x1 $y1 $x0 $yd
            }
            if { [string equal $type "arrow"] } {
                if { [set id [$path.c find withtag bot]] == "" } {
                    $path.c create line $x1 $y0 $x1 $y1 $x0 $yd -tags bot
                } else {
                    $path.c coords $id $x1 $y0 $x1 $y1 $x0 $yd
                }
                if { [set id [$path.c find withtag top]] == "" } {
                    $path.c create line $x1 $y0 $x0 $yd -tags top
                } else {
                    $path.c coords $id $x1 $y0 $x0 $yd
                }
                $path.c itemconfigure top -width $arrbd
                $path.c itemconfigure bot -width $arrbd
            } else {
                $path.c delete top
                $path.c delete bot
            }
        }
        right {
            set yd [expr {($y0+$y1)/2}]
            if { [set id [$path.c find withtag poly]] == "" } {
                $path.c create polygon $x0 $y1 $x0 $y0 $x1 $yd -tags poly
            } else {
                $path.c coords $id $x0 $y1 $x0 $y0 $x1 $yd
            }
            if { [string equal $type "arrow"] } {
                if { [set id [$path.c find withtag top]] == "" } {
                    $path.c create line $x0 $y1 $x0 $y0 $x1 $yd -tags top
                } else {
                    $path.c coords $id $x0 $y1 $x0 $y0 $x1 $yd
                }
                if { [set id [$path.c find withtag bot]] == "" } {
                    $path.c create line $x0 $y1 $x1 $yd -tags bot
                } else {
                    $path.c coords $id $x0 $y1 $x1 $yd
                }
                $path.c itemconfigure top -width $arrbd
                $path.c itemconfigure bot -width $arrbd
            } else {
                $path.c delete top
                $path.c delete bot
            }
        }
    }
}

proc ArrowButton::_redraw_state { path } {
    set state [Widget::getoption $path -state]
    if { [string equal [Widget::getoption $path -type] "button"] } {
        switch $state {
            normal   {set bg -background;       set fg -foreground}
            active   {set bg -activebackground; set fg -activeforeground}
            disabled {set bg -background;       set fg -disabledforeground}
        }
        set fg [Widget::getoption $path $fg]
        $path.c configure -background [Widget::getoption $path $bg]
        $path.c itemconfigure poly -fill $fg -outline $fg
    } else {
        switch $state {
            normal   {set stipple "";     set bg [Widget::getoption $path -background] }
            active   {set stipple "";     set bg [Widget::getoption $path -activebackground] }
            disabled {set stipple gray50; set bg black }
        }
        set thrc [Widget::getoption $path -troughcolor]
        $path.c configure -background [Widget::getoption $path -background]
        $path.c itemconfigure rect -fill $thrc -outline $thrc
        $path.c itemconfigure poly -fill $bg   -outline $bg -stipple $stipple
    }
}

proc ArrowButton::_redraw_relief { path } {
    variable _moved

    if { [string equal [Widget::getoption $path -type] "button"] } {
        if { [string equal [Widget::getoption $path -relief] "sunken"] } {
            if { !$_moved($path) } {
                $path.c move poly 1 1
                set _moved($path) 1
            }
        } else {
            if { $_moved($path) } {
                $path.c move poly -1 -1
                set _moved($path) 0
            }
        }
    } else {
        set col3d [BWidget::get3dcolor $path [Widget::getoption $path -background]]
        switch [Widget::getoption $path -arrowrelief] {
            raised {set top [lindex $col3d 1]; set bot [lindex $col3d 0]}
            sunken {set top [lindex $col3d 0]; set bot [lindex $col3d 1]}
        }
        $path.c itemconfigure top -fill $top
        $path.c itemconfigure bot -fill $bot
    }
}

proc ArrowButton::_redraw_whole { path width height } {
    _redraw $path $width $height
    _redraw_relief $path
    _redraw_state $path
}

proc ArrowButton::_enter { path } {
    variable _grab
    set path [winfo parent $path]
    set _grab(current) $path
    if { ![string equal [Widget::getoption $path -state] "disabled"] } {
        set _grab(oldstate) [Widget::getoption $path -state]
        configure $path -state active
        if { $_grab(pressed) == $path } {
            if { [string equal [Widget::getoption $path -type] "button"] } {
                set _grab(oldrelief) [Widget::getoption $path -relief]
                configure $path -relief sunken
            } else {
                set _grab(oldrelief) [Widget::getoption $path -arrowrelief]
                configure $path -arrowrelief sunken
            }
        }
    }
}

proc ArrowButton::_leave { path } {
    variable _grab
    set path [winfo parent $path]
    set _grab(current) ""
    if { ![string equal [Widget::getoption $path -state] "disabled"] } {
        configure $path -state $_grab(oldstate)
        if { $_grab(pressed) == $path } {
            if { [string equal [Widget::getoption $path -type] "button"] } {
                configure $path -relief $_grab(oldrelief)
            } else {
                configure $path -arrowrelief $_grab(oldrelief)
            }
        }
    }
}

proc ArrowButton::_press { path } {
    variable _grab
    set path [winfo parent $path]
    if { ![string equal [Widget::getoption $path -state] "disabled"] } {
        set _grab(pressed) $path
            if { [string equal [Widget::getoption $path -type] "button"] } {
            set _grab(oldrelief) [Widget::getoption $path -relief]
            configure $path -relief sunken
        } else {
            set _grab(oldrelief) [Widget::getoption $path -arrowrelief]
            configure $path -arrowrelief sunken
        }
        if {[llength [set cmd [Widget::getoption $path -armcommand]]]} {
            uplevel \#0 $cmd
            if { [set delay [Widget::getoption $path -repeatdelay]]    > 0 ||
                 [set delay [Widget::getoption $path -repeatinterval]] > 0 } {
                after $delay [list ArrowButton::_repeat $path]
            }
        }
    }
}

proc ArrowButton::_release { path } {
    variable _grab
    set path [winfo parent $path]
    if { $_grab(pressed) == $path } {
        set _grab(pressed) ""
            if { [string equal [Widget::getoption $path -type] "button"] } {
            configure $path -relief $_grab(oldrelief)
        } else {
            configure $path -arrowrelief $_grab(oldrelief)
        }
        if {[llength [set cmd [Widget::getoption $path -disarmcommand]]]} {
            uplevel \#0 $cmd
        }
        if { $_grab(current) == $path &&
             ![string equal [Widget::getoption $path -state] "disabled"] &&
             [llength [set cmd [Widget::getoption $path -command]]]} {
            uplevel \#0 $cmd
        }
    }
}

proc ArrowButton::_repeat { path } {
    variable _grab
    if { $_grab(current) == $path && $_grab(pressed) == $path &&
         ![string equal [Widget::getoption $path -state] "disabled"] &&
         [llength [set cmd [Widget::getoption $path -armcommand]]]} {
        uplevel \#0 $cmd
    }
    if { $_grab(pressed) == $path &&
         ([set delay [Widget::getoption $path -repeatinterval]] > 0 ||
          [set delay [Widget::getoption $path -repeatdelay]]    > 0) } {
        after $delay [list ArrowButton::_repeat $path]
    }
}

proc ArrowButton::_destroy { path } {
    variable _moved
    Widget::destroy $path
    unset _moved($path)
}
# ---------------------------------------------------------------------------
#  notebook.tcl -- part of Unifix BWidget Toolkit
# ---------------------------------------------------------------------------

namespace eval NoteBook {
    Widget::define NoteBook notebook ArrowButton

    namespace eval Page {
        Widget::declare NoteBook::Page {
            {-state      Enum       normal 0 {normal disabled}}
            {-createcmd  String     ""     0}
            {-raisecmd   String     ""     0}
            {-leavecmd   String     ""     0}
            {-image      TkResource ""     0 label}
            {-text       String     ""     0}
            {-foreground         String     ""     0}
            {-background         String     ""     0}
            {-activeforeground   String     ""     0}
            {-activebackground   String     ""     0}
            {-disabledforeground String     ""     0}
        }
    }

    Widget::bwinclude NoteBook ArrowButton .c.fg \
	    include {-foreground -background -activeforeground \
		-activebackground -disabledforeground -repeatinterval \
		-repeatdelay -borderwidth} \
	    initialize {-borderwidth 1}
    Widget::bwinclude NoteBook ArrowButton .c.fd \
	    include {-foreground -background -activeforeground \
		-activebackground -disabledforeground -repeatinterval \
		-repeatdelay -borderwidth} \
	    initialize {-borderwidth 1}

    Widget::declare NoteBook {
	{-foreground		TkResource "" 0 button}
        {-background		TkResource "" 0 button}
        {-activebackground	TkResource "" 0 button}
        {-activeforeground	TkResource "" 0 button}
        {-disabledforeground	TkResource "" 0 button}
        {-font			TkResource "" 0 button}
        {-side			Enum       top 0 {top bottom}}
        {-homogeneous		Boolean 0   0}
        {-borderwidth		Int 1   0 "%d >= 1 && %d <= 2"}
 	{-internalborderwidth	Int 10  0 "%d >= 0"}
        {-width			Int 0   0 "%d >= 0"}
        {-height		Int 0   0 "%d >= 0"}

        {-repeatdelay        BwResource ""  0 ArrowButton}
        {-repeatinterval     BwResource ""  0 ArrowButton}

        {-fg                 Synonym -foreground}
        {-bg                 Synonym -background}
        {-bd                 Synonym -borderwidth}
        {-ibd                Synonym -internalborderwidth}

	{-arcradius          Int     2     0 "%d >= 0 && %d <= 8"}
	{-tabbevelsize       Int     0     0 "%d >= 0 && %d <= 8"}
        {-tabpady            Padding {0 6} 0 "%d >= 0"}
    }

    Widget::addmap NoteBook "" .c {-background {}}

    variable _warrow 12

    bind NoteBook <Configure> [list NoteBook::_resize  %W]
    bind NoteBook <Destroy>   [list NoteBook::_destroy %W]
}

proc NoteBook::create { path args } {
    variable $path
    upvar 0  $path data

    Widget::init NoteBook $path $args

    set data(base)     0
    set data(select)   ""
    set data(pages)    {}
    set data(pages)    {}
    set data(cpt)      0
    set data(realized) 0
    set data(wpage)    0

    _compute_height $path

    # Create the canvas
    set w [expr {[Widget::cget $path -width]+4}]
    set h [expr {[Widget::cget $path -height]+$data(hpage)+4}]

    frame $path -class NoteBook -borderwidth 0 -highlightthickness 0 \
	    -relief flat
    eval [list canvas $path.c] [Widget::subcget $path .c] \
	    [list -relief flat -borderwidth 0 -highlightthickness 0 \
	    -width $w -height $h]
    pack $path.c -expand yes -fill both

    # Removing the Canvas global bindings from our canvas as
    # application specific bindings on that tag may interfere with its
    # operation here. [SF item #459033]

    set bindings [bindtags $path.c]
    set pos [lsearch -exact $bindings Canvas]
    if {$pos >= 0} {
	set bindings [lreplace $bindings $pos $pos]
    }
    bindtags $path.c $bindings

    # Create the arrow button
    eval [list ArrowButton::create $path.c.fg] [Widget::subcget $path .c.fg] \
	    [list -highlightthickness 0 -type button -dir left \
	    -armcommand [list NoteBook::_xview $path -1]]

    eval [list ArrowButton::create $path.c.fd] [Widget::subcget $path .c.fd] \
	    [list -highlightthickness 0 -type button -dir right \
	    -armcommand [list NoteBook::_xview $path 1]]

    Widget::create NoteBook $path

    set bg [Widget::cget $path -background]
    foreach {data(dbg) data(lbg)} [BWidget::get3dcolor $path $bg] {break}

    return $path
}

proc NoteBook::configure { path args } {
    variable $path
    upvar 0  $path data

    set res [Widget::configure $path $args]
    set redraw 0
    set opts [list -font -homogeneous -tabpady]
    foreach {cf ch cp} [eval Widget::hasChangedX $path $opts] {break}
    if {$cf || $ch || $cp} {
        if { $cf || $cp } {
            _compute_height $path
        }
        _compute_width $path
        set redraw 1
    }
    set chibd [Widget::hasChanged $path -internalborderwidth ibd]
    set chbg  [Widget::hasChanged $path -background bg]
    if {$chibd || $chbg} {
        foreach page $data(pages) {
            $path.f$page configure \
                -borderwidth $ibd -background $bg
        }
    }

    if {$chbg} {
        set col [BWidget::get3dcolor $path $bg]
        set data(dbg)  [lindex $col 0]
        set data(lbg)  [lindex $col 1]
        set redraw 1
    }
    if { [Widget::hasChanged $path -foreground  fg] ||
         [Widget::hasChanged $path -borderwidth bd] ||
	 [Widget::hasChanged $path -arcradius radius] ||
         [Widget::hasChanged $path -tabbevelsize bevel] ||
         [Widget::hasChanged $path -side side] } {
        set redraw 1
    }
    set wc [Widget::hasChanged $path -width  w]
    set hc [Widget::hasChanged $path -height h]
    if { $wc || $hc } {
        $path.c configure \
		-width  [expr {$w + 4}] \
		-height [expr {$h + $data(hpage) + 4}]
    }
    if { $redraw } {
        _redraw $path
    }

    return $res
}

proc NoteBook::cget { path option } {
    return [Widget::cget $path $option]
}

proc NoteBook::compute_size { path } {
    variable $path
    upvar 0  $path data

    set wmax 0
    set hmax 0
    update idletasks
    foreach page $data(pages) {
        set w    [winfo reqwidth  $path.f$page]
        set h    [winfo reqheight $path.f$page]
        set wmax [expr {$w>$wmax ? $w : $wmax}]
        set hmax [expr {$h>$hmax ? $h : $hmax}]
    }
    configure $path -width $wmax -height $hmax
    # Sven... well ok so this is called twice in some cases...
    NoteBook::_redraw $path
    # Sven end
}

proc NoteBook::insert { path index page args } {
    variable $path
    upvar 0  $path data

    if { [lsearch -exact $data(pages) $page] != -1 } {
        return -code error "page \"$page\" already exists"
    }

    set f $path.f$page
    Widget::init NoteBook::Page $f $args

    set data(pages) [linsert $data(pages) $index $page]
    # If the page doesn't exist, create it; if it does reset its bg and ibd
    if { ![winfo exists $f] } {
        frame $f \
	    -relief      flat \
	    -background  [Widget::cget $path -background] \
	    -borderwidth [Widget::cget $path -internalborderwidth]
        set data($page,realized) 0
    } else {
	$f configure \
	    -background  [Widget::cget $path -background] \
	    -borderwidth [Widget::cget $path -internalborderwidth]
    }
    _compute_height $path
    _compute_width  $path
    _draw_page $path $page 1
    _redraw $path

    return $f
}

proc NoteBook::delete { path page {destroyframe 1} } {
    variable $path
    upvar 0  $path data

    set pos [_test_page $path $page]
    set data(pages) [lreplace $data(pages) $pos $pos]
    _compute_width $path
    $path.c delete p:$page
    if { $data(select) == $page } {
        set data(select) ""
    }
    if { $pos < $data(base) } {
        incr data(base) -1
    }
    if { $destroyframe } {
        destroy $path.f$page
        unset data($page,width) data($page,realized)
    }
    _redraw $path
}

proc NoteBook::itemconfigure { path page args } {
    _test_page $path $page
    set res [_itemconfigure $path $page $args]
    _redraw $path

    return $res
}

proc NoteBook::itemcget { path page option } {
    _test_page $path $page
    return [Widget::cget $path.f$page $option]
}

proc NoteBook::bindtabs { path event script } {
    if { $script != "" } {
	append script " \[NoteBook::_get_page_name [list $path] current 1\]"
        $path.c bind "page" $event $script
    } else {
        $path.c bind "page" $event {}
    }
}

proc NoteBook::move { path page index } {
    variable $path
    upvar 0  $path data

    set pos [_test_page $path $page]
    set data(pages) [linsert [lreplace $data(pages) $pos $pos] $index $page]
    _redraw $path
}

proc NoteBook::raise { path {page ""} } {
    variable $path
    upvar 0  $path data

    if { $page != "" } {
        _test_page $path $page
        _select $path $page
    }
    return $data(select)
}

proc NoteBook::see { path page } {
    variable $path
    upvar 0  $path data

    set pos [_test_page $path $page]
    if { $pos < $data(base) } {
        set data(base) $pos
        _redraw $path
    } else {
        set w     [expr {[winfo width $path]-1}]
        set fpage [expr {[_get_x_page $path $pos] + $data($page,width) + 6}]
        set idx   $data(base)
        while { $idx < $pos && $fpage > $w } {
            set fpage [expr {$fpage - $data([lindex $data(pages) $idx],width)}]
            incr idx
        }
        if { $idx != $data(base) } {
            set data(base) $idx
            _redraw $path
        }
    }
}

proc NoteBook::page { path first {last ""} } {
    variable $path
    upvar 0  $path data

    if { $last == "" } {
        return [lindex $data(pages) $first]
    } else {
        return [lrange $data(pages) $first $last]
    }
}

proc NoteBook::pages { path {first ""} {last ""}} {
    variable $path
    upvar 0  $path data

    if { ![string length $first] } {
	return $data(pages)
    }

    if { ![string length $last] } {
        return [lindex $data(pages) $first]
    } else {
        return [lrange $data(pages) $first $last]
    }
}

proc NoteBook::index { path page } {
    variable $path
    upvar 0  $path data

    return [lsearch -exact $data(pages) $page]
}

proc NoteBook::_destroy { path } {
    variable $path
    upvar 0  $path data

    foreach page $data(pages) {
        Widget::destroy $path.f$page
    }
    Widget::destroy $path
    unset data
}

proc NoteBook::getframe { path page } {
    return $path.f$page
}

proc NoteBook::_test_page { path page } {
    variable $path
    upvar 0  $path data

    if { [set pos [lsearch -exact $data(pages) $page]] == -1 } {
        return -code error "page \"$page\" does not exists"
    }
    return $pos
}

proc NoteBook::_getoption { path page option } {
    set value [Widget::cget $path.f$page $option]
    if {![string length $value]} {
        set value [Widget::cget $path $option]
    }
    return $value
}

proc NoteBook::_itemconfigure { path page lres } {
    variable $path
    upvar 0  $path data

    set res [Widget::configure $path.f$page $lres]
    if { [Widget::hasChanged $path.f$page -text foo] } {
        _compute_width $path
    } elseif  { [Widget::hasChanged $path.f$page -image foo] } {
        _compute_height $path
        _compute_width  $path
    }
    if { [Widget::hasChanged $path.f$page -state state] &&
         $state == "disabled" && $data(select) == $page } {
        set data(select) ""
    }
    return $res
}

proc NoteBook::_compute_width { path } {
    variable $path
    upvar 0  $path data

    set wmax 0
    set wtot 0
    set hmax $data(hpage)
    set font [Widget::cget $path -font]
    if { ![info exists data(textid)] } {
        set data(textid) [$path.c create text 0 -100 -font $font -anchor nw]
    }
    set id $data(textid)
    $path.c itemconfigure $id -font $font
    foreach page $data(pages) {
        $path.c itemconfigure $id -text [Widget::cget $path.f$page -text]
	# Get the bbox for this text to determine its width, then substract
	# 6 from the width to account for canvas bbox oddness w.r.t. widths of
	# simple text.
	foreach {x1 y1 x2 y2} [$path.c bbox $id] break
	set x2 [expr {$x2 - 6}]
        set wtext [expr {$x2 - $x1 + 20}]
        if { [set img [Widget::cget $path.f$page -image]] != "" } {
            set wtext [expr {$wtext + [image width $img] + 4}]
            set himg  [expr {[image height $img] + 6}]
            if { $himg > $hmax } {
                set hmax $himg
            }
        }
        set  wmax  [expr {$wtext > $wmax ? $wtext : $wmax}]
        incr wtot  $wtext
        set  data($page,width) $wtext
    }
    if { [Widget::cget $path -homogeneous] } {
        foreach page $data(pages) {
            set data($page,width) $wmax
        }
        set wtot [expr {$wmax * [llength $data(pages)]}]
    }
    set data(hpage) $hmax
    set data(wpage) $wtot
}

proc NoteBook::_compute_height { path } {
    variable $path
    upvar 0  $path data

    set font    [Widget::cget $path -font]
    set pady0   [Widget::_get_padding $path -tabpady 0]
    set pady1   [Widget::_get_padding $path -tabpady 1]
    set metrics [font metrics $font -linespace]
    set imgh    0
    set lines   1
    foreach page $data(pages) {
        set img  [Widget::cget $path.f$page -image]
        set text [Widget::cget $path.f$page -text]
        set len [llength [split $text \n]]
        if {$len > $lines} { set lines $len}
        if {$img != ""} {
            set h [image height $img]
            if {$h > $imgh} { set imgh $h }
        }
    }
    set height [expr {$metrics * $lines}]
    if {$imgh > $height} { set height $imgh }
    set data(hpage) [expr {$height + $pady0 + $pady1}]
}

proc NoteBook::_get_x_page { path pos } {
    variable _warrow
    variable $path
    upvar 0  $path data

    set base $data(base)
    # notebook tabs start flush with the left side of the notebook
    set x 0
    if { $pos < $base } {
        foreach page [lrange $data(pages) $pos [expr {$base-1}]] {
            incr x [expr {-$data($page,width)}]
        }
    } elseif { $pos > $base } {
        foreach page [lrange $data(pages) $base [expr {$pos-1}]] {
            incr x $data($page,width)
        }
    }
    return $x
}

proc NoteBook::_xview { path inc } {
    variable $path
    upvar 0  $path data

    if { $inc == -1 } {
        set base [expr {$data(base)-1}]
        set dx $data([lindex $data(pages) $base],width)
    } else {
        set dx [expr {-$data([lindex $data(pages) $data(base)],width)}]
        set base [expr {$data(base)+1}]
    }

    if { $base >= 0 && $base < [llength $data(pages)] } {
        set data(base) $base
        $path.c move page $dx 0
        _draw_area   $path
        _draw_arrows $path
    }
}

proc NoteBook::_highlight { type path page } {
    variable $path
    upvar 0  $path data

    if { [string equal [Widget::cget $path.f$page -state] "disabled"] } {
        return
    }

    switch -- $type {
        on {
            $path.c itemconfigure "$page:poly" \
		    -fill [_getoption $path $page -activebackground]
            $path.c itemconfigure "$page:text" \
		    -fill [_getoption $path $page -activeforeground]
        }
        off {
            $path.c itemconfigure "$page:poly" \
		    -fill [_getoption $path $page -background]
            $path.c itemconfigure "$page:text" \
		    -fill [_getoption $path $page -foreground]
        }
    }
}

proc NoteBook::_select { path page } {
    variable $path
    upvar 0  $path data

    if {![string equal [Widget::cget $path.f$page -state] "normal"]} { return }

    set oldsel $data(select)

    if {[string equal $page $oldsel]} { return }

    if { ![string equal $oldsel ""] } {
	set cmd [Widget::cget $path.f$oldsel -leavecmd]
	if { ![string equal $cmd ""] } {
	    set code [catch {uplevel \#0 $cmd} res]
	    if { $code == 1 || $res == 0 } {
		return -code $code $res
	    }
	}
	set data(select) ""
	_draw_page $path $oldsel 0
    }

    set data(select) $page
    if { ![string equal $page ""] } {
	if { !$data($page,realized) } {
	    set data($page,realized) 1
	    set cmd [Widget::cget $path.f$page -createcmd]
	    if { ![string equal $cmd ""] } {
		uplevel \#0 $cmd
	    }
	}
	set cmd [Widget::cget $path.f$page -raisecmd]
	if { ![string equal $cmd ""] } {
	    uplevel \#0 $cmd
	}
	_draw_page $path $page 0
    }

    _draw_area $path
}

proc NoteBook::_redraw { path } {
    variable $path
    upvar 0  $path data

    if { !$data(realized) } { return }

    _compute_height $path

    foreach page $data(pages) {
        _draw_page $path $page 0
    }
    _draw_area   $path
    _draw_arrows $path
}

proc NoteBook::_draw_page { path page create } {
    variable $path
    upvar 0  $path data

    # --- calcul des coordonnees et des couleurs de l'onglet ------------------
    set pos [lsearch -exact $data(pages) $page]
    set bg  [_getoption $path $page -background]

    # lookup the tab colors
    set fgt   $data(lbg)
    set fgb   $data(dbg)

    set h   $data(hpage)
    set xd  [_get_x_page $path $pos]
    set xf  [expr {$xd + $data($page,width)}]

    # Set the initial text offsets -- a few pixels down, centered left-to-right
    set textOffsetY [expr [Widget::_get_padding $path -tabpady 0] + 3]
    set textOffsetX 9

    set top		2
    set arcRadius	[Widget::cget $path -arcradius]
    set xBevel		[Widget::cget $path -tabbevelsize]

    if { $data(select) != $page } {
	if { $pos == 0 } {
	    # The leftmost page is a special case -- it is drawn with its
	    # tab a little indented.  To achieve this, we incr xd.  We also
	    # decr textOffsetX, so that the text doesn't move left/right.
	    incr xd 2
	    incr textOffsetX -2
	}
    } else {
	# The selected page's text is raised higher than the others
	incr top -2
    }

    # Precompute some coord values that we use a lot
    set topPlusRadius	[expr {$top + $arcRadius}]
    set rightPlusRadius	[expr {$xf + $arcRadius}]
    set leftPlusRadius	[expr {$xd + $arcRadius}]

    # Sven
    set side [Widget::cget $path -side]
    set tabsOnBottom [string equal $side "bottom"]

    set h1 [expr {[winfo height $path]}]
    set bd [Widget::cget $path -borderwidth]
    if {$bd < 1} { set bd 1 }

    if { $tabsOnBottom } {
	# adjust to keep bottom edge in view
	incr h1 -1
	set top [expr {$top * -1}]
	set topPlusRadius [expr {$topPlusRadius * -1}]
	# Hrm... the canvas has an issue with drawing diagonal segments
	# of lines from the bottom to the top, so we have to draw this line
	# backwards (ie, lt is actually the bottom, drawn from right to left)
        set lt  [list \
		$rightPlusRadius			[expr {$h1-$h-1}] \
		[expr {$rightPlusRadius - $xBevel}]	[expr {$h1 + $topPlusRadius}] \
		[expr {$xf - $xBevel}]			[expr {$h1 + $top}] \
		[expr {$leftPlusRadius + $xBevel}]	[expr {$h1 + $top}] \
		]
        set lb  [list \
		[expr {$leftPlusRadius + $xBevel}]	[expr {$h1 + $top}] \
		[expr {$xd + $xBevel}]			[expr {$h1 + $topPlusRadius}] \
		$xd					[expr {$h1-$h-1}] \
		]
	# Because we have to do this funky reverse order thing, we have to
	# swap the top/bottom colors too.
	set tmp $fgt
	set fgt $fgb
	set fgb $tmp
    } else {
	set lt [list \
		$xd					$h \
		[expr {$xd + $xBevel}]			$topPlusRadius \
		[expr {$leftPlusRadius + $xBevel}]	$top \
		[expr {$xf + 1 - $xBevel}]		$top \
		]
	set lb [list \
		[expr {$xf + 1 - $xBevel}] 		[expr {$top + 1}] \
		[expr {$rightPlusRadius - $xBevel}]	$topPlusRadius \
		$rightPlusRadius			$h \
		]
    }

    set img [Widget::cget $path.f$page -image]

    set ytext $top
    if { $tabsOnBottom } {
	# The "+ 2" below moves the text closer to the bottom of the tab,
	# so it doesn't look so cramped.  I should be able to achieve the
	# same goal by changing the anchor of the text and using this formula:
	# ytext = $top + $h1 - $textOffsetY
	# but that doesn't quite work (I think the linespace from the text
	# gets in the way)
	incr ytext [expr {$h1 - $h + 2}]
    }
    incr ytext $textOffsetY

    set xtext [expr {$xd + $textOffsetX}]
    if { $img != "" } {
	# if there's an image, put it on the left and move the text right
	set ximg $xtext
	incr xtext [expr {[image width $img] + 2}]
    }
	
    if { $data(select) == $page } {
        set bd    [Widget::cget $path -borderwidth]
	if {$bd < 1} { set bd 1 }
        set fg    [_getoption $path $page -foreground]
    } else {
        set bd    1
        if { [Widget::cget $path.f$page -state] == "normal" } {
            set fg [_getoption $path $page -foreground]
        } else {
            set fg [_getoption $path $page -disabledforeground]
        }
    }

    # --- creation ou modification de l'onglet --------------------------------
    # Sven
    if { $create } {
	# Create the tab region
        eval [list $path.c create polygon] [concat $lt $lb] [list \
		-tags		[list page p:$page $page:poly] \
		-outline	$bg \
		-fill		$bg \
		]
        eval [list $path.c create line] $lt [list \
            -tags [list page p:$page $page:top top] -fill $fgt -width $bd]
        eval [list $path.c create line] $lb [list \
            -tags [list page p:$page $page:bot bot] -fill $fgb -width $bd]
        $path.c create text $xtext $ytext 			\
		-text	[Widget::cget $path.f$page -text]	\
		-font	[Widget::cget $path -font]		\
		-fill	$fg					\
		-anchor	nw					\
		-tags	[list page p:$page $page:text]

        $path.c bind p:$page <ButtonPress-1> \
		[list NoteBook::_select $path $page]
        $path.c bind p:$page <Enter> \
		[list NoteBook::_highlight on  $path $page]
        $path.c bind p:$page <Leave> \
		[list NoteBook::_highlight off $path $page]
    } else {
        $path.c coords "$page:text" $xtext $ytext

        $path.c itemconfigure "$page:text" \
            -text [Widget::cget $path.f$page -text] \
            -font [Widget::cget $path -font] \
            -fill $fg
    }
    eval [list $path.c coords "$page:poly"] [concat $lt $lb]
    eval [list $path.c coords "$page:top"]  $lt
    eval [list $path.c coords "$page:bot"]  $lb
    $path.c itemconfigure "$page:poly" -fill $bg  -outline $bg
    $path.c itemconfigure "$page:top"  -fill $fgt -width $bd
    $path.c itemconfigure "$page:bot"  -fill $fgb -width $bd
    
    # Sven end

    if { $img != "" } {
        # Sven
	set id [$path.c find withtag $page:img]
	if { [string equal $id ""] } {
	    set id [$path.c create image $ximg $ytext \
		    -anchor nw    \
		    -tags   [list page p:$page $page:img]]
        }
        $path.c coords $id $ximg $ytext
        $path.c itemconfigure $id -image $img
        # Sven end
    } else {
        $path.c delete $page:img
    }

    if { $data(select) == $page } {
        $path.c raise p:$page
    } elseif { $pos == 0 } {
        if { $data(select) == "" } {
            $path.c raise p:$page
        } else {
            $path.c lower p:$page p:$data(select)
        }
    } else {
        set pred [lindex $data(pages) [expr {$pos-1}]]
        if { $data(select) != $pred || $pos == 1 } {
            $path.c lower p:$page p:$pred
        } else {
            $path.c lower p:$page p:[lindex $data(pages) [expr {$pos-2}]]
        }
    }
}

proc NoteBook::_draw_arrows { path } {
    variable _warrow
    variable $path
    upvar 0  $path data

    set w       [expr {[winfo width $path]-1}]
    set h       [expr {$data(hpage)-1}]
    set nbpages [llength $data(pages)]
    set xl      0
    set xr      [expr {$w-$_warrow+1}]

    set side [Widget::cget $path -side]
    if { [string equal $side "bottom"] } {
        set h1 [expr {[winfo height $path]-1}]
        set bd [Widget::cget $path -borderwidth]
	if {$bd < 1} { set bd 1 }
        set y0 [expr {$h1 - $data(hpage) + $bd}]
    } else {
        set y0 1
    }

    if { $data(base) > 0 } {
        # Sven 
        if { ![llength [$path.c find withtag "leftarrow"]] } {
            $path.c create window $xl $y0 \
                -width  $_warrow            \
                -height $h                  \
                -anchor nw                  \
                -window $path.c.fg            \
                -tags   "leftarrow"
        } else {
            $path.c coords "leftarrow" $xl $y0
            $path.c itemconfigure "leftarrow" -width $_warrow -height $h
        }
        # Sven end
    } else {
        $path.c delete "leftarrow"
    }

    if { $data(base) < $nbpages-1 &&
         $data(wpage) + [_get_x_page $path 0] + 6 > $w } {
        # Sven
        if { ![llength [$path.c find withtag "rightarrow"]] } {
            $path.c create window $xr $y0 \
                -width  $_warrow            \
                -height $h                  \
                -window $path.c.fd            \
                -anchor nw                  \
                -tags   "rightarrow"
        } else {
            $path.c coords "rightarrow" $xr $y0
            $path.c itemconfigure "rightarrow" -width $_warrow -height $h
        }
        # Sven end
    } else {
        $path.c delete "rightarrow"
    }
}

proc NoteBook::_draw_area { path } {
    variable $path
    upvar 0  $path data

    set w   [expr {[winfo width  $path] - 1}]
    set h   [expr {[winfo height $path] - 1}]
    set bd  [Widget::cget $path -borderwidth]
    if {$bd < 1} { set bd 1 }
    set x0  [expr {$bd - 1}]

    set arcRadius [Widget::cget $path -arcradius]

    # Sven
    set side [Widget::cget $path -side]
    if {"$side" == "bottom"} {
        set y0 0
        set y1 [expr {$h - $data(hpage)}]
        set yo $y1
    } else {
        set y0 $data(hpage)
        set y1 $h
        set yo [expr {$h-$y0}]
    }
    # Sven end
    set dbg $data(dbg)
    set sel $data(select)
    if {  $sel == "" } {
        set xd  [expr {$w/2}]
        set xf  $xd
        set lbg $data(dbg)
    } else {
        set xd [_get_x_page $path [lsearch -exact $data(pages) $data(select)]]
        set xf [expr {$xd + $data($sel,width) + $arcRadius + 1}]
        set lbg $data(lbg)
    }

    # Sven
    if { [llength [$path.c find withtag rect]] == 0} {
        $path.c create line $xd $y0 $x0 $y0 $x0 $y1 \
            -tags "rect toprect1" 
        $path.c create line $w $y0 $xf $y0 \
            -tags "rect toprect2"
        $path.c create line 1 $h $w $h $w $y0 \
            -tags "rect botrect"
    }
    if {"$side" == "bottom"} {
        $path.c coords "toprect1" $w $y0 $x0 $y0 $x0 $y1
        $path.c coords "toprect2" $x0 $y1 $xd $y1
        $path.c coords "botrect"  $xf $y1 $w $y1 $w $y0
        $path.c itemconfigure "toprect1" -fill $lbg -width $bd
        $path.c itemconfigure "toprect2" -fill $dbg -width $bd
        $path.c itemconfigure "botrect" -fill $dbg -width $bd
    } else {
        $path.c coords "toprect1" $xd $y0 $x0 $y0 $x0 $y1
        $path.c coords "toprect2" $w $y0 $xf $y0
        $path.c coords "botrect"  $x0 $h $w $h $w $y0
        $path.c itemconfigure "toprect1" -fill $lbg -width $bd
        $path.c itemconfigure "toprect2" -fill $lbg -width $bd
        $path.c itemconfigure "botrect" -fill $dbg -width $bd
    }
    $path.c raise "rect"
    # Sven end

    if { $sel != "" } {
        # Sven
        if { [llength [$path.c find withtag "window"]] == 0 } {
            $path.c create window 2 [expr {$y0+1}] \
                -width  [expr {$w-3}]           \
                -height [expr {$yo-3}]          \
                -anchor nw                      \
                -tags   "window"                \
                -window $path.f$sel
        }
        $path.c coords "window" 2 [expr {$y0+1}]
        $path.c itemconfigure "window"    \
            -width  [expr {$w-3}]           \
            -height [expr {$yo-3}]          \
            -window $path.f$sel
        # Sven end
    } else {
        $path.c delete "window"
    }
}

proc NoteBook::_resize { path } {
    variable $path
    upvar 0  $path data

    if {!$data(realized)} {
	if { [set width  [Widget::cget $path -width]]  == 0 ||
	     [set height [Widget::cget $path -height]] == 0 } {
	    compute_size $path
	}
	set data(realized) 1
    }

    NoteBook::_redraw $path
}

proc NoteBook::_get_page_name { path {item current} {tagindex end-1} } {
    return [string range [lindex [$path.c gettags $item] $tagindex] 2 end]
}
# -----------------------------------------------------------------------------
#  scrollw.tcl -- part of Unifix BWidget Toolkit
# -----------------------------------------------------------------------------

namespace eval ScrolledWindow {
    Widget::define ScrolledWindow scrollw

    Widget::declare ScrolledWindow {
	{-background  TkResource ""   0 button}
	{-scrollbar   Enum	 both 0 {none both vertical horizontal}}
	{-auto	      Enum	 both 0 {none both vertical horizontal}}
	{-sides	      Enum	 se   0 {ne en nw wn se es sw ws}}
	{-size	      Int	 0    1 "%d >= 0"}
	{-ipad	      Int	 1    1 "%d >= 0"}
	{-managed     Boolean	 1    1}
	{-relief      TkResource flat 0 frame}
	{-borderwidth TkResource 0    0 frame}
	{-bg	      Synonym	 -background}
	{-bd	      Synonym	 -borderwidth}
    }

    Widget::addmap ScrolledWindow "" :cmd {-relief {} -borderwidth {}}
}

proc ScrolledWindow::create { path args } {
    Widget::init ScrolledWindow $path $args

    Widget::getVariable $path data

    set bg     [Widget::cget $path -background]
    set sbsize [Widget::cget $path -size]
    set sw     [eval [list frame $path \
			  -relief flat -borderwidth 0 -background $bg \
			  -highlightthickness 0 -takefocus 0] \
		    [Widget::subcget $path :cmd]]

    scrollbar $path.hscroll \
	    -highlightthickness 0 -takefocus 0 \
	    -orient	 horiz	\
	    -relief	 sunken	\
	    -bg	 $bg
    scrollbar $path.vscroll \
	    -highlightthickness 0 -takefocus 0 \
	    -orient	 vert	\
	    -relief	 sunken	\
	    -bg	 $bg

    set data(realized) 0

    _setData $path \
	    [Widget::cget $path -scrollbar] \
	    [Widget::cget $path -auto] \
	    [Widget::cget $path -sides]

    if {[Widget::cget $path -managed]} {
	set data(hsb,packed) $data(hsb,present)
	set data(vsb,packed) $data(vsb,present)
    } else {
	set data(hsb,packed) 0
	set data(vsb,packed) 0
    }
    if {$sbsize} {
	$path.vscroll configure -width $sbsize
	$path.hscroll configure -width $sbsize
    } else {
	set sbsize [$path.vscroll cget -width]
    }
    set data(ipad) [Widget::cget $path -ipad]

    if {$data(hsb,packed)} {
	grid $path.hscroll -column 1 -row $data(hsb,row) \
		-sticky ew -ipady $data(ipad)
    }
    if {$data(vsb,packed)} {
	grid $path.vscroll -column $data(vsb,column) -row 1 \
		-sticky ns -ipadx $data(ipad)
    }

    grid columnconfigure $path 1 -weight 1
    grid rowconfigure	 $path 1 -weight 1

    bind $path <Configure> [list ScrolledWindow::_realize $path]
    bind $path <Destroy>   [list ScrolledWindow::_destroy $path]

    return [Widget::create ScrolledWindow $path]
}

proc ScrolledWindow::getframe { path } {
    return $path
}

proc ScrolledWindow::setwidget { path widget } {
    Widget::getVariable $path data

    if {[info exists data(widget)] && [winfo exists $data(widget)]
	&& ![string equal $data(widget) $widget]} {
	grid remove $data(widget)
	$data(widget) configure -xscrollcommand "" -yscrollcommand ""
    }
    set data(widget) $widget
    grid $widget -in $path -row 1 -column 1 -sticky news

    $path.hscroll configure -command [list $widget xview]
    $path.vscroll configure -command [list $widget yview]
    $widget configure \
	    -xscrollcommand [list ScrolledWindow::_set_hscroll $path] \
	    -yscrollcommand [list ScrolledWindow::_set_vscroll $path]
}

proc ScrolledWindow::configure { path args } {
    Widget::getVariable $path data

    set res [Widget::configure $path $args]
    if { [Widget::hasChanged $path -background bg] } {
	$path configure -background $bg
	catch {$path.hscroll configure -background $bg}
	catch {$path.vscroll configure -background $bg}
    }

    if {[Widget::hasChanged $path -scrollbar scrollbar] | \
	    [Widget::hasChanged $path -auto	 auto]	| \
	    [Widget::hasChanged $path -sides	 sides]} {
	_setData $path $scrollbar $auto $sides
	foreach {vmin vmax} [$path.hscroll get] { break }
	set data(hsb,packed) [expr {$data(hsb,present) && \
		(!$data(hsb,auto) || ($vmin != 0 || $vmax != 1))}]
	foreach {vmin vmax} [$path.vscroll get] { break }
	set data(vsb,packed) [expr {$data(vsb,present) && \
		(!$data(vsb,auto) || ($vmin != 0 || $vmax != 1))}]

	set data(ipad) [Widget::cget $path -ipad]

	if {$data(hsb,packed)} {
	    grid $path.hscroll -column 1 -row $data(hsb,row) \
		-sticky ew -ipady $data(ipad)
	} else {
	    if {![info exists data(hlock)]} {
		set data(hsb,packed) 0
		grid remove $path.hscroll
	    }
	}
	if {$data(vsb,packed)} {
	    grid $path.vscroll -column $data(vsb,column) -row 1 \
		-sticky ns -ipadx $data(ipad)
	} else {
	    if {![info exists data(hlock)]} {
		set data(vsb,packed) 0
		grid remove $path.vscroll
	    }
	}
    }
    return $res
}

proc ScrolledWindow::cget { path option } {
    return [Widget::cget $path $option]
}

proc ScrolledWindow::_set_hscroll { path vmin vmax } {
    Widget::getVariable $path data

    if {$data(realized) && $data(hsb,present)} {
	if {$data(hsb,auto) && ![info exists data(hlock)]} {
	    if {$data(hsb,packed) && $vmin == 0 && $vmax == 1} {
		set data(hsb,packed) 0
		grid remove $path.hscroll
		set data(hlock) 1
		update idletasks
		unset data(hlock)
	    } elseif {!$data(hsb,packed) && ($vmin != 0 || $vmax != 1)} {
		set data(hsb,packed) 1
		grid $path.hscroll -column 1 -row $data(hsb,row) \
			-sticky ew -ipady $data(ipad)
		set data(hlock) 1
		update idletasks
		unset data(hlock)
	    }
	}
	$path.hscroll set $vmin $vmax
    }
}

proc ScrolledWindow::_set_vscroll { path vmin vmax } {
    Widget::getVariable $path data

    if {$data(realized) && $data(vsb,present)} {
	if {$data(vsb,auto) && ![info exists data(vlock)]} {
	    if {$data(vsb,packed) && $vmin == 0 && $vmax == 1} {
		set data(vsb,packed) 0
		grid remove $path.vscroll
		set data(vlock) 1
		update idletasks
		unset data(vlock)
	    } elseif {!$data(vsb,packed) && ($vmin != 0 || $vmax != 1) } {
		set data(vsb,packed) 1
		grid $path.vscroll -column $data(vsb,column) -row 1 \
			-sticky ns -ipadx $data(ipad)
		set data(vlock) 1
		update idletasks
		unset data(vlock)
	    }
	}
	$path.vscroll set $vmin $vmax
    }
}

proc ScrolledWindow::_setData {path scrollbar auto sides} {
    Widget::getVariable $path data

    set sb    [lsearch {none horizontal vertical both} $scrollbar]
    set auto  [lsearch {none horizontal vertical both} $auto]

    set data(hsb,present)  [expr {($sb & 1) != 0}]
    set data(hsb,auto)	   [expr {($auto & 1) != 0}]
    set data(hsb,row)	   [expr {[string match *n* $sides] ? 0 : 2}]

    set data(vsb,present)  [expr {($sb & 2) != 0}]
    set data(vsb,auto)	   [expr {($auto & 2) != 0}]
    set data(vsb,column)   [expr {[string match *w* $sides] ? 0 : 2}]
}

proc ScrolledWindow::_realize { path } {
    Widget::getVariable $path data

    bind $path <Configure> {}
    set data(realized) 1
}

proc ScrolledWindow::_destroy { path } {
    Widget::destroy $path
}

############ end of BWidget code ##############
############ iSpin GUI specific code: #########

set Fname ""
set Sname "ispin_session"
set lno 1
set Curp Mp

set s_typ 0
set seed 123
set skipstep 0
set ubstep 10000
set l_typ 0

set stop 0
set step 0
set maxn 0
set curn 0
set lno 0
set cnt 1
set msc_full 0
set negate_ltl 0
set var_vals 1

set vo 0	;# verification output
set vr 0	;# verification reference

set msc_x 75
set msc_y 20
set msc_w 75
set msc_h 20
set msc_max_x $msc_x
set msc_delay 25	;# milliseconds update delay
set msc_max_w 20

set Varnm() 0
set VarStep() 0
set Levels() 0
set LineNo() 0
set MSC_Y() 0
set LineTouched() 0

set sym_pan ""
set note_pan ""
set nvr_pan ""
set log_pan ""

set bet(0)	"Physical Memory Available (in Mbytes): "
set ival(0)	1024
set expl(0)	"explain"

set bet(1)	"Estimated State Space Size (states x 10^3): "
set ival(1)	1000
set expl(1)	"explain"

set bet(2)	"Maximum Search Depth (steps): "
set ival(2)	10000
set expl(2)	"explain"

set bet(3)	"Nr of hash-functions in Bitstate mode: "
set ival(3)	3
set expl(3)	"explain"

set bet(4)	"Size for Minimized Automaton"
set ival(4)	100
set expl(4)	"explain"

set bet(5)	"Extra Verifier Generation Options: "
set ival(5)	""
set expl(5)	"explain"

set bet(6)	"Extra Compile-Time Directives: "
set ival(6)	"-O2"
set expl(6)	"explain"

set bet(7)	"Extra Run-Time Options: "
set ival(7)	""
set expl(7)	"explain"

set estop 0
set s_mode 0
set po_mode 1
set bf_mode 0
set ma_mode 0
set cc_mode 0
set p_mode 0
set c_mode 0
set u_mode 1
set a_mode 1
set x_mode 0
set e_mode 1
set q_mode 0
set f_mode 0
set bc_mode 0
set it_mode 0
set sv_mode 0
set vpanel 0
set spanel 0

set pat ""	;# search pattern

set swarm_p(0) "minimum nr of hash functions:"
set swarm_i(0) "1"
set swarm_p(1) "maximum nr of hash functions:"
set swarm_i(1) "5"
set swarm_p(2) "minimum search depth:"
set swarm_i(2) "100"
set swarm_p(3) "maximum search depth:"
set swarm_i(3) "10000"
set swarm_p(4) "number of local cpu-cores"
set swarm_i(4) "4"
set swarm_p(5) "list of remote_cpu_name:ncores"
set swarm_i(5) ""
set swarm_p(6) "maximum memory per run (suffix: M or G)"
set swarm_i(6) "512M"
set swarm_p(7) "maximum total runtime for swarm (suffix: s, m, h, d)"
set swarm_i(7) "60m"

set swarm_p(8) "hash-factor"
set swarm_i(8) "1.5"
set swarm_p(9) "state-vector size in bytes"
set swarm_i(9) "512"
set swarm_p(10) "exploration speed in states/sec"
set swarm_i(10) "250000"

set so 0	;# swarm cfg output
set sr 0	;# swarm run output

set o_v 0
set o_y 30

proc add_frame {fn t} {
	global TBG TFG

	frame $fn -bg $TBG
	label $fn.lbl -text "$t" -bg $TBG -fg $TFG
	entry $fn.ent -relief sunken -width 10

	pack $fn -side top -fill x -expand yes
	pack $fn.lbl -side left -fill x -expand no
	pack $fn.ent -side right -fill x -expand no

	bind $fn.ent <Return> { run_sim }
}

proc do_find {} {
	global twin pat

	$twin tag remove hilite 0.0 end
	forAllMatches $twin $pat
}

proc model_panel {t} {
	global clog twin fg CBG CFG HV0 HV1 TBG TFG MFG NFG NBG pat ScrollBarSize Fname
global xzx
	frame $t.buttons -bg $CBG
	button $t.buttons.open -text "Open..." -command "open_spec 1" \
		-bg $NBG -fg white -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $t.buttons.ref -text "ReOpen" -command "open_spec 0" \
		-bg $NBG -fg white -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $t.buttons.save -text "Save" -command "save_spec 0" \
		-bg $NBG -fg white -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $t.buttons.saveas -text "Save As..." -command "save_spec 1" \
		-bg $NBG -fg white -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $t.buttons.syntax -text "Syntax Check" -command "runsyntax 0" \
		-bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $t.buttons.slice -text "Redundancy Check" -command "runsyntax 1" \
		-bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $t.buttons.symb -text "Symbol Table" -command "symbol_table" \
		-bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $t.buttons.fnd1 -text "Find:" \
		-command "do_find" \
		-bg $NBG -fg white -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	entry $t.buttons.fnd2 -width 24 -textvariable pat -bg ivory \
		-relief sunken -background $TBG -foreground $TFG
	bind  $t.buttons.fnd2 <Return> { do_find }

	pack $t.buttons -side top -fill x -expand no

	pack	$t.buttons.open $t.buttons.ref $t.buttons.save \
		$t.buttons.saveas \
		$t.buttons.syntax $t.buttons.slice \
		$t.buttons.symb \
		-side left -fill x -expand no

	pack $t.buttons.fnd1 $t.buttons.fnd2 \
		-side left -fill x -expand no

	set pw  [PanedWindow $t.pw -side left -activator button ]

	set p2  [$pw add -minsize 100]
	set p1  [$pw add -minsize 20]

        set sw11   [ScrolledWindow $p1.sw -size $ScrollBarSize]
        set clog   [text $sw11.lb -height 15 -width 100 -highlightthickness 3 -bg $CBG -fg $CFG -font $HV1]
	$sw11 setwidget $clog
	pack $sw11 -fill both -expand yes
###
	set xx [PanedWindow $p2.wide -side top -activator button ]
	set q0 [$xx add -minsize 10]
	set q1 [$xx add -minsize 10]

	set sw22   [ScrolledWindow $q0.wide -size $ScrollBarSize]
	set twin   [text $sw22.lb -undo 1 -height 30 -highlightthickness 0 -font $HV1]
	$sw22 setwidget $twin

	pack $sw22 -side left -fill both -expand yes

	$twin insert end "model source $Fname"
	$twin edit modified false

	global scrollxregion scrollyregion

	set cv [ScrolledWindow $q1.wide -size $ScrollBarSize]
	set fg [canvas $cv.right -relief raised \
		-background $NBG -scrollregion "0 0 $scrollxregion $scrollyregion" ]
set xzx $fg
	$cv setwidget $fg

	frame $q1.ctl -bg $NBG

	button $q1.ctl.mkg -text "Automata View" -command "mk_graphs" \
		-bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $q1.ctl.plus  -text "zoom in" -command "$fg scale all 0 0 1.1 1.1" -width 10 \
		-bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG
	button $q1.ctl.minus -text "zoom out" -command "$fg scale all 0 0 0.9 0.9" -width 10 \
		-bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG

	pack $q1.ctl $q1.ctl.mkg   -side left  -fill x -expand no
	pack $q1.ctl $q1.ctl.minus -side right -fill x -expand no
	pack $q1.ctl $q1.ctl.plus  -side right -fill x -expand no
	pack $q1 $q1.ctl -side top

	pack $cv -side right -fill both -expand yes
	pack $xx -fill both -expand yes
	pack $pw -fill both -expand yes

	bind  $twin <KeyRelease> {
		if {"%K" == "Return"} {
			$twin insert insert "[$twin index insert]	"
			$twin edit modified true
	}	}

	bind $fg <2> "$fg scan mark %x %y"
	bind $fg <B2-Motion> "$fg scan dragto %x %y"
}

proc checked_exit {} {
	global twin

	if {[$twin edit modified]} {
		set answer [tk_messageBox -icon question -type yesno \
		 -message "There are unsaved changes. Really Quit?" ]
		switch -- $answer {
		yes { }
		no  { return }
		}
	}
	destroy .
	exit
}

proc mk_pan { t GC CC } {
	global vo RM

	set errmsg ""
	$vo insert end $GC\n; update
	set fd -1
	catch {set fd [open "|$GC" r]} errmsg
	if {$fd == -1} {
		$vo delete 0.0 end
		$vo insert end "error:  $errmsg\n"
			$vo yview end
		return
	} else {
		while {[gets $fd line] > -1} {
			$vo insert end "$line\n"
			$vo yview end
			update
		}
		catch " close $fd "
	}

	$vo insert end $CC\n; update

	catch "eval exec $CC >& pan.tmp"

	set fd -1
	catch {set fd [open "pan.tmp" r]} errmsg
	if {$fd == -1} {
		$vo delete 0.0 end
		$vo insert end "$errmsg\n"
		$vo yview end
	} else {
		while {[gets $fd line] > -1} {
			$vo insert end "$line\n"
			$vo yview end
			update
		}
		catch " close $fd "
	}
	catch { eval exec "$RM pan.tmp" }
	update
}

proc run_pan { t VC d } {
	global vr vo stop KILL

	if {[auto_execok "./pan"] == ""} {
		return
	}

	$vo insert end $VC\n; update
	set fd -1

	set pid [eval exec $VC >& run.tmp &]
	$vo insert end "Pid: $pid\n"
	$vo yview end

	catch {set fd [open "run.tmp" r]} errmsg
	if {$fd == -1} {
		$vo insert end "error: $errmsg\n"
		$vo yview end
		return
	}
	set stop 0
	set pname "--"
	if {$d == 1} {
		$vo delete 0.0 end
		$vo insert end "proc\tfrom\ttrans\tto\tsrc\tstmnt\n"
		$vo insert end "name\tstate\tid\tstate\n"
	}
	set no_errors 0
	set seen_ln 0
	while {$stop == 0} {
		if {[gets $fd line] == -1} {
			after 10
			$vo yview end
			update
			if {$seen_ln == 0} {
				# courtesy martin vuille
				after 10
				catch { close $fd }
				set fd [open "run.tmp" r]
			}
			continue
		}
		set seen_ln 1
		if {[string first "No tty allocated" $line] >= 0} {
			continue
		}
		if {[string first "Valid Options are:" $line] >= 0} {
			while {[gets $fd line] != -1} {
				$vo insert end "$line\n"
				update
			}
			set stop 2
		}

		if {[string first "pan: elapsed" $line] >= 0} {
			set stop 2
		}

		if {$d == 0} {
			$vo insert end "$line\n"
			$vo yview end
			update
			if {[string first "State-vector " $line] >= 0} {
				if {[string first "errors: 0" $line] >= 0} {
					set no_errors 1
			}	}
			continue
		}
		if {[string first "proctype" $line] == 0} {
			set pname [string range $line 9 end]
			$vo insert end "\n"
			$vo yview end
			continue
		}
		if {[string first "Transition" $line] >= 0 \
		||  [string first "Source-State" $line] >= 0 \
		||  [string first "Note:" $line] >= 0 \
		||  [string first "pan:" $line] >= 0} {
			continue
		}
		# format:
		# state  15 -(tr  18)-> state  31  [id  14 tp   5] [----L] leader:36 => out!first,number

		regexp {[A-Za-z0-9_\.]+:[0-9]+} $line matched	;# file:line

		set pre [string first "\[" $line]
		set frst [string range $line 0 $pre]
		set lst  [string range $line $pre end]
		set arr  [string first " => " $lst]; incr arr 4
		set stmnt [string range $lst $arr end]
		if {[scan $line "\tstate %d -(tr %d)-> state %d \[id %d tp %d\]" \
			f1 f2 f3 f4 f5] == 5} {
			$vo insert end "$pname\t$f1\t\[$f2\]\t$f3\t$matched\t$stmnt\n"
		} else {
			$vo insert end "$line\n"
	}	}

	if {$stop == 1} {
		catch "eval exec $KILL $pid"
		$vo insert end "stopped\n"
		while {[gets $fd line] != -1} {
			$vo insert end "$line\n"
			$vo yview end
			update
	}	}
	catch " close $fd " errmsg
	if {$errmsg != "" && [string first "No tty allocated" $errmsg] < 0} {
		$vo insert end "$errmsg\n"
	}
	$vo yview end

	if {$no_errors == 0} {
		$vo insert end "To replay the error-trail, goto Simulate/Replay and select \"Run\"\n"
	} else {
		$vo insert end "No errors found -- did you verify all claims?\n"
	}

	bind_lines $vo $vr

	update
}

proc log { n } {
	set m 1
	set cnt 0
	while {$m<$n} {
		set m [expr $m*2]
		incr cnt
	}
	return $cnt
}

proc run_tbl { t } {
	global Fname CC

	if {$Fname == ""} { return }

	mk_pan $t "spin -a [$t.top.right.row5.ent get] $Fname" "$CC -w -o pan pan.c"
	run_pan $t "./pan -d" 1
	cleanup
}

proc has_label {s dargs} {
	global vr SPIN Fname

	set ST "$SPIN -d $dargs $Fname"
	set result 0

	catch {set fd [open "|$ST" r]} errmsg
	if {$fd == -1} {
		$vr insert end "$errmsg\n"
		$vr yview end
		update
	} else {
		while {[gets $fd line] > -1} {
			if {[string first "label	$s" $line] >= 0} {
				set result 1
				break
		}	}
		catch " close $fd "
	}
	return $result
}

proc check_sanity {gargs} {
	global p_mode vo

	if {[has_label "accept" $gargs] == 1} {
		if {$p_mode != 2} {
			$vo insert end "warning: model has accept states\n"
		}
	} else {
		if {$p_mode == 2} {
			$vo insert end "error: model has no accept states\n"
			return 0
	}	}
	if {[has_label "progress" $gargs] == 1} {
		if {$p_mode != 1} {
			$vo insert end "warning: model has progress states\n"
		}
	} else {
		if {$p_mode == 1} {
			$vo insert end "error: model has no progress states\n"
			return 0
	}	}
	$vo yview end

	return 1
}

proc run_ver { t } {
	global Fname q_mode f_mode bc_mode it_mode sv_mode
	global bet ival expl estop s_mode po_mode bf_mode e_mode
	global ma_mode cc_mode p_mode c_mode u_mode a_mode x_mode
	global nvr_pan sym_pan SPIN CC vo peg vranges LTL_Panel
	global V_Panel_1 V_Panel_3

	set nc_nm ""
	set match_start ""

	set gargs "-a"
		if {$q_mode}   { set gargs "$gargs -m" }
		if {$peg == 1} { set gargs "$gargs -o3" }

		if {$c_mode == 2} {
			catch { exec $SPIN -e $Fname > "never_claim.tmp" } errmsg
			if {$errmsg != ""} {
				$vo insert end $errmsg\n
				$vo yview end
				return
			}
			set nc_nm "Product"
			set gargs "$gargs -N never_claim.tmp"
			if {[check_sanity $gargs] == 0} {
				$vo yview end
				return
		}	}

		if {$c_mode == 1} {
			if {$LTL_Panel} {
				if [catch { set fd [open "never_claim.tmp" w] } errmsg] {
					$vo insert end $errmsg\n
					$vo yview end
					return
				}
				puts $fd [$sym_pan get 0.0 end]
				puts $fd [$nvr_pan get 0.0 end]
	
				regexp {never .*\{} [$nvr_pan get 0.0 end] match_start
				if {$match_start == ""} {
					$vo insert end "error: cannot find never claim\n"
					$vo yview end
					return
				}
				set match_end [string first " \{" $match_start]
				if {$match_end > 0} {
					incr match_end -1
				}
				set nc_nm [string range $match_start 6 $match_end]
				# $vo insert end "\nusing claim: \'$nc_nm\'\n\n"
				# $vo yview end
	
				catch "close $fd"
				set gargs "$gargs -N never_claim.tmp"
				if {[check_sanity $gargs] == 0} {
					$vo yview end
					return
				}
				$vo insert end "wrote never_claim.tmp\n"
			} else {
				set nc_nm [$t.top.fourth.rowA.nr get]
			}
		}

	$vo yview end
	update

	if {$V_Panel_3} {
		set cargs "-DMEMLIM=[$t.top.right.row0.ent get] [$t.top.right.row6.ent get]"
	} else {
		set cargs "-DMEMLIM=$ival(0) $ival(6)"
	}
		if {$s_mode == 1}  { set cargs "$cargs -DBITSTATE" }
		if {$s_mode == 2}  { set cargs "$cargs -DHC4" }

		if {$V_Panel_3} {
		if {$ma_mode == 1} { set cargs "$cargs -DMA=[$t.top.right.row4.ent get]" }
		if {$ma_mode == 1} { set cargs "$cargs -DMA=$ival(4)" }
		} else {
		}
		if {$bf_mode == 1} { set cargs "$cargs -DBFS" }
		if {$x_mode == 0}  { set cargs "$cargs -DXUSAFE" }
		if {$p_mode == 0}  { set cargs "$cargs -DSAFETY" }
		if {$p_mode == 1}  { set cargs "$cargs -DNP" }
		if {$c_mode == 0}  { set cargs "$cargs -DNOCLAIM" }
		if {$cc_mode == 1} { set cargs "$cargs -DCOLLAPSE" }
		if {$bc_mode == 1} { set cargs "$cargs -DBCS" }
		if {$it_mode == 1} { set cargs "$cargs -DREACH" }
		if {$po_mode == 0} { set cargs "$cargs -DNOREDUCE" }
		if {$peg == 1}     { set cargs "$cargs -DPEG" }
		if {$vranges == 1} { set cargs "$cargs -DVAR_RANGES" }

		if {$V_Panel_3} {
			set vargs "-m[$t.top.right.row2.ent get] [$t.top.right.row7.ent get]"
			if {$s_mode == 1} { set vargs "$vargs -k[$t.top.right.row3.ent get]" }
		} else {
			set vargs "-m$ival(2) $ival(7)"
			if {$s_mode == 1} { set vargs "$vargs -k$ival(3)" }
		}
		if {$e_mode == 0} { set vargs "$vargs -E" }
		if {$a_mode == 0} { set vargs "$vargs -A" }
		if {$p_mode == 1} { set vargs "$vargs -l" }
		if {$p_mode == 2} { set vargs "$vargs -a" }
		if {$f_mode == 1} { set vargs "$vargs -f" }
		if {$u_mode == 0} { set vargs "$vargs -n" }
		if {$it_mode == 1} { set vargs "$vargs -i" }
		if {$estop == 1}  { set vargs "$vargs -c0" }

		if {$V_Panel_1} {
		if {$estop == 0}  { set vargs "$vargs -c[$t.top.middle.row1.nr get]" }
		}

		if {$sv_mode == 1} { set vargs "$vargs -e" }
		if {$s_mode == 1} {
			if {$V_Panel_3} {
				set vargs "$vargs -w[expr 10+[log [$t.top.right.row1.ent get]]]"
			} else {
				set vargs "$vargs -w[expr 10+[log $ival(1)]]"
		}	}
		if {$bc_mode == 1} {
			set vargs "$vargs -L[$t.top.third.rowB.ent get]"
		}
		if {$nc_nm != ""} { set vargs "$vargs -N $nc_nm" }

	if {$V_Panel_3} {
		set GC "$SPIN $gargs [$t.top.right.row5.ent get] $Fname"
	} else {
		set GC "$SPIN $gargs $ival(5) $Fname"
	}
	set CL "$CC $cargs -w -o pan pan.c"
	set VC "./pan $vargs"

	$vo yview end
	update

	mk_pan $t $GC $CL
	run_pan $t $VC 0
	cleanup
}

proc stop_ver { t } {
	global stop
	set stop 1
}

proc useful_info { sr cmd } {

	catch { set fd [open "|$cmd" r] } errmsg
	if {$fd == -1} {
		$sr insert end "error: $errmsg"
		return
	}
	while {[gets $fd line] > -1} {
		$sr insert end "$line\n"
		$sr yview end
		update
	}
	catch "close $fd" errmsg
	$sr insert end "$errmsg\n"
	$sr yview end
	update
}

proc swarm_gen { t } {
	global so sr Fname SWARM 

	if {[auto_execok $SWARM] == ""} {
		add_log "no swarm command is installed on this system" 0
		add_log "it is available from: http://spinroot.com/swarm/" 0
		tk_messageBox -icon info -message "No executable $SWARM found..."
		return
	}

	if [catch {set fd [open "swarm_cfg.tmp" w]} errmsg] {
		$so insert end "error: cannot write swarm_cfg.tmp\n"
		return
	}

	puts $fd "## Swarm Version 3.0 -- 16 August 2010"
	puts $fd "#"
	puts $fd "# range"
	puts $fd "k	[$t.top.left.row0.e0 get]	[$t.top.left.row1.e0 get]\n"

	puts $fd "# limits"
	puts $fd "d	[$t.top.left.row3.e0 get]"	;# later also add min: [$t.top.left.row2.e0 get]
	puts $fd "cpus	[$t.top.left.row4.e0 get]	[$t.top.left.row5.e0 get]"

	puts $fd "memory	[$t.top.left.row6.e0 get]"
	puts $fd "time	[$t.top.left.row7.e0 get]"
	puts $fd "hash	[$t.top.middle.row8.e1 get]"
	puts $fd "vector	[$t.top.middle.row9.e1 get]"
	puts $fd "speed	[$t.top.middle.row10.e1 get]"
	puts $fd "file	$Fname\n"

	puts $fd "# compilation options"
	puts $fd "[$t.top.right.row0 get 0.0 end]"
	puts $fd "# runtime options (one line only)"
	puts $fd "[$t.top.middle.row12.e1 get]\n"
	puts $fd "# spin options other than -a (one line only)"
	puts $fd "[$t.top.middle.row11.e1 get]\n"
	catch "close $fd" errmsg

	$so insert end "generated configuration file\n"

	catch { set fd [open "|$SWARM swarm_cfg.tmp" r] } errmsg
	if {$fd == -1} {
		$so insert end "error: $errmsg"
		return
	}
	while {[gets $fd line] > -1} {
		$so insert end "$line\n"
		$so yview end
		update
	}
	catch "close $fd" errmsg
	$so insert end "done:: $errmsg \n"
	$so yview end
	update

	$so insert end "----Running----\n"
	$so yview end
	update

	set nxn [string first "." $Fname]
	if {$nxn > 0} {
		incr nxn -1
		set sFname [string range $Fname 0 $nxn]
	} else {
		set sFname $Fname
	}
## untested:
	if {[string first "C:" $sFname] >= 0 || [string first "/" $sFname] == 0} {
		catch { set fd [open "|sh $sFname*.swarm" r] } errmsg
	} else {
		catch { set fd [open "|sh ./$sFname*.swarm" r] } errmsg
	}
	if {$fd == -1} {
		$so insert end "error: $errmsg"
		return
	}
	while {[gets $fd line] > -1} {
		$so insert end "$line\n"
		$so yview end
		update
	}
	catch "close $fd" errmsg
	$so insert end "run completed\n$errmsg\n"
	$so yview end
	update

	useful_info $sr "grep -e errors: script*.out"
	useful_info $sr "ls -l *.trail"
}

proc swarm_clean { } {
	global Fname so RM

	cleanup
	catch { eval exec $RM swarm_cfg.tmp $Fname.swarm script* } err
	$so insert end $err\n
	$so yview end
}

proc swarm_panel { t } {
	global swarm_p swarm_i CBG CFG TBG TFG NBG NFG HV0 HV1
	global SWARM so sr ScrollBarSize spanel

	set spanel $t

	frame $t.top -bg $TBG
	pack $t.top -side top -fill both -expand no

	frame $t.top.left -bg $TBG
	frame $t.top.middle -bg $TBG
	frame $t.top.right -bg $TBG
	pack $t.top.left $t.top.middle $t.top.right -side left -fill both -expand no

	set p1 $t.top.left
	label $p1.limits -text "Search Constraints" -relief sunken -bg $TBG -fg $TFG
	pack $p1.limits -side top -fill x -expand no
	
	for {set i 0} {$i < 8} {incr i} {
		frame $p1.row$i -bg $TBG
			label $p1.row$i.k0 -text "$swarm_p($i)" -bg $TBG -fg $TFG
			entry $p1.row$i.e0 -relief sunken
			$p1.row$i.e0 insert end "$swarm_i($i)"

		pack $p1.row$i.k0 -side left -fill x -expand no
		pack $p1.row$i.e0 -side right -fill x -expand no
		pack $p1.row$i -side top -fill x -expand no
	}

	set p2 $t.top.middle
	label $p2.limits -text "Estimates (Fine Tuning)" -relief sunken -bg $TBG -fg $TFG
	pack $p2.limits -side top -fill x -expand no

	for {set i 8} {$i < 11} {incr i} {
		frame $p2.row$i -bg $TBG
			label $p2.row$i.k1 -text "$swarm_p($i)" -bg $TBG -fg $TFG
			entry $p2.row$i.e1 -relief sunken
			$p2.row$i.e1 insert end "$swarm_i($i)"
		pack $p2.row$i.k1 -side left -fill x -expand no
		pack $p2.row$i.e1 -side right -fill x -expand no
		pack $p2.row$i -side top -fill x -expand no
	}

	label $p2.other -text "Model Generation" -relief sunken -bg $TBG -fg $TFG
	pack $p2.other -side top -fill x -expand no
	frame $p2.row11 -bg $TBG
		label $p2.row11.k1 -text "extra spin args" -bg $TBG -fg $TFG
		entry $p2.row11.e1 -relief sunken
		pack $p2.row11.k1 -side left -fill x -expand no
		pack $p2.row11.e1 -side right -fill x -expand no
		pack $p2.row11 -side top -fill x -expand no
	frame $p2.row12 -bg $TBG
		label $p2.row12.k1 -text "extra pan args" -bg $TBG -fg $TFG
		entry $p2.row12.e1 -relief sunken
		$p2.row12.e1 insert end "-c1 -x -n"
		pack $p2.row12.k1 -side left -fill x -expand no
		pack $p2.row12.e1 -side right -fill x -expand no
		pack $p2.row12 -side top -fill x -expand no

	frame $p2.buttons -bg $TBG
	button $p2.buttons.run -text "Run" -command "swarm_gen $t" \
		-bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG

	button $p2.buttons.cln -text "Cleanup tmp files" -command "swarm_clean" \
		-bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG

	pack $p2.buttons.cln -side right -fill x -expand no
	pack $p2.buttons.run -side right -fill x -expand no
	pack $p2.buttons -side bottom -fill x -expand no


	set p3 $t.top.right
	label $p3.limits -text "Compilation Options (any number, one per line)" \
		-relief sunken -bg $TBG -fg $TFG
		text $p3.row0 -height 12 -relief sunken

	$p3.row0 insert end "-DBITSTATE -DPUTPID             # basic dfs\n"
	$p3.row0 insert end "-DBITSTATE -DPUTPID -DREVERSE   # reversed transition ordering\n"
	$p3.row0 insert end "-DBITSTATE -DPUTPID -DT_REVERSE # reversed process ordering\n"
	$p3.row0 insert end "-DBITSTATE -DPUTPID -DREVERSE -DT_REVERSE       # both\n"
	$p3.row0 insert end "-DBITSTATE -DPUTPID -DP_RAND -DT_RAND   # same series with randomization\n"
	$p3.row0 insert end "-DBITSTATE -DPUTPID -DP_RAND -DT_RAND -DT_REVERSE\n"
	$p3.row0 insert end "-DBITSTATE -DPUTPID -DP_RAND -DT_RAND -DREVERSE\n"
	$p3.row0 insert end "-DBITSTATE -DPUTPID -DP_RAND -DT_RAND -DREVERSE -DT_REVERSE\n"

	pack $p3.limits $p3.row0 -side top -fill x -expand no

#	frame $p3.row2
#		label $p3.row2.k1 -text "runtime options" -bg $TBG -fg $TFG
#		entry $p3.row2.e1 -relief sunken -bg $TBG -fg $TFG
#		$p3.row2.e1 insert end "-c1 -x -n"
#		pack $p3.row2.k1 $p3.row2.e1 -side top -fill x -expand no
#	pack $p3.row2 -side top -fill x -expand no

	set vw  [PanedWindow $t.bottom -side left -activator button ]

	set p8  [$vw add -minsize 100]
	set p9  [$vw add -minsize 100]

        set s11  [ScrolledWindow $p8.so -size $ScrollBarSize]	;# so - swarm output
        set so   [text $s11.lb -height 5 -highlightthickness 3 -font $HV1]
        $s11 setwidget $so

        set s22  [ScrolledWindow $p9.sr -size $ScrollBarSize]	;# sr - swarm run
        set sr   [text $s22.lb -highlightthickness 0 -bg $CBG -fg $CFG -font $HV1]
        $s22 setwidget $sr

	$so insert end "swarm setup output\n"
	$sr insert end "swarm run output\n"

	set errmsg ""
	# a bit overkill, but execs compiled with gcc
	# behave differently from those compiled with cl
	# complaints about missing tty, for instance
	# spin on cygwin is compiled with cl, swarm with gcc

	if {[auto_execok $SWARM] == ""} {
			$sr insert end "no 'swarm' command is found\n"
			$sr insert end "available from: http://spinroot.com/swarm/\n"
	} else {
		catch { set fd [open "|$SWARM -V" r] } errmsg
		if {$fd == -1} {
			$sr insert end "$errmsg\n"
		} else {
			while {[gets $fd line] > -1} {
				$sr insert end "$line\n"
			}
			catch " close $fd "
	}	}

	pack $s11 -fill both -expand yes
	pack $s22 -fill both -expand yes
	pack $vw  -fill both -expand yes

}

proc explain0 {} {
	global vo

	$vo insert end "\n"
	$vo insert end "\tPhysical Memory Available:\n"
	$vo insert end "\tSet this number to amount of physical (not virtual) memory\n"
	$vo insert end "\tin your system, in MegaBytes, and leave it there for all runs.\n"
	$vo insert end "\n"
	$vo insert end "\tWhen the limit is reached, the verification is stopped to\n"
	$vo insert end "\tavoid trashing.\n"
	$vo insert end "\n"
	$vo insert end "\tIf an exhaustive verification cannot be completed due to\n"
	$vo insert end "\tlack of memory, select a different storage mode.\n\n"
	$vo yview end
}

proc explain1 {} {
	global vo

	$vo insert end "\tEstimated State Space Size:\n"
	$vo insert end "\tThis parameter is used to calculate the size of the\n"
	$vo insert end "\thash-table. It results in a selection of a numeric argument\n"
	$vo insert end "\tfor the -w flag of the verifier. Setting it too high may\n"
	$vo insert end "\tcause an out-of-memory error with zero states reached\n"
	$vo insert end "\t(meaning that the verification could not be started).\n"
	$vo insert end "\tSetting it too low can cause inefficiencies due to\n"
	$vo insert end "\thash collisions.\n"
	$vo insert end "\t\n"
	$vo insert end "\tWhen using bitstate, start with the default\n"
	$vo insert end "\tsetting.  After a run completes successfully,\n"
	$vo insert end "\tdouble the estimate, and see if the number of reached\n"
	$vo insert end "\tstated changes much.  Continue to do this until\n"
	$vo insert end "\tit stops changing, or until you reach the memory bound.\n"
	$vo insert end "\t\n"
	$vo insert end "\tiSpin uses the closest power of two to determine the parameter\n"
	$vo insert end "\tgiven to the -w flag that is used for the run.\n\n"
	$vo yview end
}

proc explain2 {} {
	global vo
	$vo insert end "\tMaximum Search Depth:\n"
	$vo insert end "\tThis number determines the size of the depth-first\n"
	$vo insert end "\tsearch stack that is used during the verification.\n"
	$vo insert end "\tA larger number increases the memory requirements, and\n"
	$vo insert end "\ta lower number decreases it.  When there seems not to be\n"
	$vo insert end "\tsufficient memory for the search depth needed, reduce\n"
	$vo insert end "\treduce the estimated state space size to free some\n"
	$vo insert end "\tmore memory for the stack, or change the storage mode.\n"
	$vo insert end "\t\n"
	$vo insert end "\tIf you hit the maximum search depth during a verification\n"
	$vo insert end "\t(noted as 'Search not completed' or 'Search Truncated'\n"
	$vo insert end "\tin the verification output) without finding an error,\n"
	$vo insert end "\tincrease the search depth parameter and repeat the run.\n\n"
	$vo yview end
}

proc explain3 {} {
	global vo

	$vo insert end "\tNumber of hash functions:\n"
	$vo insert end "\tThis number determines how many bits are set per\n"
	$vo insert end "\tstate when in Bitstate verification mode. The default is 3,\n"
	$vo insert end "\tbut you can use any number greater to or equal to 1.\n"
	$vo insert end "\tAt the end of a Bitstate verification run, the verifier\n"
	$vo insert end "\tcan issue a recommendation for a different setting of\n"
	$vo insert end "\tthis parameter (specified with the -k flag), if this can\n"
	$vo insert end "\timprove coverage.\n\n"
	$vo yview end
}

proc explain4 {} {
	global vo

	$vo insert end "\tSize for Minimized Automata:\n"
	$vo insert end "\tWhen using the minimized automata storage mode, you should\n"
	$vo insert end "\tset this parameter to be equal to the statevector size at first.\n"
	$vo insert end "\tAt the end of the run, the verifier will then report if a smaller\n"
	$vo insert end "\tnumber can also be used. The smaller the number the faster the run.\n\n"
	$vo yview end
}

proc explain5 {} {
	global vo

	$vo insert end "\tExtra Verifier Generator Options:\n"
	$vo insert end "\tPossible options include:\n"
	$vo insert end "\t-o1	to disable dataflow optimizations\n"
	$vo insert end "\t-o2	to disable dead-variable elimination\n"
	$vo insert end "\t-o3	to disable statement merging (which improves source-line references)\n\n"
	$vo yview end
}

proc explain6 {} {
	global vo

	$vo insert end "\tExtra Compile-time Directives:\n"
	$vo insert end "\tFor possible options see:\n"
	$vo insert end "\thttp://spinroot.com/spin/Man/Pan.html#B\n\n"
	$vo yview end
}

proc explain7 {} {
	global vo

	$vo insert end "\tExtra Run-time Options:\n"
	$vo insert end "\tPossible options include:\n"
	$vo insert end "\t-hN	use a different hash-function (N: 1..32, default 1)\n"
	$vo insert end "\t-J	reverse evaluation order on nested unless structures\n"
	$vo insert end "\t-q	require channels to be empty in valid endstates\n"
	$vo insert end "\t-QN	try to stop the run after N minutes\n"
	$vo insert end "\t-tSuf	use Suf as a suffix on trail files instead of .trail\n"
	$vo insert end "\t-T	create trail files in read-only mode\n"
	$vo insert end "\t-x	do not overwrite an existing trail file\n\n"
	$vo yview end
}

proc ver_help {} {
	global vo

	$vo insert end "\tHelp with Verification Complexity:\n"
	$vo insert end "\t---------------------------------------\n"
	$vo insert end "\tWhen a verification cannot be completed because it\n"
	$vo insert end "\truns out of memory or you run out of time, there are\n"
	$vo insert end "\tsome useful strategies that can be tried to restore tractability.\n"
	$vo insert end "\n"
	$vo insert end "\t0. Run the Redundancy Check (in the Edit/View tab) to see if you can\n"
	$vo insert end "\tsimplify the model and still prove the same properties.\n"
	$vo insert end "\n"
	$vo insert end "\t1. Try to make the model more general.\n"
	$vo insert end "\tRemember that you are constructing a verification model and not\n"
	$vo insert end "\tan implementation.  The model checker is good at proving properties\n"
	$vo insert end "\tof *interactions* in a distributed system (the implicit assumptions\n"
	$vo insert end "\tthat processes make about each other) -- it is generally not strong\n"
	$vo insert end "\tin proving things about *computations*, data dependencies etc.\n"
	$vo insert end "\n"
	$vo insert end "\t2. Remove everything that is not directly related to the property\n"
	$vo insert end "\tyou are trying to prove: redundant computations, redundant data. \n"
	$vo insert end "\t*Avoid counters*; avoid incrementing variables that are used for\n"
	$vo insert end "\tonly book-keeping purposes.\n"
	$vo insert end "\tThe Syntax Check option (Edit/View tab) warns about the gravest offenses.\n"
	$vo insert end "\n"
	$vo insert end "\t3. Asynchronous channels can be a significant source of complexity in\n"
	$vo insert end "\tverification.  Use *synchronous channels* where possible.  Reduce the\n"
	$vo insert end "\tnumber of slots in asynchronous channels to a minimum (use 2, or 3\n"
	$vo insert end "\tslots to get started).\n"
	$vo insert end "\n"
	$vo insert end "\t4. Look for processes that merely transfer messages. Consider if\n"
	$vo insert end "\tyou can remove processes that only copy incoming messages from\n"
	$vo insert end "\tone channel into another, by letting the sender generate the\n"
	$vo insert end "\tfinal message right away.  If the intermediate process makes\n"
	$vo insert end "\tchoices (e.g., to delete or duplicate, etc.), let the sender\n"
	$vo insert end "\tmake that choice, rather than an intermediate process.\n"
	$vo insert end "\n"
	$vo insert end "\t5. Combine local computations into atomic, or d_step, sequences.\n"
	$vo insert end "\n"
	$vo insert end "\t6. Avoid leaving scratch data around in variables.  You can often reduce\n"
	$vo insert end "\tthe number of states by, for instance, resetting local variables\n"
	$vo insert end "\tthat are used inside atomic sequences to zero at the end of those\n"
	$vo insert end "\tsequences; so that the scratch values aren't visible outside the\n"
	$vo insert end "\tsequence.  Consider using the predefined variable \"_\" as a write-only\n"
	$vo insert end "\tscratch variable where possible.\n"
	$vo insert end "\n"
	$vo insert end "\t7. Try to combine the behavior of two processes into one.\n"
	$vo insert end "\tGeneralize behavior. Focus on coordination aspects\n"
	$vo insert end "\t(i.e., the interfaces between processes, rather than the local\n"
	$vo insert end "\tcomputations inside processes).\n"
	$vo insert end "\n"
	$vo insert end "\t8. Try to exploit the partial order reduction strategies.\n"
	$vo insert end "\tUse the xr and xs assertions where possible (see the online manpages\n"
	$vo insert end "\tat spinroot.com; avoid sharing channels between multiple receivers or\n"
	$vo insert end "\tmultiple senders.\n"
	$vo insert end "\tAvoid merging independent data-streams into a single shared channel.\n"
	$vo yview end
}

proc del_v_panel {n} {
	global vpanel

	if {$n == 1} {
		catch { destroy $vpanel.top.middle }
	}
	if {$n == 2} {
		catch { destroy $vpanel.top.third }
	}
	if {$n == 3} {
		catch { destroy $vpanel.top.right }
	}
}

proc toggle_a {n} {
	global V_Panel_1 V_Panel_3 vpanel LIB NBG HV0 NFG

	if {$n == 1} {
		if {$V_Panel_1} {
			set V_Panel_1 0
			set p6 $vpanel.top.middle
			catch {
				destroy $p6.er
				destroy $p6.lb
				destroy $p6.row0
				destroy $p6.row1
				destroy $p6.row2
				destroy $p6.row4
				destroy $p6.row5
				destroy $p6.row7
				destroy $p6.row8
				destroy $p6.rowA
				destroy $p6.row66
			}

			frame $p6.row66 -bg $LIB
				button $p6.row66.a1 -text "Show\nError\nTrapping\nOptions" \
					-command "toggle_a 1" \
					-fg white -bg black -activeforeground $NBG \
					-activebackground $NFG -font $HV0
				pack $p6.row66.a1 -side left -fill x -expand yes
			pack $p6.row66 -side top -fill x -expand yes
		} else {
			set V_Panel_1 1
			$vpanel.top.middle.row66.a1 configure -text "Remove"
			advanced_1
	}	}

	if {$n == 3} {
		if {$V_Panel_3} {
			set V_Panel_3 0
			set p6 $vpanel.top.right
			catch {
				destroy $p6.t
				for {set i 0} {$i <= 7} {incr i} {
					destroy $p6.row$i
				}
				destroy $p6.row66
			}

			frame $p6.row66 -bg $LIB
				button $p6.row66.a3 -text "Show\nAdvanced\nParameter\nSettings" \
					-command "toggle_a 3" \
					-fg white -bg black -activeforeground $NBG \
					-activebackground $NFG -font $HV0
				pack $p6.row66.a3 -side left -fill x -expand yes
			pack $p6.row66 -side top -fill x -expand yes
		} else {
			set V_Panel_3 1
			$vpanel.top.right.row66.a3 configure -text "Remove"
			advanced_3
	}	}
	
}

set peg 0
set vranges 0
set sv_mode 0
set estop 0
set q_mode 0

proc advanced_1 {} {
	global LIB TFG NFG NBG HV0 vpanel V_Panel_1
	global peg sv_mode estop vranges q_mode

	set t $vpanel

	set p6 $t.top.middle
	label $p6.er -text "Advanced: Error Trapping" -relief raised -bg $LIB
	frame $p6.row0 -bg $LIB
		radiobutton $p6.row0.ds -variable estop -value 1 -text "don't stop at errors" -bg $LIB -fg $TFG
	pack $p6.row0.ds -side left -fill x -expand no

	frame $p6.row1 -bg $LIB
		radiobutton $p6.row1.st -variable estop -value 0 -text "stop at error nr:" -bg $LIB -fg $TFG
		entry $p6.row1.nr
		$p6.row1.nr insert end "1"
	pack $p6.row1.st -side left -fill x -expand no
	pack $p6.row1.nr -side right -fill x -expand yes

	frame $p6.row2 -bg $LIB
		checkbutton $p6.row2.se -variable sv_mode -text "save all error-trails" -bg $LIB -fg $TFG
		pack $p6.row2.se -side left -fill x -expand no
	frame $p6.row4 -bg $LIB
		checkbutton $p6.row4.ac -variable peg -text "add complexity profiling" -bg $LIB -fg $TFG
		pack $p6.row4.ac -side left -fill x -expand no
	frame $p6.row5 -bg $LIB
		checkbutton $p6.row5.vr -variable vranges -text "compute variable ranges" -bg $LIB -fg $TFG
		pack $p6.row5.vr -side left -fill x -expand no

	pack	$p6.er $p6.row0 $p6.row1 $p6.row2 $p6.row4 $p6.row5 \
		-side top -fill x -expand yes

	label $p6.lb -text "A Full Channel" -relief raised -bg $LIB -fg $TFG
	frame $p6.row7 -bg $LIB
		radiobutton $p6.row7.b -variable q_mode -value 0 -text "blocks new msgs" -bg $LIB -fg $TFG
		pack $p6.row7.b -side left -fill x -expand no
	frame $p6.row8 -bg $LIB
		radiobutton $p6.row8.l -variable q_mode -value 1 -text "loses new msgs" -bg $LIB -fg $TFG
		pack $p6.row8.l -side left -fill x -expand no

	frame $p6.rowA -bg $LIB
	button $p6.rowA.tb -text "State Tables" \
		-command " run_tbl $t " \
		-fg white -bg grey -activeforeground $NBG -activebackground $NFG -font $HV0
	button $p6.rowA.clr -text "Clear" -command " do_clear " \
		-fg white -bg grey -activeforeground $NBG -activebackground $NFG -font $HV0
	button $p6.rowA.hlp -text "Help" -command " ver_help " \
		-fg white -bg grey -activeforeground $NBG -activebackground $NFG -font $HV0
	pack $p6.rowA.tb $p6.rowA.clr $p6.rowA.hlp -side left -fill x -expand yes

	pack $p6.lb $p6.row7 $p6.row8 $p6.rowA -side top -fill x -expand no
}

proc advanced_2 {} {
	global TFG NFG NBG HV0 vpanel TBG
	global po_mode bf_mode bc_mode it_mode u_mode

	set LIB $TBG	;# overrides global
	set t $vpanel

	set p5 $t.top.third
	label $p5.sm -text "Search Mode" -relief raised -bg $LIB -fg $TFG

	frame $p5.row5 -bg $LIB
		label $p5.row5.sp -width 1 -bg $LIB -fg $TFG
		checkbutton $p5.row5.po -variable po_mode -text "+ partial order reduction" -bg $LIB -fg $TFG
		pack $p5.row5.sp $p5.row5.po -side left -fill x -expand no
	frame $p5.row6 -bg $LIB
		radiobutton $p5.row6.dfs -variable bf_mode -value 0 -text "depth-first search" -bg $LIB -fg $TFG
		pack $p5.row6.dfs -side left -fill x -expand no

	frame $p5.row60 -bg $LIB
		label $p5.row60.sp -width 1 -bg $LIB -fg $TFG
		checkbutton $p5.row60.fs -variable bc_mode -text "+ bounded context switching" -bg $LIB -fg $TFG
		pack $p5.row60.sp $p5.row60.fs -side left -fill x -expand no

	frame $p5.rowB -bg $LIB
		label $p5.rowB.sp -width 6 -bg $LIB -fg $TFG
		label $p5.rowB.nm -text "with bound:" -bg $LIB -fg $TFG
		entry $p5.rowB.ent -relief sunken -width 8
		$p5.rowB.ent insert end "0"
		pack $p5.rowB.sp $p5.rowB.nm -side left -fill x -expand no
		pack $p5.rowB.ent -side left -fill x -expand yes

	frame $p5.row61 -bg $LIB
		label $p5.row61.sp -width 1 -bg $LIB -fg $TFG
		checkbutton $p5.row61.fs -variable it_mode -text "+ iterative search for short trail" -bg $LIB -fg $TFG
		pack $p5.row61.sp $p5.row61.fs -side left -fill x -expand no
	frame $p5.row62 -bg $LIB
		label $p5.row62.sp -width 1 -bg $LIB -fg $TFG
		checkbutton $p5.row62.po -variable po_mode -text "+ partial order reduction" -bg $LIB -fg $TFG
		pack $p5.row62.sp $p5.row62.po -side left -fill x -expand no

	frame $p5.row7 -bg $LIB
		radiobutton $p5.row7.bfs -variable bf_mode -value 1 -text "breadth-first search" -bg $LIB -fg $TFG
		pack $p5.row7.bfs -side left -fill x -expand no
	frame $p5.row8 -bg $LIB
		checkbutton $p5.row8.ur -variable u_mode -text "report unreachable code" -bg $LIB -fg $TFG
		pack $p5.row8.ur -side left -fill x -expand no

	frame $p5.row9 -bg $LIB
		entry  $p5.row9.en -relief sunken -width 12
		button $p5.row9.lb -text "Save Result in:" \
			-command " save_in $p5.row9.en" \
			-bg grey -fg white \
			-activeforeground $NBG -activebackground $NFG -font $HV0
		$p5.row9.en insert end "pan.out"
		pack $p5.row9.lb $p5.row9.en -side left -fill y -expand yes

	pack	$p5.sm $p5.row6 $p5.row62 $p5.row60 $p5.rowB $p5.row61 $p5.row7 $p5.row5 $p5.row8 $p5.row9 \
		-side top -fill x -expand no
}

proc advanced_3 {} {
	global bet ival expl LIB TFG NFG NBG HV0 vpanel V_Panel_3

	set t $vpanel

	set p7 $t.top.right
	label $p7.t -text "Advanced: Parameters" -relief raised -bg $LIB -fg $TFG
	pack $p7.t -side top -fill x -expand no

	for {set i 0} {$i <= 7} {incr i} {
		frame $p7.row$i -bg $LIB
		label  $p7.row$i.lbl -text $bet($i) -bg $LIB -fg $TFG
		entry  $p7.row$i.ent -width 20
			$p7.row$i.ent insert end $ival($i)
		button $p7.row$i.exp -text $expl($i) -command " explain$i " -bg $LIB -fg $TFG
		pack $p7.row$i.lbl -side left -fill x -expand no
		pack $p7.row$i.exp -side right -fill x -expand no
		pack $p7.row$i.ent -side right -fill x -expand no
		pack $p7.row$i -side top -fill x -expand no
	}
}

proc verify_panel {t} {
	global bet ival expl estop s_mode po_mode bf_mode e_mode HV0 HV1 CBG CFG TBG TFG NBG NFG it_mode
	global ma_mode cc_mode p_mode c_mode u_mode a_mode x_mode q_mode f_mode bc_mode
	global sv_mode vo vr Fname ScrollBarSize peg vranges vpanel
	global LTL_Panel V_Panel_1 V_Panel_3 LIB

	set vpanel $t

	set LIB lightgray	;# background for less important options -- was TBG

	frame $t.top -bg $LIB
	pack $t.top -side top -fill both -expand no

	frame $t.top.left -bg $TBG
	frame $t.top.fourth -bg $TBG
	frame $t.top.middle -bg $LIB
	frame $t.top.third -bg $LIB
	frame $t.top.right -bg $LIB
	pack $t.top.left $t.top.fourth -side left -fill both -expand yes
	pack $t.top.third  -side left -fill both -expand yes
	pack $t.top.middle -side left -fill x -expand yes
	pack $t.top.right  -side left -fill x -expand yes

	set p1 $t.top.left
	label $p1.saf -text "Safety" -relief raised -bg $TBG -fg $TFG
	label $p1.liv -text "Liveness" -relief raised -bg $TBG -fg $TFG

	frame $p1.row0 -bg $TBG
		radiobutton $p1.row0.sf -variable p_mode -value 0 -text "safety" -bg $TBG -fg $TFG
		pack $p1.row0.sf -side left -fill x -expand no
	frame $p1.row1 -bg $TBG
		label $p1.row1.sp -width 1 -bg $TBG -fg $TFG
		checkbutton $p1.row1.av -variable a_mode -text "+ assertion violations" -bg $TBG -fg $TFG
		pack $p1.row1.sp $p1.row1.av -side left -fill x -expand no
	frame $p1.row9 -bg $TBG
		label $p1.row9.sp -width 1 -bg $TBG -fg $TFG
		checkbutton $p1.row9.xr -variable x_mode -text "+ xr/xs assertions" -bg $TBG -fg $TFG
		pack $p1.row9.sp $p1.row9.xr -side left -fill x -expand no
	frame $p1.row2 -bg $TBG
		label $p1.row2.sp -width 1 -bg $TBG -fg $TFG
		checkbutton $p1.row2.ie -variable e_mode -text "+ invalid endstates (deadlock)" -bg $TBG -fg $TFG
		pack $p1.row2.sp $p1.row2.ie -side left -fill x -expand no

	pack $p1.saf $p1.row0 $p1.row2 $p1.row1 $p1.row9 -side top -fill x -expand no

	frame $p1.row3 -bg $TBG
		radiobutton $p1.row3.np -variable p_mode -value 1 -text "non-progress cycles" -bg $TBG -fg $TFG
		pack $p1.row3.np -side left -fill x -expand no
	frame $p1.row4 -bg $TBG
		radiobutton $p1.row4.ac -variable p_mode -value 2 -text "acceptance cycles" -bg $TBG -fg $TFG
		pack $p1.row4.ac -side left -fill x -expand no
	frame $p1.row5 -bg $TBG
	#	label $p1.row5.sp -width 1 -bg $TBG -fg $TFG
		checkbutton $p1.row5.wf -variable f_mode -text "enforce weak fairness constraint" -bg $TBG -fg $TFG
		pack $p1.row5.wf -side left -fill x -expand no

	pack $p1.liv $p1.row3 $p1.row4 $p1.row5 -side top -fill x -expand no

	set p10 $t.top.fourth
	label $p10.alg -text "Storage Mode" -relief raised -bg $TBG -fg $TFG

	frame $p10.row0 -bg $TBG
		radiobutton $p10.row0.ex -variable s_mode -value 0 -text "exhaustive" -bg $TBG -fg $TFG
		pack $p10.row0.ex -side left -fill x -expand no
#	frame $p10.row1 -bg $TBG
#		radiobutton $p10.row1.bs -variable s_mode -value 1 -text "bitstate" -bg $TBG -fg $TFG
#		pack $p10.row1.bs -side left -fill x -expand no
	frame $p10.row2 -bg $TBG
		radiobutton $p10.row2.hc -variable s_mode -value 2 -text "hash-compact" -bg $TBG -fg $TFG
		radiobutton $p10.row2.bs -variable s_mode -value 1 -text "bitstate/supertrace" -bg $TBG -fg $TFG
		pack $p10.row2.hc $p10.row2.bs -side left -fill x -expand no
	frame $p10.row3 -bg $TBG
		label $p10.row3.sp -width 1 -bg $TBG -fg $TFG
		checkbutton $p10.row3.ma -variable ma_mode -text "+ minimized automata (slow)" -bg $TBG -fg $TFG
		pack $p10.row3.sp $p10.row3.ma -side left -fill x -expand no
	frame $p10.row4 -bg $TBG
		label $p10.row4.sp -width 1 -bg $TBG -fg $TFG
		checkbutton $p10.row4.cl -variable cc_mode -text "+ collapse compression" -bg $TBG -fg $TFG
		pack $p10.row4.sp $p10.row4.cl -side left -fill x -expand no

	frame $p10.row6 -bg $TBG
	button $p10.row6.go -text "Run" \
		-command " run_ver $t " \
		-fg $NFG -bg $NBG -activeforeground $NBG -activebackground $NFG -font $HV0
	button $p10.row6.no -text "Stop" \
		-command " stop_ver $t " \
		-fg $NFG -bg $NBG -activeforeground $NBG -activebackground $NFG -font $HV0

	pack $p10.row6.no $p10.row6.go -side right -fill x -expand yes


	pack  $p10.alg $p10.row0 $p10.row3 $p10.row4 $p10.row2 \
		-side top -fill x -expand no

	label $p10.nc -text "Never Claims" -relief raised -bg $TBG -fg $TFG

	frame $p10.row9 -bg $TBG
	if {$LTL_Panel} {
		radiobutton $p10.row9.nc -variable c_mode -value 1 -text "use claim from LTL panel:" -bg $TBG -fg $TFG
		pack $p10.row9.nc -side left -fill x -expand no
	} else {
		radiobutton $p10.row9.nc -variable c_mode -value 1 -text "use claim" -bg $TBG -fg $TFG
		pack $p10.row9.nc -side left -fill x -expand no
		frame $p10.rowA -bg $TBG
		label $p10.rowA.lb -text "  claim name (opt):" -bg $TBG -fg $TFG
		entry $p10.rowA.nr
		pack $p10.rowA.lb -side left -fill x -expand no
		pack $p10.rowA.nr -side left -fill x -expand yes
	}

#	frame $p10.row10 -bg $TBG
#		radiobutton $p10.row10.nc -variable c_mode -value 2 \
#			-text "use (only) product of claims in spec" -bg $TBG -fg $TFG
#		pack $p10.row10.nc -side left -fill x -expand no

	frame $p10.row11 -bg $TBG
		radiobutton $p10.row11.nc -variable c_mode -value 0 \
			-text "do not use a never claim or ltl property" -bg $TBG -fg $TFG
		pack $p10.row11.nc -side left -fill x -expand no

	pack  $p10.nc $p10.row11 $p10.row9 \
		-side top -fill x -expand no

	if {$LTL_Panel == 0} {
		pack $p10.rowA -side top -fill x -expand no
	}

	set p6 $t.top.middle
	frame $p6.row66 -bg $LIB
		button $p6.row66.a1 -text "Show\nError\nTrapping\nOptions" \
			-command "toggle_a 1" \
			-fg white -bg black -activeforeground $NBG \
			-activebackground $NFG -font $HV0
		pack $p6.row66.a1 -side left -fill x -expand yes
	pack $p6.row66 -side top -fill x -expand yes

	set p6 $t.top.right
	frame $p6.row66 -bg $LIB
		button $p6.row66.a3 -text "Show\nAdvanced\nParameter\nSettings" \
			-command "toggle_a 3" \
			-fg white -bg black -activeforeground $NBG \
			-activebackground $NFG -font $HV0
		pack $p6.row66.a3 -side left -fill x -expand yes
	pack $p6.row66 -side top -fill x -expand yes

	pack $p10.row6 -side bottom -fill x -expand no

	advanced_2

	if {$V_Panel_1} {
		advanced_1
	}
	if {$V_Panel_3} {
		advanced_3
	}
###
	set vw  [PanedWindow $t.bottom -side top -activator button ]

	set p9  [$vw add -minsize 100]
	set p8  [$vw add -minsize 100]

        set s11  [ScrolledWindow $p8.vo -size $ScrollBarSize]	;# vo - verification output
        set vo   [text $s11.lb -height 6 -width 100 -highlightthickness 3 -bg $CBG -fg $CFG -font $HV1]
        $s11 setwidget $vo

        set s22  [ScrolledWindow $p9.vr -size $ScrollBarSize]	;# vr - verification reference
        set vr   [text $s22.lb -height 35 -highlightthickness 0 -font $HV1]
        $s22 setwidget $vr

        pack $s11 -fill both -expand yes
        pack $s22 -fill both -expand yes
	pack $vw  -fill both -expand yes

	$vo insert end "verification result:\n"
	$vr insert end "model source:\n"
}

proc save_in {v} {
	global vo

	set f [$v get]
	if {$f == ""} {
		return
	}
	add_log "save verification output in $f" 0
	if [ catch {set fd [open $f w]} errmsg ] {
		add_log $errmsg 0
		return
	}
	puts $fd [$vo get 0.0 end]
	catch { close $fd }
}

proc do_clear {} {
	global vo
	$vo delete 0.0 end 
}

proc output_filters {x} {
	global TBG TFG

	set fl $x.filters
	frame $fl -bg $TBG
	pack $fl -padx 1 -pady 1 -side left -fill both -expand no

	label $fl.lbl -text "Output Filtering (reg. exps.)" -relief raised -bg $TBG -fg $TFG
	pack $fl.lbl -side top -fill x -expand no

	add_frame $fl.pids	"process ids:"
	add_frame $fl.qids	"queue ids:"
	add_frame $fl.vars	"var names:"
	add_frame $fl.track	"tracked variable:"
	add_frame $fl.scale	"track scaling:"
}

proc find_trail {e} {
	set ftypes {
		{{Spin Trail File Format} {.trail} }
		{{All Files}	*}
	}
	switch -- [set file [tk_getOpenFile -filetypes $ftypes]] "" return
	catch { $e delete 0.0 end }
	catch { $e insert end $file }
}

proc setup_controls {x} {
	global TBG TFG NBG NFG

	frame $x.run -bg $TBG
	pack $x.run -padx 1 -pady 1 -side left -fill both -expand no

	frame $x.run.ctl -bg $TBG
	button $x.run.ctl.run -width 12 -text "(Re)Run" \
		-command { run_sim } \
		-bg $NBG -fg $NFG -activebackground $NFG -activeforeground $NBG

	button $x.run.ctl.step -width 12 -text "Step Forward" \
		-bg $NBG -fg grey -activebackground $NFG -activeforeground $NBG

	button $x.run.ctl.stop -width 12 -text "Stop" \
		-command { set stop 1 } \
		-bg $NBG -fg $NFG -activebackground $NFG -activeforeground $NBG

	button $x.run.ctl.back -width 12 -text "Step Backward" \
		-bg $NBG -fg grey -activebackground $NFG -activeforeground $NBG

	button $x.run.ctl.reset -width 12 -text "Rewind" \
		-bg $NBG -fg grey -activebackground $NFG -activeforeground $NBG

	pack $x.run.ctl -side left -fill both -expand no
	pack	$x.run.ctl.run \
		$x.run.ctl.stop \
		$x.run.ctl.reset \
		$x.run.ctl.step \
		$x.run.ctl.back \
		-side top -fill y -expand yes
}

proc inspect_ltl {et ns} {

	set x [$et get]

	regsub -all {\&\&} "$x" " " y; set x $y
	regsub -all {\|\|} "$x" " " y; set x $y
	regsub -all {\/\\} "$x" " " y; set x $y
	regsub -all {\\\/} "$x" " " y; set x $y
	regsub -all {\!}  "$x" " " y; set x $y
	regsub -all {<->} "$x" " " y; set x $y
	regsub -all {\->}  "$x" " " y; set x $y
	regsub -all {\[\]} "$x" " " y; set x $y
	regsub -all {\<\>} "$x" " " y; set x $y
	regsub -all {[()]} "$x" " " y; set x $y
	regsub -all {\ \ *} "$x" " " y; set x $y
	regsub -all { U} "$x" " " y; set x $y
	regsub -all { V} "$x" " " y; set x $y
	regsub -all { X} "$x" " " y; set x $y

	set predefs " np_ true false "

	set k [split $x " "]
	set j [llength $k]
	set line [$ns get 0.0 end]
	for {set i 0} {$i < $j} {incr i} {
		if {[string length [lindex $k $i]] > 0 \
		&&  [string first " [lindex $k $i] " $predefs] < 0} {
		  set pattern "#define [lindex $k $i]"
		  if {[string first $pattern $line] < 0} {
			catch {
			$ns insert end "$pattern\t?\n"
			}
			set line [$ns get 0.0 end]
	}	} }
}

set ltl_cnt 0
proc ltl_log {s} {
	global ltl_cnt log_pan

	incr ltl_cnt
	$log_pan insert end "$ltl_cnt $s\n"
	$log_pan yview end
	update
}

proc gen_claim {et nc ns} {
	global negate_ltl

	inspect_ltl $et $ns
	set formula [$et get]

	if {$negate_ltl == "1"} {
		set formula "!($formula)"
	}

	$nc delete 0.0 end

	catch {
		set fd [open "|spin -f \"($formula)\"" r]
		while {[eof $fd] == 0 && [gets $fd line] > -1} {
			$nc insert end $line\n
		}
		catch "close $fd"
	}
}

proc clear_ltl {t} {
	global sym_pan nvr_pan note_pan

	$t.left.frm.tmp delete 0 end
	$t.left.frm.ent delete 0 end
	$sym_pan delete 0.0 end
	$nvr_pan delete 0.0 end
	$note_pan delete 0.0 end

	ltl_log "clear"
}

proc help_ltl {} {
	ltl_log "\tLTL Help"
	ltl_log "\tYou can load an LTL template with a previously saved LTL"
	ltl_log "\tformula from a file via the Browse button on the upper"
	ltl_log "\tright of the LTL Property Manager panel."
	ltl_log ""
	ltl_log "\tDefine a new LTL formula using lowercase names for the"
	ltl_log "\tpropositional symbols, for instance:"
	ltl_log "\t	[] (p U q)"
	ltl_log "\tThe formula expresses either a positive (desired) or a"
	ltl_log "\tnegative (undesired) property of the model.  A positive"
	ltl_log "\tproperty is negated automatically by the translator to"
	ltl_log "\tconvert it in a never claim (which expresses the"
	ltl_log "\tcorresponding negative property (the undesired behavior"
	ltl_log "\tthat is claimed 'never' to occur)."
	ltl_log ""
	ltl_log "\tYou can also avoid the use of propositional symbols by"
	ltl_log "\tusing embedded expressions in curly braces, e.g., instead"
	ltl_log "\tof defining"
	ltl_log "\t	#define p (nr_leaders > 0)"
	ltl_log "\tand using p as a propositional symbol in the LTL formula"
	ltl_log "\t	<>\[\] p"
	ltl_log "\tyou can also use an embedded expression as follows:"
	ltl_log "\t	<>\[\] {nr_leaders > 0}"
	ltl_log ""
	ltl_log "\tWhen you type a <Return> or hit the <click to generate> button"
	ltl_log "\tat the bottom of the screen, the formula is converted into"
	ltl_log "\ta never-claim, which can be imported into a verification on the"
	ltl_log "\tVerification Panel (or saved in a template file for later)."
	ltl_log ""
	ltl_log "\tIf you're using propositional symbols (p, q, etc.) a definition"
	ltl_log "\tfor each symbol used must be given in the top window (macros)"
	ltl_log "\tThese definitions become part of the LTL template."
	ltl_log "\tEnclose the symbol definitions in round braces, for instance:"
	ltl_log ""
	ltl_log "\t#define p	(a > b)"
	ltl_log "\t#define q	(len(q) < 5)"
	ltl_log ""
	ltl_log "\tValid temporal logic operators are:"
	ltl_log "\t	\[\]  Always (no space between \[ and \])"
	ltl_log "\t	<>  Eventually (no space between < and >)"
	ltl_log "\t	U   (Strong) Until"
	ltl_log "\t	V   The Dual of Until: (p V q) == !(!p U !q)"
	ltl_log "\t"
	ltl_log "\t	All operators are left-associative."
	ltl_log "\t"
	ltl_log "\tBoolean Operators:"
	ltl_log "\t	&&  Logical And (alternative form: /\\, no spaces)"
	ltl_log "\t	!   Logical Negation"
	ltl_log "\t	||  Logical Or  (alternative form: \\/, no spaces)"
	ltl_log "\t	->  Logical Implication"
	ltl_log "\t	<-> Logical Equivalence"
	ltl_log ""
	ltl_log "\tBoolean Predicates:"
	ltl_log "\t	true, false"
	ltl_log "\t	any name that starts with a lowercase letter, or"
	ltl_log "\t	any state expression enclosed in curly braces {...}"
	ltl_log "\t"
	ltl_log "\tExamples:"
	ltl_log "\t	\[\] p"
	ltl_log "\t	!( <> !q )"
	ltl_log "\t	p U q"
	ltl_log "\t	p U (\[\] (q U r))"
	ltl_log "\t	{ a + b == 15 } U { qempty(qin) }"
	ltl_log "\t"
	ltl_log "\tGeneric types of LTL properties:"
	ltl_log "\t	Invariance: \[\] p"
	ltl_log "\t	Response:   (p -> \<\> q)"
	ltl_log "\t	Precedence: (p -> (q U r))"
	ltl_log "\t	Objective:  (p -> \<\> (q || r))"
	ltl_log "\t"
	ltl_log "\t	Each of the above 4 generic types of properties"
	ltl_log "\t	can (and will generally have to) be prefixed by"
	ltl_log "\t	temporal operators such as"
	ltl_log "\t		\[\], \<\>, \[\]\<\>, \<\>\[\]"
	ltl_log "\t	The last (objective) property can be read to mean"
	ltl_log "\t	that 'p' is a trigger, or 'enabling' condition that"
	ltl_log "\t	determines when the requirement becomes applicable"
	ltl_log "\t	(e.g. the sending of a new data message); then 'q'"
	ltl_log "\t	can be the fullfillment of the requirement (e.g."
	ltl_log "\t	the arrival of the matching acknowledgement), and"
	ltl_log "\t	'r' could be a discharging condition that voids the"
	ltl_log "\t	applicability of the check (an abort condition)."
}

proc put_t_name {t file} {

	if {[string first "[pwd]/" $file] == 0} {
		set prf [string length "[pwd]/"]
		set file [string range $file $prf end]
	}

	$t.left.frm.tmp delete 0 end
	$t.left.frm.tmp insert insert "$file"
}

proc dump_contents {s fd w} {
	puts $fd "===start $s==="
	puts $fd [$w get 0.0 end]
	puts $fd "===end $s==="
}

proc hunt_for {s fd} {

	while {[gets $fd line] > -1} {
		if {[string first "$s" $line] >= 0} {
			return "$line"
		}
	}
	add_log "restore: $s not found" 0
	return ""
}

proc get_contents {s fd w} {
	set found 0

	if {[hunt_for "===start $s===" $fd] == ""} {
		catch { close $fd }
		return 0
	}
	$w delete 0.0 end

	set found 0
	while {[gets $fd line] > -1} {
		if {[string first "===end $s===" $line] == 0} {
			set found 1
			break
		} else {
			$w insert end $line\n
	}	}
	if {$found == 0} {
		add_log "restore: end tag $s not found" 0
		catch { close $fd }
		return 0
	}
	return 1
}

proc get_field {s fd e} {

	set want [hunt_for $s $fd]
	if {$want == ""} {
		add_log "restore: no field $s" 0
		return 0
	}
	set x [string last "\t" $want]
	incr x
	$e delete 0 end
	$e insert end [string range $want $x end]
}

proc get_var {s fd} {

	set want [hunt_for $s $fd]
	if {$want == ""} {
		add_log "restore: no var $s" 0
		return 0
	}
	set x [string last "\t" $want]
	incr x
	return [string range $want $x end]
}

proc restore_session {} {
	global Fname Sname twin vwin qwin swin clog x

	set ftypes {
		{{iSpin Session Format} {.isf} }
		{{All Files}	*}
	}
	switch -- [set f [tk_getOpenFile -filetypes $ftypes]] "" return

	if [catch {set fd [open "$f" r]} errmsg] {
		add_log $errmsg 1
		return
	}
	if {[gets $fd line] <= -1} {
		add_log "restore_session: empty file" 1
		return
	}
# Edit/View
	set nx [string first "\t" $line]
	if {[string first "Fname" $line] != 0 || $nx != 5} {
		add_log "$f is not an ispin session file" 1
		add_log "first line is: $line at: [string first "Fname" $line] x: $nx" 0
		return
	}
	incr nx
	set Fname [string range $line $nx end]
	wm title . "$Fname"

	if {[get_contents "Model Spec" $fd $twin] == 0} { return }
	if {[get_contents "Model Log"  $fd $clog] == 0} { return }

# Simulate
global l_typ msc_full var_vals

	get_field "Seed"     $fd $x.sms.rnd.fld2	;# random seed value
	get_field "Trail"    $fd $x.sms.int.fld4	;# error trail name
	get_field "SkipStep" $fd $x.sms.skp.ent		;# steps skipped
	get_field "MaxStep"  $fd $x.sms.ub.ent		;# max steps

	set var_vals [get_var "VarVals"  $fd]		;# variable values
	set l_typ    [get_var "FullQ"    $fd]		;# block/loses choice
	set msc_full [get_var "MSC_Full" $fd]		;# MSC+stmnt boolean

	get_field "MaxText" $fd	$x.afq.max.me		;# MSC max text width
	get_field "Delay"   $fd	$x.afq.delay.me		;# MSC update delay
	get_field "Pids"    $fd	$x.filters.pids.ent	;# process ids
	get_field "Qids"    $fd	$x.filters.qids.ent	;# queue ids
	get_field "Vars"    $fd	$x.filters.vars.ent	;# var names
	get_field "Track"   $fd	$x.filters.track.ent	;# tracked var
	get_field "Scale"   $fd	$x.filters.scale.ent	;# track scaling

	if {[get_contents "Data"   $fd $vwin] == 0} { return }
	if {[get_contents "Sim"    $fd $swin] == 0} { return }
	if {[get_contents "Queues" $fd $qwin] == 0} { return }

# LTL
global nvr_pan note_pan sym_pan ltl_main
global negate_ltl
global LTL_Panel

	set LTL_Panel [get_var "LTL_Panel" $fd]

	if {$LTL_Panel} {
		get_field "Formula"  $fd  $ltl_main.left.frm.ent
		get_field "Template" $fd  $ltl_main.left.frm.tmp

		set negate_ltl [get_var "All" $fd]		;# all/no executions

		if {[get_contents "Symbols" $fd $sym_pan]  == 0} { return }
		if {[get_contents "Notes"   $fd $note_pan] == 0} { return }
		if {[get_contents "Claim"   $fd $nvr_pan]  == 0} { return }
	}

# Verification
global p_mode a_mode e_mode x_mode f_mode s_mode q_mode
global cc_mode ma_mode c_mode estop bf_mode po_mode
global bc_mode it_mode u_mode sv_mode peg vranges
global vpanel vo
	set a_mode  [get_var "a_mode"  $fd]
	set bc_mode [get_var "bc_mode" $fd]

	get_field "bc_bound" $fd $vpanel.top.third.rowB.ent

	set bf_mode [get_var "bf_mode" $fd]
	set c_mode  [get_var "c_mode"  $fd]
	set cc_mode [get_var "cc_mode" $fd]
	set e_mode  [get_var "e_mode"  $fd]
	set estop   [get_var "estop"   $fd]
	set f_mode  [get_var "f_mode"  $fd]
	set it_mode [get_var "it_mode" $fd]
	set ma_mode [get_var "ma_mode" $fd]
	set p_mode  [get_var "p_mode"  $fd]
	set peg     [get_var "peg"     $fd]
	set po_mode [get_var "po_mode" $fd]
	set q_mode  [get_var "q_mode"  $fd]
	set s_mode  [get_var "s_mode"  $fd]
	set sv_mode [get_var "sv_mode" $fd]
	set u_mode  [get_var "u_mode"  $fd]
	set vranges [get_var "vranges" $fd]
	set x_mode  [get_var "x_mode"  $fd]

global vpanel vo V_Panel_3

	if {$V_Panel_3} {
		get_field "vrow0" $fd $vpanel.top.right.row0.ent	;# phys mem
		get_field "vrow1" $fd $vpanel.top.right.row1.ent	;# state space size
		get_field "vrow2" $fd $vpanel.top.right.row2.ent	;# max depth
		get_field "vrow3" $fd $vpanel.top.right.row3.ent	;# nr hashfcts
		get_field "vrow4" $fd $vpanel.top.right.row4.ent	;# MA size
		get_field "vrow5" $fd $vpanel.top.right.row5.ent	;# extra spin options
		get_field "vrow6" $fd $vpanel.top.right.row6.ent	;# extra cc options
		get_field "vrow7" $fd $vpanel.top.right.row7.ent	;# extra pan options
	}

	if {[get_contents "VerOut" $fd $vo]  == 0} { return }

# Swarm
global spanel so sr

	get_field "srow0" $fd $spanel.top.left.row0.e0	;# min hashfcts
	get_field "srow1" $fd $spanel.top.left.row1.e0	;# max hashfcts
	get_field "srow2" $fd $spanel.top.left.row2.e0	;# min search depth
	get_field "srow3" $fd $spanel.top.left.row3.e0	;# max search depth
	get_field "srow4" $fd $spanel.top.left.row4.e0	;# nr cpus local
	get_field "srow5" $fd $spanel.top.left.row5.e0	;# nr cpus remote
	get_field "srow6" $fd $spanel.top.left.row6.e0	;# max mem per run
	get_field "srow7" $fd $spanel.top.left.row7.e0	;# max runtime

	get_field "srow8" $fd $spanel.top.middle.row8.e1	;# hash-factor
	get_field "srow9" $fd $spanel.top.middle.row9.e1	;# statevector size in bytes
	get_field "srow10" $fd $spanel.top.middle.row10.e1	;# exploration speed

	get_field "srow11" $fd $spanel.top.middle.row11.e1	;# extra spin args
	get_field "srow12" $fd $spanel.top.middle.row12.e1	;# extra pan args

	if {[get_contents "CCopts"  $fd $spanel.top.right.row0]  == 0} { return }
	if {[get_contents "SwSetup" $fd $so]  == 0} { return }
	if {[get_contents "SwRun"   $fd $sr]  == 0} { return }

	catch { close $fd }

	add_log "restored session from file $f" 0
}

proc save_session {n} {
	global Fname Sname twin vwin qwin swin clog x
	global l_typ msc_full LTL_Panel

	set f "$Sname.isf"	;# ispin session file
	if {$n == 1} { set f [tk_getSaveFile -defaultextension .isf] }
	if {$f == ""} { return }

	if {[string first "." $f] < 0} {
		set f "$f.isf"
	}

	if ![file_ok $f] { return }
	if [catch {set fd [open $f w]} errmsg] {
		add_log $errmsg
		return
	}
	fconfigure $fd -translation lf	;# no cr at end of line

	set Sname $f

# Global
	# PM save colors/fonts/fontsizes, if modified from default
# Edit/View
	# PM save width/height logwindow in Edit panel
		# but $twin configure -height etc. doesnt seem to capture current size
		#	set x [$twin configure -height]
		#	set n [llength $x]; incr n -1
		#	puts $fd "Height [lindex $x $n]" ;# data not current

	# filename
	puts $fd "Fname	$Fname"
	dump_contents "Model Spec" $fd $twin
	dump_contents "Model Log"  $fd $clog

# Simulate
	# PM width/height of text and msc/data/sim/queues panels
global var_vals

	puts $fd "Seed	[$x.sms.rnd.fld2 get]"		;# random seed value
	puts $fd "Trail	[$x.sms.int.fld4 get]"		;# error trail name
	puts $fd "SkipStep	[$x.sms.skp.ent get]"	;# steps skipped
	puts $fd "MaxStep	[$x.sms.ub.ent get]"	;# max steps
	puts $fd "VarVals	$var_vals"		;# variable values
	puts $fd "FullQ	$l_typ"				;# block/loses choice
	puts $fd "MSC_Full	$msc_full"		;# MSC+stmnt boolean
	puts $fd "MaxText	[$x.afq.max.me get]"	;# MSC max text width
	puts $fd "Delay	[$x.afq.delay.me get]"		;# MSC update delay
	puts $fd "Pids	[$x.filters.pids.ent get]"	;# process ids
	puts $fd "Qids	[$x.filters.qids.ent get]"	;# queue ids
	puts $fd "Vars	[$x.filters.vars.ent get]"	;# var names
	puts $fd "Track	[$x.filters.track.ent get]"	;# tracked var
	puts $fd "Scale	[$x.filters.scale.ent get]"	;# track scaling

	dump_contents "Data"   $fd $vwin
	dump_contents "Sim"    $fd $swin
	dump_contents "Queues" $fd $qwin

# LTL
global nvr_pan note_pan sym_pan ltl_main
global negate_ltl

	puts $fd "LTL_Panel	$LTL_Panel"

	if {$LTL_Panel} {
		# PM width/height of symbol/notes/claim/log panels

		puts $fd "Formula	[$ltl_main.left.frm.ent get]"
		puts $fd "Template	[$ltl_main.left.frm.tmp get]"
		puts $fd "All	$negate_ltl"	;# all/no executions

		dump_contents "Symbols" $fd $sym_pan
		dump_contents "Notes" $fd $note_pan
		dump_contents "Claim" $fd $nvr_pan
	}

# Verification
	# PM width/height of ref and output panels

global p_mode a_mode e_mode x_mode f_mode s_mode q_mode
global cc_mode ma_mode c_mode estop bf_mode po_mode
global bc_mode it_mode u_mode sv_mode peg vranges
global vpanel vo V_Panel_3

	puts $fd "a_mode	$a_mode"
	puts $fd "bc_mode	$bc_mode"
	puts $fd "bc_bound	[$vpanel.top.third.rowB.ent get]"
	puts $fd "bf_mode	$bf_mode"
	puts $fd "c_mode	$c_mode"
	puts $fd "cc_mode	$cc_mode"
	puts $fd "e_mode	$e_mode"
	puts $fd "estop		$estop"
	puts $fd "f_mode	$f_mode"
	puts $fd "it_mode	$it_mode"
	puts $fd "ma_mode	$ma_mode"
	puts $fd "p_mode	$p_mode"
	puts $fd "peg		$peg"
	puts $fd "po_mode	$po_mode"
	puts $fd "q_mode	$q_mode"
	puts $fd "s_mode	$s_mode"
	puts $fd "sv_mode	$sv_mode"
	puts $fd "u_mode	$u_mode"
	puts $fd "vranges	$vranges"
	puts $fd "x_mode	$x_mode"

	if {$V_Panel_3} {
		puts $fd "vrow0		[$vpanel.top.right.row0.ent get]"	;# phys mem
		puts $fd "vrow1		[$vpanel.top.right.row1.ent get]"	;# state space size
		puts $fd "vrow2		[$vpanel.top.right.row2.ent get]"	;# max depth
		puts $fd "vrow3		[$vpanel.top.right.row3.ent get]"	;# nr hashfcts
		puts $fd "vrow4		[$vpanel.top.right.row4.ent get]"	;# MA size
		puts $fd "vrow5		[$vpanel.top.right.row5.ent get]"	;# extra spin options
		puts $fd "vrow6		[$vpanel.top.right.row6.ent get]"	;# extra cc options
		puts $fd "vrow7		[$vpanel.top.right.row7.ent get]"	;# extra pan options
	}
	dump_contents "VerOut" $fd $vo

# Swarm
global spanel so sr
	# PM height setup and output panels

	puts $fd "srow0 	[$spanel.top.left.row0.e0 get]"	;# min hashfcts
	puts $fd "srow1 	[$spanel.top.left.row1.e0 get]"	;# max hashfcts
	puts $fd "srow2 	[$spanel.top.left.row2.e0 get]"	;# min search depth
	puts $fd "srow3 	[$spanel.top.left.row3.e0 get]"	;# max search depth
	puts $fd "srow4 	[$spanel.top.left.row4.e0 get]"	;# nr cpus local
	puts $fd "srow5 	[$spanel.top.left.row5.e0 get]"	;# nr cpus remote
	puts $fd "srow6 	[$spanel.top.left.row6.e0 get]"	;# max mem per run
	puts $fd "srow7 	[$spanel.top.left.row7.e0 get]"	;# max runtime

	puts $fd "srow8 	[$spanel.top.middle.row8.e1 get]"	;# hash-factor
	puts $fd "srow9 	[$spanel.top.middle.row9.e1 get]"	;# statevector size in bytes
	puts $fd "srow10	[$spanel.top.middle.row10.e1 get]"	;# exploration speed

	puts $fd "srow11	[$spanel.top.middle.row11.e1 get]"	;# extra spin args
	puts $fd "srow12	[$spanel.top.middle.row12.e1 get]"	;# extra pan args

	dump_contents "CCopts"  $fd $spanel.top.right.row0	;# compilation options
	dump_contents "SwSetup" $fd $so		;# contents setup output panel?
	dump_contents "SwRun"   $fd $sr		;# contents swarm output panel?

	catch "close $fd"
	add_log "session save in $Sname" 1
}

proc save_spec {n} {
	global Fname twin

	set f $Fname
	if {$n == 1} { set f [tk_getSaveFile] }
	if {$f != ""} { writeoutfile $f }
}

proc save_ltl {t} {
	global sym_pan note_pan nvr_pan

	if {[$t.left.frm.ent get] == ""} {
		ltl_log "error: save, no formula specified"
		return
	}
	gen_claim $t.left.frm.ent $nvr_pan $sym_pan	;# needed for negations

	switch -- [set file [eval tk_getSaveFile -initialdir { [pwd] } ]] "" {
		ltl_log "error: file select failed"
		return
	}
	if ![file_ok $file] {
		ltl_log "error: save, '$file' is not writable"
		return
	}

	if [catch {set fd [open $file w]} errmsg] { return }

	puts $fd [string trimright [ $sym_pan get 0.0 end] "\n"]

	puts $fd [string trimright "	/*\n"]
	puts $fd [string trimright "	* Formula As Typed: [$t.left.frm.ent get]\n"]
	puts $fd [string trimright "	*/\n"]
	puts $fd [string trimright [ $nvr_pan get 0.0 end] "\n"]

	puts $fd [string trimright "#ifdef NOTES\n"]
	puts $fd [string trimright [ $note_pan get 0.0 end] "\n"]
	puts $fd [string trimright "#endif\n"]

	close $fd

	put_t_name $t $file 
	ltl_log "saved in '[$t.left.frm.tmp get]'"
}

proc load_from {t file} {
	global negate_ltl sym_pan nvr_pan note_pan

	if [catch {set fd [open $file r]} errmsg] {
		ltl_log "error: cannot open '$file'"
		return
	}

	clear_ltl $t
	put_t_name $t $file

	set inside_claim 0
	set inside_notes 0
	while {[gets $fd line] > -1} {
		if {$inside_claim} {
			$nvr_pan insert end $line\n
			if {[string first "\}" $line] == 0} {
				set inside_claim 0
			}
			continue
		}
		if {$inside_notes} {
			if {[string first "#endif" $line] == 0} {
				set inside_notes 0
				continue
			}
			$note_pan insert end $line\n
			continue
		}
		if {[string first "#define" $line] >= 0} {
			$sym_pan insert end $line\n
			continue
		}
		if {[string first "* Formula As Typed: " $line] > 0} {
			set sof [string first ":" $line]
			incr sof 2
			$t.left.frm.ent insert end [string range $line	$sof end]
			continue
		}
		if {[string first "never" $line] == 0} {
			set inside_claim 1
			if {[string first "/* !(" $line] > 0} {
				set negate_ltl 1
			}
			$nvr_pan insert end $line\n
			continue
		}
		if {[string first "#ifdef NOTES" $line] >= 0} {
			set inside_notes 1
		}
		if {[string first "#ifdef RESULT" $line] >= 0} {
			set inside_notes 1
			$note_pan insert end "==Verification Result===\n"
		}
	}

	catch " close $fd "
	ltl_log "load '$file'"
}

proc load_ltl {t} {

	set ftypes {
		{{Spin LTL template format} {.ltl} }
		{{All Files}	*}
	}
	switch -- [set file [tk_getOpenFile -filetypes $ftypes]] "" return

	load_from $t $file
}

proc reopen_ltl {t} {
	load_from $t [$t.left.frm.tmp get]
}

proc ltl_panel {t} {
	global NBG NFG TBG TFG CBG CFG LTLbg HV0 HV1 negate_ltl ltl_main
	global sym_pan note_pan nvr_pan log_pan ScrollBarSize Fname

	set ltl_main $t
	$t configure -background $LTLbg

	frame $t.left
	pack $t.left -side top -fill both -expand yes

	frame $t.left.frm -bg $TBG
	label $t.left.frm.lbl -text "LTL Formula:" -bg $TBG -fg $TFG -font $HV1
	entry $t.left.frm.ent -width 60 -relief sunken
	label $t.left.frm.tnm -text "Template File:" -bg $TBG -fg $TFG
	entry $t.left.frm.tmp -width 30 -relief sunken -bg white -fg $TFG
	button $t.left.frm.browse -text "browse" -command "load_ltl $t" \
		-relief raised -bg $TBG -fg $TFG
	$t.left.frm.tmp insert insert "(use save/load)"

	set et $t.left.frm.ent

	frame $t.left.op -bg $TBG
	pack  $t.left.op -side top -fill x -expand no
	set alw {\[\] }
	set eve {\<\> }
	pack [label $t.left.op.s0 -text "Valid Operators: " -bg $TBG -fg $TFG -relief flat] -side left
	pack [button $t.left.op.always -bg $CBG -fg $CFG -font $HV0 -text " always: \[\] " \
		-command "$et insert insert \"$alw \""] -side left
	pack [button $t.left.op.event -bg $CBG -fg $CFG -font $HV0 -text " eventually: \<\> " \
		-command "$et insert insert \"$eve \""] -side left
	pack [button $t.left.op.until -bg $CBG -fg $CFG -font $HV0 -text " strong-until: U " \
		-command "$et insert insert \" U \""] -side left
	pack [button $t.left.op.impl -bg $CBG -fg $CFG -font $HV0 -text " implication: -> " \
		-command "$et insert insert \" -> \""] -side left
	pack [button $t.left.op.and -bg $CBG -fg $CFG -font $HV0 -text " and: && " \
		-command "$et insert insert \" && \""] -side left
	pack [button $t.left.op.or -bg $CBG -fg $CFG -font $HV0 -text " or: || " \
		-command "$et insert insert \" || \""] -side left
	pack [button $t.left.op.not -bg $CBG -fg $CFG -font $HV0 -text "negation: ! " \
		-command "$et insert insert \" ! \""] -side left

	button $t.left.op.open -text "ReLoad" -command "reopen_ltl $t" \
		-activebackground $NFG -activeforeground $NBG \
		-relief raised -bg $NBG -fg $NFG -font $HV0
	button $t.left.op.save -text "Save as"  -command "save_ltl $t" \
		-activebackground $NFG -activeforeground $NBG \
		-relief raised -bg $NBG -fg $NFG -font $HV0
	button $t.left.op.clear -text "Clear"   -command "clear_ltl $t" \
		-activebackground $NFG -activeforeground $NBG \
		-relief raised -bg $NBG -fg $NFG -font $HV0
	button $t.left.op.help -text "Help"   -command "help_ltl" \
		-activebackground $NFG -activeforeground $NBG \
		-relief raised -bg $NBG -fg $NFG -font $HV0

	pack $t.left.op.help $t.left.op.clear $t.left.op.save $t.left.op.open \
		-side right -fill x -expand no
	pack $t.left.frm.lbl $t.left.frm.ent \
		-side left -fill x -expand no
	pack $t.left.frm.browse $t.left.frm.tmp $t.left.frm.tnm \
		-side right -fill x -expand no
	pack $t.left.frm -fill x -expand no

	frame $t.left.hlds -bg $TBG
	label $t.left.hlds.nm -text "Property holds for:" -bg $TBG -fg $TFG
	radiobutton $t.left.hlds.yes -text "all executions (expresses desired behavior)" \
		-variable negate_ltl -value 0 -bg $TBG -fg $TFG
	radiobutton $t.left.hlds.non -text "no executions (expresses error behavior)" \
		-variable negate_ltl -value 1 -bg $TBG -fg $TFG

	pack $t.left.hlds -side top -fill x -expand no
	pack $t.left.hlds.nm $t.left.hlds.yes $t.left.hlds.non \
		-side left -fill x -expand no

	label $t.left.spacer1 -height 1 -bg $LTLbg
	pack  $t.left.spacer1 -side top -fill x -expand no
###
	set horiz_pw [PanedWindow $t.left.top -side top -activator button ]
	set lft    [$horiz_pw add]	;# left hand side
	set rgt    [$horiz_pw add]	;# right hand side
	pack $horiz_pw -fill both -expand yes

	set ltl_pw  [PanedWindow $lft.x -side left -activator button ]
	set mp      [$ltl_pw add]	;# macros
	set np      [$ltl_pw add]	;# notes
	set cp      [$ltl_pw add]	;# claim

	set not_pw  [PanedWindow $rgt.x -side left -activator button ]
	set lp      [$not_pw add]	;# log
	pack $ltl_pw $not_pw -fill both -expand yes
### Macros
	set mp_t    [label $mp.t -text "Symbol macro-definitions (all symbols used in formula):" \
		-bg $TBG -fg $TFG -font $HV0]
	set sw1     [ScrolledWindow $mp.sw1 -size $ScrollBarSize]
	set sym_pan [text $sw1.lb -height 4 -font $HV1]
	$sw1 setwidget $sym_pan
### Notes
	set np_t    [label $np.n -text "Notes (informal explanation of property):" \
		-bg $TBG -fg $TFG -font $HV0]
	set sw3     [ScrolledWindow $np.sw3 -size $ScrollBarSize]
	set note_pan [text $sw3.lb -height 4 -font $HV1]
	$sw3 setwidget $note_pan
### Claim
	set cp_t    [button $cp.n -text "Never Claim (click to generate):" \
		-bg $TBG -fg $TFG -font $HV0]
	set sw5     [ScrolledWindow $cp.sw5 -size $ScrollBarSize]
	set nvr_pan [text $sw5.lb -height 4 -font $HV1]
	$sw5 setwidget $nvr_pan
	$cp.n configure -command "gen_claim $et $nvr_pan $sym_pan"
### Log
	set sw7     [ScrolledWindow $lp.sw7 -size $ScrollBarSize]
	set log_pan [text $sw7.lb -width 60 -relief sunken -bg $CBG -fg $CFG -font $HV1]
	$sw7 setwidget $log_pan

	pack $mp_t -fill x -expand no
	pack $sw1 -fill both -expand yes

	pack $np_t -fill x -expand no
	pack $sw3 -fill both -expand yes

	pack $cp_t -fill x -expand no
	pack $sw5 -fill both -expand yes

	pack $sw7 -fill both -expand yes

	bind $et <Return> " gen_claim $et $nvr_pan $sym_pan"

	ltl_log "ltl log" 
}

set scrollxregion 10000
set scrollyregion 40000

proc simulate_panel {t} {
	global x CBG CFG HV0 HV1 ScrollBarSize scrollxregion scrollyregion
	global s_typ seed skipstep ubstep l_typ var_vals
	global TBG TFG NBG NFG XBB Fname msc_max_w msc_delay
	global rwin swin cwin vwin qwin msc msc_full

	set pws  [PanedWindow $t.pw -side left -activator button ]

	set p2  [$pws add -minsize 10]
	set p1  [$pws add -minsize 10]

	set sf1    [ScrolledWindow $p1.sw -size $ScrollBarSize]
	set tbot   [text $sf1.lb -highlightthickness 0 -bg $CBG -fg $CFG -font $HV1]
	$sf1 setwidget $tbot

	set ttop [frame $p2.sw ]	;# we create the ref scrolled text window below
	set sf2 $ttop

	pack $sf1 $sf2 $pws -fill both -expand yes

#### Simulation Mode
	set topf  [frame $ttop.topf]
	pack $topf -pady 2 -side top -fill both -expand yes

	frame $topf.left -bg $TBG	;# left side of top frame; there's no right side yet
	pack $topf.left -side top -fill both -expand no

	set x $topf.left
	frame $x.sms -bg $TBG
	label $x.sms.fld0 -text "Mode" -relief raised -bg $TBG -fg $TFG

	pack $x.sms -padx 1 -pady 1 -side left -fill both -expand no
	pack $x.sms.fld0 -side top -fill x -expand no

#### Reference Model for Tracking
	set mws [PanedWindow $topf.middle -side top -activator button ]

	set q0 [$mws add -minsize 10]
	set q1 [$mws add -minsize 10]

	# bottom part of top frame: model text for tracking
	set ref    [ScrolledWindow $q0.middle -size $ScrollBarSize]
	set rwin   [text $ref.lb -highlightthickness 0 -font $HV1]
	$ref setwidget $rwin
	pack $ref -side left -fill both -expand yes

	$rwin insert end "reference to model source $Fname"

	set cref   [ScrolledWindow $q1.middle -size $ScrollBarSize]
	set msc    [canvas $cref.right -relief raised \
		-background $XBB -scrollregion "0 0 $scrollxregion $scrollyregion" ]
	$cref setwidget $msc

	pack $mws -side top -fill both -expand yes
	pack $cref -side right -fill both -expand yes

	$msc create text 20 10 -text "MSC $msc_full" -fill white

	bind  $rwin <KeyRelease> {
		if {"%K" == "Return"} {
			$rwin insert insert "[$rwin index insert]	"
			$rwin edit modified true
	}	}

	bind $msc <2> "$msc scan mark %x %y"
	bind $msc <B2-Motion> "$msc scan dragto %x %y"


#### Random
	frame $x.sms.rnd -bg $TBG
	radiobutton $x.sms.rnd.fld1 -text "Random, with seed: " \
		-variable s_typ -value 0 -bg $TBG -fg $TFG
	entry       $x.sms.rnd.fld2 -relief sunken -width 12

	pack $x.sms.rnd -side top -fill x -expand no
	pack $x.sms.rnd.fld1 -side left -fill x -expand no
	pack $x.sms.rnd.fld2 -side right -fill x -expand no

	$x.sms.rnd.fld2 insert end $seed

### Interactive
	frame $x.sms.usr -bg $TBG
	radiobutton $x.sms.usr.fld -text "Interactive (for resolution of all nondeterminism)" \
		-variable s_typ -value 2 -bg $TBG -fg $TFG
	pack $x.sms.usr -side top -fill x -expand no
	pack $x.sms.usr.fld -side left -fill x -expand no

#### Guided
	frame $x.sms.int -bg $TBG
	radiobutton $x.sms.int.fld3 -text "Guided, with trail:" \
		-variable s_typ -value 1 -bg $TBG -fg $TFG
	entry       $x.sms.int.fld4 -relief sunken
	button      $x.sms.int.fld5 -relief raised -text "browse" \
		-command { find_trail $x.sms.int.fld4 } -bg $TBG -fg $TFG

	pack $x.sms.int -side top -fill x -expand no
	pack $x.sms.int.fld3 -side left -fill x -expand no
	pack $x.sms.int.fld4 -side left -fill x -expand no
	pack $x.sms.int.fld5 -side left -fill x -expand no

#### Initial Steps
	frame $x.sms.skp -bg $TBG
	label $x.sms.skp.lbl -text "  initial steps skipped:" -bg $TBG -fg $TFG
	entry $x.sms.skp.ent -relief sunken -width 12

	$x.sms.skp.ent insert end $skipstep

	frame $x.sms.ub -bg $TBG
	label $x.sms.ub.lbl -text "  maximum number of steps:" -bg $TBG -fg $TFG
	entry $x.sms.ub.ent -relief sunken -width 12
		$x.sms.ub.ent insert end $ubstep

	frame $x.sms.vv -bg $TBG
		checkbutton $x.sms.vv.xx -variable var_vals \
		-text "Track Data Values (this can be slow)" -bg $TBG -fg $TFG

	pack $x.sms.skp -side top -fill x -expand no
		pack $x.sms.skp.lbl -side left  -fill x -expand no
		pack $x.sms.skp.ent -side right -fill x -expand no

	pack $x.sms.ub  -side top -fill x -expand no
		pack $x.sms.ub.lbl -side left -fill x -expand no
		pack $x.sms.ub.ent -side right -fill x -expand no

	pack $x.sms.vv -side top -fill x -expand no
		pack $x.sms.vv.xx -side left -fill x -expand no

#### A Full Queue
	frame $x.afq -bg $TBG
	label $x.afq.fld0 -text "A Full Channel" -relief raised -bg $TBG -fg $TFG

	pack $x.afq -padx 1 -pady 1 -side left -fill both -expand no
	pack $x.afq.fld0 -side top -fill x -expand no
#### Blocks/Loses
	frame $x.afq.int -bg $TBG
		frame $x.afq.int.la -bg $TBG
		radiobutton $x.afq.int.la.fld3 -text "blocks new messages" -variable l_typ -value 0 -bg $TBG -fg $TFG
		radiobutton $x.afq.int.la.fld4 -text "loses  new messages" -variable l_typ -value 1 -bg $TBG -fg $TFG

	pack $x.afq.int -side top -fill x -expand no
	pack $x.afq.int.la -side left -fill x -expand yes
	pack $x.afq.int.la.fld3 -side top -fill x -expand no -anchor w
	pack $x.afq.int.la.fld4 -side top -fill x -expand no -anchor w

#### MSC
	frame $x.afq.ish -bg $TBG
		checkbutton $x.afq.ish.is -text "MSC+stmnt" -variable msc_full -bg $TBG -fg $TFG
		pack $x.afq.ish.is -side left -fill x -expand no
	pack $x.afq.ish -side top -fill x -expand no

	frame $x.afq.max -bg $TBG
		label $x.afq.max.mx -text "MSC max text width" -bg $TBG -fg $TFG
		entry $x.afq.max.me -relief sunken -width 6
		pack $x.afq.max.mx $x.afq.max.me -side left -fill x -expand yes
	pack $x.afq.max -side top -fill x -expand no
	$x.afq.max.me insert end $msc_max_w

	frame $x.afq.delay -bg $TBG
		label $x.afq.delay.mx -text "MSC update delay" -bg $TBG -fg $TFG
		entry $x.afq.delay.me -relief sunken -width 6
		pack $x.afq.delay.mx $x.afq.delay.me -side left -fill x -expand yes
	pack $x.afq.delay -side top -fill x -expand no
	$x.afq.delay.me insert end $msc_delay


#### Output Filters
	output_filters $x

#### Controls
	setup_controls $x

#### Command executed
	frame $x.bgf -bg $TBG
	pack $x.bgf -side right -fill both -expand yes
	set lwin [label $x.bgf.lbl -text "Background command executed:" -bg $TBG -fg $TFG]
	pack $lwin -side top -fill x -expand no
	set cwin [text $x.bgf.cmd -height 6 -bg lightgray -fg $TFG -font $HV1]
	pack $cwin -side top -fill both -expand yes
	button $x.bgf.ps -text "Save in: msc.ps" -font $HV0 \
		-fg black -bg ivory -activeforeground $NBG -activebackground $NFG \
		-command "$msc postscript -file msc.ps -colormode color"
	pack $x.bgf.ps -side right -expand no

### Simulation output
	set bwp  [PanedWindow $tbot.pw -side top -activator button ]

	set p2  [$bwp add -minsize 10]
	set p1  [$bwp add -minsize 10]
	set p0  [$bwp add -minsize 10]

	set lwp    [ScrolledWindow $p1.sw -size $ScrollBarSize]
	set swin   [text $lwp.lb -highlightthickness 0 -bg $CBG -fg $CFG -font $HV1]
	$lwp setwidget $swin

	pack $lwp $bwp -fill both -expand yes

	$swin insert end "Simulation output"

### Data Values
	set si3    [ScrolledWindow $p2.sw2 -size $ScrollBarSize]
	set vwin   [text $si3.lb -width 20 -highlightthickness 0 -bg $CBG -fg $CFG]
	$si3 setwidget $vwin

	pack $si3 -side right -fill both -expand yes
	$vwin insert end "Data Values"

	set si4    [ScrolledWindow $p0.sw0 -size $ScrollBarSize]
	set qwin   [text $si4.qv -width 20 -highlightthickness 0 -bg $CBG -fg $CFG]
	$si4 setwidget $qwin

	pack $si4 -side top -fill both -expand yes
	$qwin insert end "Queues"
}

proc curp { x } {
	global Curp rwin vr

	if {$Curp == "Sp"} {
		update_master $rwin
	}
	if {$Curp == "Vp"} {
		update_master $vr
	}

	set Curp $x
}

proc create_panels {} {
	global Curp NBG NFG MFG MBG version xversion HV0 Fname tcl_platform
	global LTL_Panel

	frame .menu -bg $MFG
	label .menu.title -text "$version :: $xversion" -bg $MFG -fg $MBG	;# reversed menu colors
	pack append .menu .menu.title {left frame c expand} 
	pack append . .menu {top frame w fillx}

	set pane .f
	set nb [NoteBook $pane -bg $NBG -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG -side top]

	pack $pane -fill both -expand yes

	model_panel    [$nb insert end Mp -text " Edit/View "         -raisecmd "curp Mp" ]
	simulate_panel [$nb insert end Sp -text " Simulate / Replay " -raisecmd "curp Sp; runsim" ]

	if {$LTL_Panel} {
	ltl_panel      [$nb insert end Lp -text " LTL Properties "    -raisecmd "curp Lp; runltl" ]
	}
	verify_panel   [$nb insert end Vp -text " Verification "      -raisecmd "curp Vp; runveri" ]
	swarm_panel    [$nb insert end Sw -text " Swarm Run "         -raisecmd "curp Sw; runswarm" ]

	$nb insert end Hp -text " <Help> "          -raisecmd "helper; $pane raise $Curp"
	$nb insert end Ss -text " Save Session "    -raisecmd "save_session 1;  $pane raise $Curp"
	$nb insert end Rs -text " Restore Session " -raisecmd "restore_session; $pane raise $Curp"
	$nb insert end Qt -text " <Quit> "          -raisecmd "cleanup; checked_exit; $pane raise $Curp"

	$pane raise Mp	;# default view
}

proc runltl   {} { add_log "ltl property" 1 }
proc runswarm {} { add_log "swarm run" 1 }

proc runsim {} {
	global rwin s_typ Fname

	update_ref $rwin
	add_log "simulate/replay" 1

	if {[catch { set fd [open "$Fname.trail" r]} errmsg]} {
		;# no trail file
	} else {
		catch { close $fd }
		set s_typ 1
	}
}
proc runveri {} {
	global vr p_mode

	update_ref $vr
	add_log "verification" 1

	if {[has_label "accept" ""]} {
		set p_mode 2		;# liveness
	} else {
		if {[has_label "progress" ""]} {
			set p_mode 1	;# liveness
		} else {
			set p_mode 0	;# safety
	}	}

}


proc bind_lines {into rf} {
	global SFG CFG Fname pane

	set cnt 0
	scan [$into index end] %d numLines
	for {set i 1} {$i <= $numLines} { incr i} {
		set line [$into get $i.0 $i.end]
		set matched ""
		regexp {[A-Za-z0-9_\.]+:[0-9]+} $line matched
		if {$matched == ""} { continue }

		set fn [string first $matched $line]
		set char $fn
		set fn $i.$fn
		incr char [string length $matched]
		set splitx [split $matched ":"]
		set fnm [lindex $splitx 0]
		set lnr [lindex $splitx 1]

		set indend $i
		append indend "." $char

		$into tag add hilite$cnt $fn $indend
		$into tag bind hilite$cnt <ButtonPress-1> "
			if {\[string compare \"$fnm\" \$Fname] == 0 || \[readinfile \"$fnm\" \]} {
				$rf yview -pickplace $lnr.0
				catch { $rf tag delete hilite }
				$rf tag add hilite $lnr.0 $lnr.end
				$rf tag configure hilite -foreground $SFG
			}
		"
		$into tag bind hilite$cnt <Enter> "
			$into tag configure hilite$cnt -foreground $SFG
		"
		$into tag bind hilite$cnt <Leave> "
			$into tag configure hilite$cnt -foreground $CFG
		"
		incr cnt
	}
}

proc queue_update {n} {	;# in separate panel from vars
	global QStep Qnm Levels qwin

	if { [info exists Levels($n)] == 0 } {
		set Levels($n) "-"
	}

	$qwin delete 0.0 end
	$qwin insert end "\[queues, step $Levels($n)\]\n\n"
	foreach el [lsort [array names Qnm]] {
		catch {
			set qc $QStep([list $n $el])
		#	set ff [string last ":" $qc]
		#	incr ff
		#	set cargo [string range $qc $ff end]

			set ff [string first "(" $qc]
			set cargo [string range $qc $ff end]

			$qwin insert end "q $el :: $cargo\n"
	}	}
}

proc step_forw {} {
	global curn maxn

	if {$curn >= $maxn} { return }
	incr curn
	var_update $curn
	queue_update $curn
}

proc step_back {} {
	global curn maxn

	if {$curn <= 1} { return }
	incr curn -1
	var_update $curn
	queue_update $curn
}

proc rewind {} {
	global curn x msc

	set curn 1
	var_update $curn
	queue_update $curn
	catch {
		$x.run.ctl.step  configure -fg gold -command step_forw
		$x.run.ctl.back  configure -fg gold -command step_back
	}
	$msc yview moveto 0.0
}

set ostep 0

proc var_update {n} {
	global VarStep Varnm swin vwin Levels curn maxn LineNo
	global MSC_Y msc msc_w msc_h msc_max_x ostep SFG CFG NFG

	set curn $n

	if { [info exists Levels($n)] == 0 || $Levels($n) == "-" } {
		return
	#	set Levels($n) "0"
	}

	$vwin delete 0.0 end
	$vwin insert end "\[variable values, step $Levels($n)\]\n\n"
	foreach el [lsort [array names Varnm]] {
		catch { $vwin insert end " $el = $VarStep([list $n $el])\n" }
	}

	set showln [expr $LineNo($n) - 1]
	if {$showln <= 0} {
		return
	#	set showln 0
	}
	$swin yview -pickplace $showln

	# find closest entry in MSC_Y not larger than lookfor
	set lookfor $Levels($n)
	set putithere	0
	foreach el [array names MSC_Y] {
		if {$el < $lookfor} {
			if {$el > $putithere} {
				set putithere $el
	}	}	}

	$msc delete wherearewe
	if {[info exists MSC_Y($putithere)] == 0} {
		set MSC_Y($putithere) 0		;# really $msc_min_y - $msc_h
	}
	set ty [expr $MSC_Y($putithere) + $msc_h]
	$msc create line \
		30 $ty \
		[expr $msc_max_x + $msc_w] $ty \
		-width 1 -dash {8 2} -fill red -tags wherearewe

	# highlight line in text view:
	catch { $swin tag configure bound$ostep -foreground $CFG }
	$swin tag configure bound$n -foreground $NFG
	set ostep $n
}

proc file_view {fnm zzz} {
	global Fname SFG rwin

	if {$fnm != ""} {
		if {[string compare "$fnm" $Fname] == 0 || [readinfile "$fnm" ]} {
			$rwin yview -pickplace $zzz.0
			catch { $rwin tag delete hilite }
			$rwin tag add hilite $zzz.0 $zzz.end
			$rwin tag configure hilite -foreground $SFG
			$rwin yview -pickplace [expr $zzz - 5]
	}	}
}

proc put_msc {how sno prno stmnt ss pnm fnm zzz} {
	global msc msc_x msc_y msc_w msc_h msc_max_x scrollyregion
	global x ProcessLine MSC_Y msc_max_w msc_delay HV0 CBG NFG
	global XBG XFG XTX XAR XPR

	if {$msc_max_x < $msc_x} {
		set msc_max_x $msc_x
	}

	set msc_max_w [$x.afq.max.me get]
	set mw [font measure $HV0 "w"]
	set mw [expr $mw * $msc_max_w]
	set msc_x [expr ($mw / 2) + $prno * ($msc_w + 10)]

	set dx [expr $msc_x + $msc_w / 2 ]
	if {[info exists ProcessLine($prno)]} {
		$msc create line \
			$dx $ProcessLine($prno) \
			$dx $msc_y -tags session \
			-width 1 -fill $XPR
	} else {
		$msc create text \
			$dx [expr $msc_y - $msc_h / 2] \
			-text "$pnm:$prno" -fill $XTX -tags session
	}
	set ProcessLine($prno) [expr $msc_y + $msc_h]

	set MSC_Y($sno) $msc_y

	if {$how} {
		$msc create rectangle \
			$msc_x $msc_y \
			[expr $msc_x + $msc_w] [expr $msc_y + $msc_h] \
			-outline $XBG -fill $XFG -tags session
		set tcol $XTX
	} else {
		set tcol black
	}
	set stmnt [string trimleft $stmnt "\["]
	set stmnt [string trimright $stmnt "\]"]

	if {[string length $stmnt] > $msc_max_w} {
		set stmnt [string range $stmnt 0 $msc_max_w]
		set stmnt "$stmnt..."
	}

	set nv [$msc create text \
		[expr $msc_x + $msc_w / 2] [expr $msc_y + $msc_h / 2] \
		-text "$stmnt" -font $HV0 -fill $tcol -tags session]

	$msc bind $nv <ButtonPress-1> "
		var_update $ss
		queue_update $ss
		file_view {$fnm} $zzz
	"

	$msc create text \
		15 [expr $msc_y + $msc_h / 2] \
		-text "$sno" -fill $XTX -tags sno	;# sno: step number

	catch " $msc yview moveto [expr 1.0 * ($msc_y - 10*$msc_h) / $scrollyregion] "
	update

	set msc_delay [$x.afq.delay.me get]
	if {$msc_delay > 0} {
		after $msc_delay
	}
}

proc handle_ipc {qno istype} {
	global Qfill Qempty Mbox_x Mbox_y XAR
	global msc msc_x msc_y msc_w msc_h

	## connect send to receive
	## just deals with the easy case
	## so far, ie not !! or ??

	if {[info exists Qfill($qno)] == 0} {
		set Qfill($qno)  1
		set Qempty($qno) 1
	}

	if {$istype == 1} {	;# send
		set Mbox_x([list $Qfill($qno) $qno]) $msc_x
		set Mbox_y([list $Qfill($qno) $qno]) [expr $msc_y + $msc_h / 2]
		incr Qfill($qno)
	} else {		;# recv
		set ox $Mbox_x([list $Qempty($qno) $qno])
		set oy $Mbox_y([list $Qempty($qno) $qno])
		set tx $msc_x
		set ty [expr $msc_y + $msc_h / 2]

		if {$oy != 0 && $oy != 0} {
			if {$ox < $tx} {
				incr ox $msc_w
			} else {
				incr tx $msc_w
			}
## -dash { 4 2 } -width 3
			$msc create line $ox $oy $tx $ty -width 1 \
				-fill $XAR -arrow last -arrowshape {3 5 3} -tags session
		}
		incr Qempty($qno)
	}
}

proc clearup {} {
	global Varnm Qnm ProcessLine cwin vwin
	global Qfill Qempty Mbox_x Mbox_y

	$cwin delete 0.0 end
	$vwin delete 0.0 end

	catch {
		foreach el [array names ProcessLine] {
			unset ProcessLine($el)
	}	}

	catch	{
		foreach el [array names Varnm] {
			unset Varnm($el)
		}
		foreach el [array names Qnm] {
			unset Qnm($el)
	}	}

	catch {
		foreach el [array names Qfill] {
			unset Qfill($el)
		}
		foreach el [array names Qempty] {
			unset Qempty($el)
	}	}

	catch {
		foreach el [array names Mbox_x] {
			unset Mbox_x($el)
		}
		foreach el [array names Mbox_y] {
			unset Mbox_y($el)
	}	}
}

proc lines_touched {} {
	global LineTouched Fname rwin NBG

	foreach el [array names LineTouched] {
		set f [lindex $el 0]
		if {$f == $Fname} {
			set n [lindex $el 1]
			$rwin tag add touched $n.0 $n.end
	}	}
	$rwin tag configure touched -foreground $NBG
}

proc line_bindings {lnr prno sno line} {
	global Levels LineNo step swin SFG CFG msc_full
	global Fname rwin step msc_h msc_y LineTouched

	set LineNo($step) $lnr
	catch { $swin tag remove bound$step 0.0 end }
	set ft [string first ":" $line]	;# first colon
	set nft [expr $ft - 1]
	set Levels($step) [string range $line 0 $nft]

	set fnm ""
	set zzz 0

	set matched ""
	regexp {[A-Za-z0-9_\.]+:[0-9]+} $line matched
	if {$matched != ""} {
		set splitx [split $matched ":"]
		set fnm [lindex $splitx 0]
		set zzz [lindex $splitx 1]
		set LineTouched([list $fnm $zzz]) 1
	}

	$swin tag add bound$step $lnr.0 $lnr.$ft

	if {$matched == ""} {
		$swin tag bind bound$step <ButtonPress-1> "
			var_update $step
			queue_update $step
		"
	} else {
		$swin tag bind bound$step <ButtonPress-1> "
			var_update $step
			queue_update $step
			if {\[string compare \"$fnm\" \$Fname] == 0 || \[readinfile \"$fnm\" \]} {
				$rwin yview -pickplace $zzz.0
				catch { $rwin tag delete hilite }
				$rwin tag add hilite $zzz.0 $zzz.end
				$rwin tag configure hilite -foreground $SFG
				$rwin yview -pickplace [expr $zzz - 5]
			}
		"
	}
	$swin tag bind bound$step <Enter> "
		$swin tag configure bound$step -foreground $SFG
	"
	$swin tag bind bound$step <Leave> "
		$swin tag configure bound$step -foreground $CFG
	"

	if {$msc_full} {
		set sos [string first "\[" $line]
		if {$sos > 0} {
			set stmnt [string range $line $sos end]
			if {[string first "!" $stmnt] < 0 \
			&&  [string first "?" $stmnt] < 0} {

				set a [string first "(" $line]
				set b [string first ")" $line]
				if {$a > 0 && $b > 0} {
					incr a
					incr b -1
					set c [string range $line $a $b]
				} else {
					set c "--"
				}

				put_msc 0 $sno $prno $stmnt $step $c $fnm $zzz
				incr msc_y $msc_h
	}	}	}
}

proc var_track {nm vl ts} {
	global msc msc_h msc_y o_y o_v

	if {$msc_y > $o_y} {
		for {set i $o_y} {$i < $msc_y} {incr i $msc_h} {
			$msc create line \
				30 $i \
				[expr 30 + $o_v * $ts] $i \
				-width [expr $msc_h - 5] -fill orange -tags vartrack
	}	}
	set o_y $msc_y
	set o_v $vl

	$msc create line \
		30 $msc_y \
		[expr 30 + $vl * $ts] $msc_y \
		-width [expr $msc_h - 5] -fill orange -tags vartrack
}

set Choice(0) ""
set PlaceMenu "+150+150"
set howmany 0

proc pickoption {nm} {
	global Choice PlaceMenu howmany NBG NFG cwin swin rwin

	set howmany 0
	catch {destroy .prompt}
	toplevel .prompt
	wm title .prompt "Select"
	wm iconname .prompt "Select"
	wm geometry .prompt $PlaceMenu

	text .prompt.t -relief raised -bd 2 \
		-width [string length $nm] -height 1 \
		-setgrid 1
	pack append .prompt .prompt.t { top expand fillx }
	.prompt.t insert end "$nm"
	set cnt 0
	focus .prompt
	foreach i [lsort [array names Choice]] {
		if {$Choice($i) != 0} {
			incr cnt
			pack append .prompt \
			  [button .prompt.b$cnt -text "$i: $Choice($i)" \
			  -anchor w \
			  -bg $NBG -fg $NFG \
			  -command "set howmany $i" ] \
			  {top expand fillx}

			set matched ""
			regexp {[A-Za-z0-9_\.]+:[0-9]+} $Choice($i) matched
			if {$matched == ""} { continue }
			set splitx [split $matched ":"]
			set fnm [lindex $splitx 0]
			set lnr [lindex $splitx 1]
			bind .prompt.b$cnt <Enter> "$rwin yview -pickplace $lnr.0"
	}	}
	pack append .prompt \
		[button .prompt.q -text "quit" \
		-anchor w -bg $NBG -fg $NFG -command {set howmany "q\n"} ] \
		{top expand fillx}

	tkwait variable howmany
	set PlaceMenu [wm geometry .prompt]
	set k [string first "\+" $PlaceMenu]
	if {$k > 0} {
		set PlaceMenu [string range $PlaceMenu $k end]
	}
	catch { foreach el [array names Choice]  { unset Choice($el) } }
	destroy .prompt
	$cwin insert end "$howmany "
	$swin insert end "Selected: $howmany\n"
	return $howmany
}

proc run_sim {} {
	global stop x swin rwin vwin cwin stop l_typ s_typ Fname SPIN maxn
	global VarStep Varnm step QStep Qnm SFG CFG Levels LineNo var_vals
	global msc msc_x msc_y msc_w msc_h msc_max_x msc_full MSC_Y Choice

	set stop 0
	update

	set seed    [$x.sms.rnd.fld2 get]
	set skipped [$x.sms.skp.ent get]
	set upper   [$x.sms.ub.ent get]
	set pfilter [$x.filters.pids.ent get]
	set vfilter [$x.filters.vars.ent get]
	set qfilter [$x.filters.qids.ent get]
	set tfilter [$x.filters.track.ent get]
	set tscale  [$x.filters.scale.ent get]

	if {$tscale == ""} { set tscale 1 }

	set args "-p -s -r -X -v -n$seed"

	if {$var_vals} { set args "$args -l -g" }

	if {$skipped > 0} { set args "$args -j$skipped" }
	if {$l_typ != 0}  { set args "$args -m" }
	if {$s_typ == 2}  { set args "$args -i" }
	if {$s_typ == 1}  {
		set tname [$x.sms.int.fld4 get]
		if {$tname == ""} {
			$cwin insert end "error: no trailfile specified\n"
			return
		}
		if [catch {set fo [open "$tname" r]} errmsg] {
			$cwin insert end "$errmsg\n"
			return
		}
		catch { close $fo }

		set args "$args -k $tname"
	#	set upper 0
	}
	if {$upper > 0}   { set args "$args -u$upper" }

	clearup

	set args "$args $Fname"

	$cwin insert end "spin $args\n"

	set fd [open "|$SPIN $args" r+]

	catch "flush $fd"

	$swin delete 0.0 end
	set step 0
	set lnr 1

	$msc delete session
	$msc delete wherearewe
	$msc delete sno
	$msc delete vartrack

	set msc_x 75
	set msc_y 20
	set msc_max_x $msc_x
	set Banner ""

	if {$s_typ == 2} {
		catch { foreach el [array names Choice] { unset Choice($el) } }
	}

	while {$stop == 0 && [eof $fd] == 0 && [gets $fd line] > -1} {
		if {$line == ""} {
			continue
		}
		if {[string first "type return to proceed" $line] > 0} {
			catch { puts $fd ""; flush $fd }
			update
			continue
		}
## interactive mode only:
		if {$s_typ == 2} {
			if {[string first "Select stmnt" $line] >= 0 \
			||  [string first "Select a statement" $line] >= 0} {
				set Banner $line
				continue
			}
			if {[string first "choice " $line] >= 0} {
				if {[string first " unexecutable" $line] < 0 \
				&&  [string first " outside range" $line] < 0} {
					scan $line "	choice %d:" which
					set NN [string first ":" $line]
					incr NN 2
					set what [string range $line $NN end]
					set Choice($which) $what
			##		$swin insert end "=$which=$what== $line\n"
				}
				continue
			}
			if {[string first "Make Selection" $line] >= 0} {
				set nr [pickoption $Banner]
				catch { puts $fd "$nr"; flush $fd }
				if {$nr == "q\n"} { set stop 1 }
				continue
		}	}

		set i [string first "<merge" $line]
		if {$i > 0} {
			incr i -1
			set line [string range $line 0 $i]
			set line [string trimright $line]
		}

		set ipc [string first "\[values: " $line]
		if {$ipc > 0} {		;# send or receive action
			incr ipc 9
			set epc [string last "\]" $line]
			if {$epc > $ipc} {
				incr epc -1
				set stmnt [string range $line $ipc $epc]
				# eg 5!first,7
				set snd [string first "!" $stmnt]
				if {$snd > 0} {
					incr snd -1
					set qno [string range $stmnt 0 $snd]
					set istype 1	;# send
				} else {
					set rcv [string first "?" $stmnt]
					incr rcv -1
					set qno [string range $stmnt 0 $rcv]
					set istype 2	;# recv
				}
				if {$qfilter == "" || [regexp $qfilter $qno] > 0} {
					if {[scan $line "%d:	proc %d (%s)" sno prno pnm] == 3} {

						regexp {[A-Za-z0-9_\.]+:[0-9]+} $line matched
						if {$matched != ""} {
							set splitx [split $matched ":"]
							set fnm [lindex $splitx 0]
							set zzz [lindex $splitx 1]
						}

						if {$pfilter == "" || [regexp $pfilter $prno] > 0} {
							set pnm [string trimright $pnm ")"]
							put_msc 1 $sno $prno $stmnt [expr $step + 1] $pnm $fnm $zzz
							catch { handle_ipc $qno $istype }
							incr msc_y $msc_h
				}	}	}
			}
			continue
		}

		if {[scan $line "%d:	proc %d " sno prno] == 2} {	;# process line: transition info
			set nstep [expr $step + 1]
			foreach el [array names Varnm] {
				if [info exists VarStep([list $step $el])] {
					set xx $VarStep([list $step $el])
					set VarStep([list $nstep $el]) $xx
			}	}
			foreach el [array names Qnm] {
				if [info exists QStep([list $step $el])] {
					set xx $QStep([list $step $el])
					set QStep([list $nstep $el]) $xx
			}	}

			if [info exists LineNo($step)] {
				set LineNo($nstep) $LineNo($step)
			} else {
				set LineNo($nstep) 0
			}
			incr step
			if {$step > $maxn} { set maxn $step }

			if {$pfilter == "" || [regexp $pfilter $prno] > 0} {
				if {[string first "\[.(goto)\]" $line] > 0 \
				||  [string first "goto :" $line] > 0} {
					continue
				}
				$swin insert end "$line\n"
				line_bindings $lnr $prno $sno $line
				lines_touched	;# update
				incr lnr
			}
		} else {		;# variables, queues, and other info
			if {[string first " = " $line] > 0 } {
				set isvar [string first "=" $line]
				set isvar [expr $isvar + 1]
				set varvl [string range $line $isvar end]
				set isvar [expr $isvar - 2]
				set varnm [string range $line 0 $isvar]
				set varnm [string trim $varnm "	"]

				if {$vfilter == "" || [regexp $vfilter $varnm] > 0} {
					set Varnm($varnm) 1
					set VarStep([list $step $varnm]) $varvl
					var_update $step
					if {$tfilter != "" && [regexp $tfilter $varnm] > 0} {
						var_track $varnm $varvl $tscale
					}
				}
			} else {	;# not a variable update
					;# check for queue contents
				set qstart [string first "	queue " $line]
				if {$qstart > 0} {
					incr qstart 7
					set ltail [string range $line $qstart end]
					set qend [string first " " $ltail]
					set qno [string range $ltail 0 $qend]
					if {$qfilter == "" || [regexp $qfilter $qno] > 0} {
						set Qnm($qno) 1
						set QStep([list $step $qno]) $ltail
						queue_update $step
					}
				} else {
					# could be never claim move
					set nvr [string first ":never:" $line]
					if {$nvr > 0} {
						incr nvr 8
						set envr $nvr
						while {[string is integer [string range $line $envr [expr $envr + 1]]]} {
							incr envr
						}
						set clmnt [string range $line $nvr $envr]
						set line "	(never) [string range $line $nvr end]"
					}
					$swin insert end "$line\n"; incr lnr
		}	}	}
	}

	if {$stop == 1} {
		while {[eof $fd] == 0 && [gets $fd line] > -1} {
			if {[string first "type return to proceed" $line] > 0} {
				puts $fd "q"
				flush $fd
				break
		}	}
	}
	catch "close $fd"

	catch {
		$x.run.ctl.reset configure -fg gold -command rewind
	}

	bind_lines $swin $rwin
}

proc add_log {s c} {
	global clog twin cnt

	if {$c} {
		$clog insert end "$cnt $s\n"
		incr cnt
	} else {
		$clog insert end "$s\n"
	}
	bind_lines $clog $twin
	$clog yview -pickplace end
}

proc runsyntax {a} {
	global twin swin pane

	if {[$twin edit modified]} {
		set answer [tk_messageBox -icon question -type yesno \
		-message "There are unsaved changes. Save first?" ]
		switch -- $answer {
		yes { save_spec 0; open_spec 0 }
		no  { }
		}
	}

	if {$a} {
		add_log "redundancies" 1
	} else {
		add_log "syntax check" 1
	}
	syntax_check $a $swin
}

proc cleanup {} {
	global Fname RM
	catch { eval exec $RM never_claim.tmp }
	catch { eval exec $RM $Fname.nvr spinbat.bat dot.tmp dot.out dot.sel pan.tmp }
	catch { eval exec $RM pan.t pan.m pan.h pan.c pan.b pan.p pan.pre }
	catch { eval exec $RM run.tmp pan.exe pan }
}

proc syntax_check {a into} {
	global clog Fname SPIN Unix

	if {$Fname == ""} {
		add_log "no model" 0
		return
	}

	set SPINBAT $SPIN	;# default
	if {$Unix == 0} {	;# on Windows systems only
		if [catch {set fd [open "spinbat.bat" w 0777]} errmsg] {
			;# same as default
		} else {
			set SPINBAT "./spinbat.bat"	;# avoids windows popping up
			puts $fd "@spin %1 %2\n"
			catch "close $fd"
	}	}

	set cnt 0
	if {$a} { set args "-A" } else { set args "-a" }
	catch {eval exec $SPINBAT $args $Fname} err
	$into delete 0.0 end
	if {$err == ""} {
		add_log "spin: nothing to report" 0
	} else {
		add_log "$err" 0
	}
	update
	cleanup
}

proc forAllMatches {w pattern} {
	global lno SFG

	$w tag remove hilite 0.0 end

	scan [$w index end] %d numLines
	for {set i 1} {$i < $numLines} { incr i} {
		$w mark set last $i.0
		if {[regexp -indices $pattern \
			[$w get last "last lineend"] indices]} {
				$w mark set first \
					"last + [lindex $indices 0] chars"
				$w mark set last "last + 1 chars \
					+ [lindex $indices 1] chars"
			$w tag add hilite $i.0 $i.end
			$w tag configure hilite -foreground $SFG
	}	}

	# move to the next line that matches
	for {set i [expr $lno+1]} {$i < $numLines} { incr i} {
		$w mark set last $i.0
		if {[regexp -indices $pattern \
			[$w get last "last lineend"] indices]} {
				$w mark set first \
					"last + [lindex $indices 0] chars"
				$w mark set last "last + 1 chars \
					+ [lindex $indices 1] chars"
			$w yview -pickplace [expr $i-5]
			set lno $i
			return
	}	}
	for {set i 1} {$i <= $lno} { incr i} {
		$w mark set last $i.0
		if {[regexp -indices $pattern \
			[$w get last "last lineend"] indices]} {
				$w mark set first \
					"last + [lindex $indices 0] chars"
				$w mark set last "last + 1 chars \
					+ [lindex $indices 1] chars"
			$w yview -pickplace [expr $i-5]
			set lno $i
			return
	}	}
	add_log "no match found of \"$pattern\"" 0
}

proc file_ok {f} {

	if {[file exists $f]} {
		if {![file isfile $f] || ![file writable $f]} {
			add_log "error: file $f is not writable" 0
			return 0
	}	}
	return 1
}

proc update_master {w} {	;# called for rwin and vr
	global twin	;# to make w match twin

	$twin delete 0.0 end

	scan [$w index end] %d numLines
	incr numLines -1
	for {set i 1} {$i < $numLines} {incr i} {
		set line [$w get $i.0 $i.end]
		$twin insert end "$line\n"
	}
	set line [$w get $i.0 $i.end]
	if {$line != ""} {
		$twin insert end "$line\n"
	}
}

proc update_ref {w} {	;# called for rwin and vr
	global twin	;# to make w match twin

	$w delete 0.0 end

	scan [$twin index end] %d numLines
	incr numLines -1
	for {set i 1} {$i < $numLines} {incr i} {
		set line [$twin get $i.0 $i.end]
		$w insert end "$line\n"
	}
	set line [$w get $i.0 $i.end]
	if {$line != ""} {
		$twin insert end "$line\n"
	}
}

proc writeoutfile {to} {
	global Fname twin

	if ![file_ok $to] { return 0 }

	if [catch {set fd [open $to w]} errmsg] {
		add_log $errmsg 0
		return 0
	}
	fconfigure $fd -translation lf	;# no cr at end of line, just lf

	scan [$twin index end] %d numLines
	for {set i 1} {$i < $numLines} {incr i} {
		set line [$twin get $i.0 $i.end]
		if {[scan $line "%d	" lnr] == 1} {
			set sol [string first "\t" $line]
			incr sol
			puts $fd [string range $line $sol end]
		} else {
			if {[string length $line] > 0} {
				puts $fd $line
	}	}	}
	close $fd

	set Fname $to
	wm title . $Fname
	add_log "<saved $Fname>" 1

	return 1
}

proc readinfile {from} {
	global Fname CBG CFG LTL_Panel
	global vr twin rwin ltl_main

	if [catch {set fd [open $from r]} errmsg] {
		add_log "$errmsg" 0
		return 0
	}

#	$rwin configure -state normal
#	$twin configure -state normal
#	$vr configure -state normal

	$rwin delete 0.0 end
	$twin delete 0.0 end
	$vr delete 0.0 end

	set ln 1
	while {[gets $fd line] > -1} {
		$rwin insert end "$ln	$line\n"
		$twin insert end "$ln	$line\n"
		$vr insert end "$ln	$line\n"
		incr ln
	}

#	$rwin configure -state disabled
#	$twin configure -state disabled
#	$vr configure -state disabled
	$twin edit modified false

	catch { close $fd }
	add_log "$from:1" 1

	set prf "[pwd]/"
	if {[string first $prf $from] == 0} {
		set from [string range $from [string length $prf] end]
	}
	set Fname $from
	wm title . "$Fname"

	if {$LTL_Panel} {
		$ltl_main.left.frm.tmp delete 0 end
		if [catch {set fo [open "$Fname.ltl" r]} errmsg] {
		#	ltl_log "no ltl-file $Fname.ltl"
		} else {
			catch { close $fo }
			$ltl_main.left.frm.tmp insert insert "$Fname.ltl"
			reopen_ltl $ltl_main
	}	}

	return 1
}

proc open_spec {h} {
	global Fname x

	if {$h == 1} {
		set ftypes {
			{{Promela File Format} {.pml} }
			{{All Files}	*}
		}
		switch -- [set file [tk_getOpenFile -filetypes $ftypes]] "" return
	} else {
		if {$Fname == ""} { return }
		set file $Fname
	}
  
	if [readinfile $file] {
		set_path $Fname
	}

	if {$Fname != ""} {
		$x.sms.int.fld4 delete 0 end
		$x.sms.int.fld4 insert end $Fname.trail
	}
}

proc set_path {f} {
	global Fname

	set fullpath [split $f /]
	set nlen [llength $fullpath]
	set Fname [lindex $fullpath [expr $nlen - 1]]
	wm title . "$Fname"
	set fullpath [lrange $fullpath 0 [expr $nlen - 2]] 	;# strip filename
	set wd [join $fullpath /] 				;# put path back together
 	catch {cd $wd}
}

proc symbol_table {} {
	global clog SPIN Fname

	if {$Fname == ""} {
		add_log "no model" 0
		return
	}

	set ST	"$SPIN -d $Fname"

	catch {set fd [open "|$ST" r]} errmsg
	if {$fd == -1} {
		$clog insert end "$errmsg\n"
		$clog yview end
		update
		return
	}
	$clog insert end "Symbol Table Information for $Fname:\n"
	while {[gets $fd line] > -1} {
		$clog insert end "$line\n"
		$clog yview end
		update
	}
	catch { close $fd }
}

proc helper {} {
	global HV0 NBG NFG LTL_Panel

	catch {destroy .hlp}
	toplevel .hlp -bg black
	wm title .hlp "Help with iSpin"
	wm iconname .hlp "Help"
	wm geometry .hlp 800x450+60+150

	set hlp [NoteBook .hlp.x -bg black -fg $NFG -font $HV0 \
		-activebackground $NFG -activeforeground $NBG -side top]

	pack .hlp.x -fill both -expand yes

	g_hlp [$hlp insert end Gh -text " General " ]
	n_hlp [$hlp insert end Nh -text " What is New in 6.0 " ]
	m_hlp [$hlp insert end Mh -text " Edit/View? "   ]
	s_hlp [$hlp insert end Sh -text " Simulation/Replay? "   ]

	if {$LTL_Panel} {
		l_hlp [$hlp insert end Lh -text " LTL Properties? "   ]
	}
	v_hlp [$hlp insert end Vh -text " Verification? "   ]
	sw_hlp [$hlp insert end Swh -text " Swarm? "   ]
	session_hlp [$hlp insert end Sessionh -text " Save/Restore Session? "   ]
	q_hlp [$hlp insert end Qh -text " Quit? "   ]

	$hlp raise Gh
}

proc boilerplate {t} {
	global version xversion CBG CFG HV1 ScrollBarSize

        set x   [ScrolledWindow $t.sw -size $ScrollBarSize]
        set y   [text $x.lb -height 15 -width 100 -highlightthickness 3 -bg $CBG -fg $CFG -font $HV1]
	$x setwidget $y
	pack $x -fill both -expand yes
	return $y
}

proc n_hlp {t} {
	set y [boilerplate $t]

	$y insert end "Spin Version 6.0 has a number of new features.

- Improved scope rules:
	so far, there were only two levels of scope for variable
	declarations: global or proctype local.
	6.0 supports the more traditional block scope as well:
	a variable declared inside an inline definition or inside
	a block has scope that is limited to that inline or block.
	You can revert to the old scope rules by using spin -O
- Multiple never claims:
	In 6.0 you can name never claims, by adding a name in
	between the keyword 'never' and the opening curly brace of
	the never claim body.
	This allows you to specify multiple never claims in a single
	Spin model. The model checker will still only use one never
	claim to perform the verification, but you can choose on the
	command line of pan which claim you want to use: pan -N name
- Synchronous product of claims:
	If multiple never claims are defined, you can use spin to
	generate a single claim which encodes the synchronous product
	of all never claims defined, using the new option -e:
	 spin -e spec.pml
- Inline ltl properties:
	Instead of specifying an explicit never claim, you can now
	specify LTL properties directly inline. Any number of named
	properties can be provided, and you can again choose which
	one should be checked, using the -N command line argument to pan.
	Example LTL property: ltl p1 \{ []<>p \}
	Inline LTL properties state positive properties to prove, i.e.,
	they are not negated. (When spin generates the corresponding
	never claim, it will perform the negation automatically, so that
	it can find counter-examples to the positive property.)
- Dot support:
	A new option for the executable pan supports the generation of
	the state tables in the format accepted by the dot tool from
	graphviz: pan -D (the ascii format is still available as pan -d).
- Standardized output:
	All filename / linenumber references are now in a single standard
	format, given as filename:linenumber, which allows postprocessing
	tools, like iSpin, to easily hotlink such references to the source.	
"
}

proc version_check {y} {
	global CURL

	set TMP   _version_check_.tmp
	set URL   http://spinroot.com/spin/Src/index.html

	if {[auto_execok $CURL] == ""} {
		return
	}
	catch { eval exec $RM $TMP }
	catch { eval exec $CURL -s -S $URL -o $TMP } err
	if {$err != ""} {
		catch { eval exec $RM $TMP }
		return
	}
	set fd -1
	catch { set fd [open $TMP r] }
	if {$fd != -1} {
	   while {[gets $fd line] > -1} {
		set want [string first "Current Version" $line]
		if {$want >= 0} {
			set ln [expr $want + [string length "Current Version "]]
			set el [string first ":" $line]
			$y insert end "The latest Spin Version is: "
			$y insert end "[string range $line $ln [expr $el - 1]] "
			$y insert end "(visit http://spinroot.com/spin/Bin)\n"
			break
	   }	}
	   catch { close $fd }
	}
	catch { eval exec $RM $TMP }
}

proc g_hlp {t} {
	global version xversion

	set y [boilerplate $t]

	$y insert end "  $version\n  $xversion\n\n"

	version_check $y

	$y insert end "
  Spin is an on-the-fly LTL model checking system for proving properties
  of asynchronous software systems, and iSpin is a Graphical User Interface
  for Spin written in Tcl/Tk.

  Click on one of the above tabs for a more detailed explanation of each
  options supported through this interface.
  
  For the latest version of Spin, see:
	http://spinroot.com/spin/Bin (precompiled binaries)
  or
	http://spinroot.com/spin/Src (sources)

  For help with Promela, the specification language used by Spin, see:
	http://spinroot.com/spin/Man/index.html    (overview)
	http://spinroot.com/spin/Man/promela.html  (manual pages)

  For help not covered here and for bug-reports:  spin_list \@ spinroot.com

  iSpin works only with Spin Version 6.0.0 or later.

  Spin is (c) 1989-2003 Bell Laboratories, Lucent Technologies, Murray Hill, NJ, USA, 
  Extensions 2003-2010 (c) JPL/Caltech. All rights reserved.

  Spin and iSpin are for educational and research purposes only. No guarantee
  whatsoever is expressed or implied by the distribution of this code.

  Last updated: 4 December 2010.
"
}

proc m_hlp {t} {

	set y [boilerplate $t]

	$y insert end "
  This panel allows you to Open or Save a Promela verification models
  The default file extension for Promela models is .pml.

  Syntax Check, Redundancy Check, and Symbol Table can be used to produce
  the corresponding output in the black log window at the bottom of the panel.
  Each command issued by iSpin is actually performed by standard Spin
  running in the background, so without Spin (or with the wrong version of
  Spin pre 6.0) not much of interest can happen.

  Find allows you to locate a search string in the Promela model text.

  The Automata View button (in the right side mid panel)
  populates the blue canvas with the names of proctypes and never claims.
  It does so by first generating and compiling the model checking code, so
  if there are syntax errors that prevent compilation, you will see those first.

  Click on a name to generate the control-flow graph of the corresponding
  state machine. Currently, the text in the graphs does not scale when you zoom
  in or out, so this is still of some limited use.
  You can scroll the display by holding button 2 (middle button) down
  and moving the mouse.
"
}

proc s_hlp {t} {

	set y [boilerplate $t]

	$y insert end "
  The Simulation panel has all options that are relevant for random or guided
  simulations of the model. A guided similation uses an error-trail produced
  in a Verification or Swarm run to guide the execution.

  Run		button starts a simulation run
  Stop		stops it
  Rewind	rewinds a completed run to the start

  Step Forward	moves one step forward through an earlier run
  Step Back	moves one step backwards through an earlier run

  The background command executed by Spin to generate the output is shown in the box at the top right.

  Clicking on a line of text in the Simulation output panel moves to that line
  and updates variable values and queue contents values to that point in the execution.
  You can also click on the boxes in an MSC display to achieve the same effect.

  The entry box for process ids allows you to define a regular expression of pids
  that will be used to restrict the output to only processes with matching pids,
  for instance you can use 1|3 to display output for only processes 1 and 3
  or use \[^1-3\] to suppress output for processes 1, 2, and 3

  The entry box for queue ids similarly allows the definition of a regular expression
  filter for operations on channels.

  The entry box for var names allows you to restrict the output in the Data Values
  panel to only variable names matching the regular expression given

  The entry box for tracked variable is an experimental option to display a bar in
  the MSC panel indicating the size of the variable specified -- the size of the
  bar can be scaled with the value given in the track scaling box (e.g., 10 or 0.01).
"
}

proc l_hlp {t} {

	set y [boilerplate $t]

	$y insert end "
  Define an LTL formula in the top box, using the black buttons as
  short-hands if needed. Define any necessary symbols as macros in
  the Symbols panel, add notes to explain what it is you are trying
  to express in the Notes panel and then click the Never Claim bar
  (or type return in the Formula entry box) to generate the never claim.

  You can save a filled in Properties panel as a template with the Save as button,
  and you can (re)load the contents of this panel from an earlier template by
  giving a file name in the Template file entry box (top right) and clicking ReLoad.

  You can load an LTL template with a previously saved LTL
  formula from a file via the Browse button on the upper
  right of the LTL Property Manager panel.

  See also the Help button on the far right on this panel -- with more detailed guidance.
"
}

proc v_hlp {t} {

	set y [boilerplate $t]

	$y insert end "
  Many options are available here; the purpose of most will be clear from the labels.

  A good practice is to go through the options from left to right:
	first choosing the type of verification to be done
	then what types of error trails you want to see
	next the specific type of search to be done (leave it at the default
	setting if you can't decide)
	next choose a storage mode (again, keep the default if you don't
	have a good reason to change it). the options other than exhaustive
	are there just to help you reduce memory.
  The panel at the far right allows you to provide more detailed parameters.
	each of these parameters comes with a short explanation -- press the
	'explain' button next to the parameter to check this.

  Run generates and compiles the model checker and will execute it (if no errors
  prevent the compilation). You can interrupt a long running verification run with the
  Stop button.

  Use the Help button (on the far right, in the middle) gives more detailed information
  on methods to reduce verification complexity.
"
}

proc sw_hlp {t} {

	set y [boilerplate $t]

	$y insert end "
  This panel allows you to configure a Swarm verification run, which can be quite effective
  for large models. You specify the maximum runtime and the number of CPU cores
  to use (do not exceed the number of cores on your system). To use this option,
  you must have the swarm preprocessor installed on your system.

  You can download swarm from: http://spinroot.com/swarm
"
}

proc session_hlp {t} {

	set y [boilerplate $t]

	$y insert end "
  Save Session:
  	Saves the state and contents of *all* panels and selections made,
  	as well as all textual outputs displayed.

  	The data is recorded in a session snapshot file with file extension .isf

  Restore Session:
  	Restores the iSpin displays and selections to the a previously saved state."
}

proc q_hlp {t} {

	set y [boilerplate $t]

	$y insert end "
  Performs an orderly exit from iSpin, cleaning up temporary files, etc.
  If you forgot to save a modified model, you'll get a warning.

  You can of course also just kill the window itself -- but then none of these
  niceties will happen.
"
}

proc find_field {fld ln} {

	set a [string first "$fld" $ln]
	incr a [string length "$fld"]

	set b [string first "\"" [string range $ln $a end]]
	if {$b <= 0} {
		set b [string first "," [string range $ln $a end]]
	}
	if {$b <= 0} {
		set b [string first "\]" [string range $ln $a end]]
	}
	set b [expr $a + $b - 1]

	set mf [string range $ln $a $b]
	if {$mf == ""} { set mf 1 }

	return [expr 50 * $mf]
}

proc display_graph {pn} {
	global fg RM DOT

	add_log "select $pn" 1
	set found 0
	set fd [open dot.tmp r]
	set fo [open dot.out w]
	while {[gets $fd line] > -1} {
		if {[string first "digraph" $line] >= 0} {
			if {[string first "$pn" $line] >= 0} {
				set found 1
			} else {
				set found 0
		}	}
		if {$found} {
			puts $fo "$line"
	}	}
	catch { close $fd }
	catch { close $fo }
	# do not overwrite dot.tmp
	catch { eval exec \"$DOT\" -Ttk < dot.out > dot.sel } err
	if {$err != ""} {
		add_log "$err" 0
		tk_messageBox -icon info -message "pan: $err"
		return
	}

	catch { $fg delete graph }
	set c $fg
	set fd [open dot.sel r]
	while {[gets $fd line] > -1} {
		if {[string first "#" $line] < 0} {
			if {[string first "create polygon" $line] > 0} {
				set line [string map {black red} $line]
				set line [string map {white black} $line]
			}
			if {[string first "create oval" $line] > 0} {
				set line [string map {black ivory} $line]	;# outline black -> ivory
				set line [string map {white black} $line]	;# fill white -> black
			}
			if {[string first "create line" $line] > 0} {
				set line [string map {black ivory} $line]
			}
			if {[string first "create text" $line] > 0} {
				set line [string map {black gold} $line]
			}
			eval $line -tags graph
	}	}
	catch { close $fd }
	catch { eval $RM dot.sel dot.out }	;# cannot delete dot.tmp yet
}

proc mk_graphs {} {
	global fg Fname SPIN CC DOT HV1 RM

	if {$Fname == ""} { return }

	if {[auto_execok $DOT] == ""} {
		tk_messageBox -icon info -message "ispin: cannot find $DOT"
		return
	}

	add_log "$SPIN -o3 -a $Fname" 1
	catch { eval exec $SPIN -o3 -a $Fname } err
	if {$err != ""} {
		if {[string first "Error:" $err] > 0} {
			tk_messageBox -icon info -message "spin: $err"
			return
		}
		add_log "$err" 0
	}
	add_log "$CC -o pan pan.c" 1
	catch { eval exec $CC -w -o pan pan.c } err
	if {$err != ""} {
		add_log "$err" 0
		tk_messageBox -icon info -message "cc: $err"
		return
	}

	# use output from ./pan -D to build menu
	add_log "./pan -D > dot.tmp" 1
	catch { eval exec ./pan -D > dot.tmp } err
	if {$err != ""} {
		add_log "$err" 0
		tk_messageBox -icon info -message "pan: $err"
		return
	}
	set dx 50
	set dy 20

	catch { $fg delete hotlinks }
	catch { $fg delete graph }
	set hl [$fg create text $dx $dy -text "Select:" \
			-font $HV1 -fill white -tags hotlinks]
	incr dy 15
	set fd [open dot.tmp r]
	while {[gets $fd line] > -1} {
		if {[string first "digraph" $line] >= 0} {
			set x [string first "\{" $line]
			set pn [string trim [string range $line 8 [expr $x - 1]]]

			set hl [$fg create text $dx $dy \
				-text $pn -font $HV1 -fill lightblue -tags hotlinks]
			incr dy 15

			$fg bind $hl <Any-Enter> "
				$fg itemconfigure $hl -fill gold
			"
			$fg bind $hl <Any-Leave> "
				$fg itemconfigure $hl -fill lightblue 
			"
			$fg bind $hl <ButtonPress-1> "
				display_graph $pn
			"
	}	}
	catch { close $fd }
}

#### Startup
	create_panels

	add_log "$version" 0
	add_log "$xversion" 0
	add_log "TclTk Version [info tclversion]/$tk_version" 0

	if {$argc == 1} {
		set Fname "$argv"
		open_spec 0
	}

	update

