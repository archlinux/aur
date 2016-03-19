#!/bin/bash
usage() {
        echo "Usage: xbr [-s scaleBy] input output"
        exit 1
}

scale=4

while getopts ":s:" option; do
        case $option in
                s)
                        scale="$OPTARG"
                        if [ "$scale" -ne 2 ] && [ "$scale" -ne 3 ] && [ "$scale" -ne 4 ]; then
                                echo "Only scale factors of 2, 3 and 4 are supported"
                                exit 1
                        fi
                ;;
                \?)
                        echo "Invalid option: -$OPTARG" >&2
                ;;
                :)
                        echo "xbr: option requires an argument -- '$OPTARG'"
                        usage
                ;;
        esac
done
shift $((OPTIND-1))

inputfile="$1"
outputfile="$2"

if [ -z "$inputfile" ] || [ -z "$outputfile" ]; then
        usage
fi

filetype="$(identify -format "%m" "$inputfile" 2>&1)"
input_exists="$?"

if ! [ -s "$inputfile" ] || [ $input_exists -ne 0 ]; then
        echo "ERROR: can't load '$inputfile'"
        exit 1
fi

if ! [ "$filetype" = "PNG" ]; then
        convert "$inputfile" "._temp_png.png"
        inputfile="._temp_png.png"
fi

pixelscale "$inputfile" "$outputfile" "xbr${scale}x"

if [ -e "._temp_png.png" ]; then
        rm "._temp_png.png"
fi
