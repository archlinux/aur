#!/bin/sh

post_upgrade() {
 _help_warning

}

post_install() {
 _help_warning
}

_help_warning() {

    cat <<EOF
>>> NOTE: Remember to set properly your help path. By default upak is expecting the
>>>       help to be located in /usr/hhirf/damm.hep or to be pointed out in explicitly
>>>       in the file: ${HOME}/upak_help_path.
>>>
>>>     You can set your help path by typing in a terminal the following:
>>>
>>>    echo "/usr/share/doc/upak/" > ${HOME}/upak_help_path
>>>
EOF
}
