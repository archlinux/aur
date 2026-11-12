# Fonts render at the physical screen resolution; small bitmap assets use
# integer enlargement. Gamescope presents the resulting frame at 1:1.
namespace eval ::QuestaHiDPI {
    variable scaled
    variable pending 0
    variable serial 0
    variable scale 2.0
    if {[info exists ::env(QUESTA_HIDPI_SCALE)] &&
        [string is double -strict $::env(QUESTA_HIDPI_SCALE)] &&
        $::env(QUESTA_HIDPI_SCALE) > 0} {
        set scale $::env(QUESTA_HIDPI_SCALE)
    }

    proc setup {{window .}} {
        variable scale
        tk scaling [expr {96.0 * $scale / 72.0}]
        foreach name [font names] {
            font configure $name -size [expr {-int(round(14 * $scale))}]
        }
        after idle ::QuestaHiDPI::icons
    }

    proc icons {} {
        variable scaled
        variable pending
        variable serial
        variable scale
        set pending 0
        set zoom [expr {max(1, int(round($scale)))}]
        if {$zoom == 1} {return}
        foreach name [image names] {
            if {[info exists scaled($name)] || [string match ::QuestaHiDPI::* $name]} {continue}
            if {[image type $name] ne "photo"} {continue}
            set width [image width $name]
            set height [image height $name]
            if {$width < 1 || $height < 1 || $width > 64 || $height > 64} {continue}
            set scaled($name) 1
            set temporary [image create photo ::QuestaHiDPI::copy[incr serial]]
            $temporary copy $name
            $name configure -width [expr {$width * $zoom}] -height [expr {$height * $zoom}]
            $name blank
            $name copy $temporary -zoom $zoom $zoom
            image delete $temporary
        }
    }

    proc imageChanged {command code result operation} {
        variable pending
        variable scaled
        if {$code != 0} {return}
        if {[lindex $command 1] eq "create" && ![string match ::QuestaHiDPI::* $result]} {
            unset -nocomplain scaled($result)
            if {!$pending} {
                set pending 1
                after idle ::QuestaHiDPI::icons
            }
        }
    }
}

# Replace the legacy SetupFonts hook for this session so it does not override
# the DPI setting; other user hooks continue to run.
if {[info exists PrefMain(user_hook)]} {
    set PrefMain(user_hook) [lsearch -all -inline -not -exact $PrefMain(user_hook) SetupFonts]
}
::QuestaHiDPI::setup
lappend PrefMain(user_hook) ::QuestaHiDPI::setup
trace add execution ::image leave ::QuestaHiDPI::imageChanged
