#!/bin/bash
#
# Convert diff output to colorized HTML.
# http://www.linuxjournal.com/content/convert-diff-output-colorized-html
# usage: diff -u v1.c v2.c | diff2html >v1-v2.html

cat <<XX
<html>
<head>
<title>Colorized Diff</title>
</head>
<style>
.diffdiv  { border: solid 1px black;           }
.comment  { color: gray;                       }
.diff     { color: #8A2BE2;                    }
.minus3   { color: blue;                       }
.plus3    { color: maroon;                     }
.at2      { color: lime;                       }
.plus     { color: green; background: #E7E7E7; }
.minus    { color: red;   background: #D7D7D7; }
.only     { color: purple;                     }
</style>
<body>
<pre>
XX

echo -n '<span class="comment">'

first=1
diffseen=0
lastonly=0

OIFS=$IFS
IFS='
'

# The -r option keeps the backslash from being an escape char.
read -r s

while [[ $? -eq 0 ]]
do
    # Get beginning of line to determine what type
    # of diff line it is.
    t1=${s:0:1}
    t2=${s:0:2}
    t3=${s:0:3}
    t4=${s:0:4}
    t7=${s:0:7}

    # Determine HTML class to use.
    if    [[ "$t7" == 'Only in' ]]; then
        cls='only'
        if [[ $diffseen -eq 0 ]]; then
            diffseen=1
            echo -n '</span>'
        else
            if [[ $lastonly -eq 0 ]]; then
                echo "</div>"
            fi
        fi
        if [[ $lastonly -eq 0 ]]; then
            echo "<div class='diffdiv'>"
        fi
        lastonly=1
    elif [[ "$t4" == 'diff' ]]; then
        cls='diff'
        if [[ $diffseen -eq 0 ]]; then
            diffseen=1
            echo -n '</span>'
        else
            echo "</div>"
        fi
        echo "<div class='diffdiv'>"
        lastonly=0
    elif  [[ "$t3" == '+++'  ]]; then
        cls='plus3'
        lastonly=0
    elif  [[ "$t3" == '---'  ]]; then
        cls='minus3'
        lastonly=0
    elif  [[ "$t2" == '@@'   ]]; then
        cls='at2'
        lastonly=0
    elif  [[ "$t1" == '+'    ]]; then
        cls='plus'
        lastonly=0
    elif  [[ "$t1" == '-'    ]]; then
        cls='minus'
        lastonly=0
    else
        cls=
        lastonly=0
    fi

    # Convert &, <, > to HTML entities.
    s=$(sed -e 's/\&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' <<<"$s")
    if [[ $first -eq 1 ]]; then
        first=0
    else
        echo
    fi

    # Output the line.
    if [[ "$cls" ]]; then
        echo -n '<span class="'${cls}'">'${s}'</span>'
    else
        echo -n ${s}
    fi
    read -r s
done
IFS=$OIFS

if [[ $diffseen -eq 0  &&  $onlyseen -eq 0 ]]; then 
    echo -n '</span>'
else
    echo "</div>"
fi
echo

cat <<XX
</pre>
</body>
</html>
XX

# vim: tabstop=4: shiftwidth=4: noexpandtab:
# kate: tab-width 4; indent-width 4; replace-tabs false;
