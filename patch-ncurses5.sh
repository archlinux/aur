#! /bin/bash

set -e -o pipefail

BINARY=$1

# cat_word file offset
# cat Elfxx_Word (int32) from file at offset
cat_word () {
    echo -n 0x
    od -j "$2" -N4 -An -tx4 "$1" | tr -d ' \n'
}

# error error_msg
error () {
    echo -e "\e[31m$1\e[0m"
    exit 1
}

echo "Patching $BINARY..."

section_dynstr_offset=0x$(readelf -S "$BINARY" | grep ".dynstr" | awk '{print $6}')
[ "$section_dynstr_offset" = "0x" ] && error "Failed to read offset of section .dynstr"
section_version_r_offset=0x$(readelf -S "$BINARY" | grep ".gnu.version_r" | awk '{print $6}')
[ "$section_version_r_offset" = "0x" ] && error "Failed to read offset of section .version_r"

# typedef struct {
#     Elfxx_Half    vn_version;
#     Elfxx_Half    vn_cnt;
#     Elfxx_Word    vn_file;
#     Elfxx_Word    vn_aux;
#     Elfxx_Word    vn_next;
# } Elfxx_Verneed;
ncurses_verneed_offset=$(readelf -V "$BINARY" | sed -n 's/^ *\(0x[0-9a-f]*\):.*libtinfo.so.[56].*$/\1/p')
[ -z "$ncurses_verneed_offset" ] && error "Failed to read offset of ncurses verneed"
ncurses_verneed_offset=$(("$section_version_r_offset" + "$ncurses_verneed_offset"))
# Elfxx_Verneed.vn_file
ncurses_file_offset=$(cat_word "$BINARY" $(("$ncurses_verneed_offset" + 4)))
ncurses_file_offset=$(("$section_dynstr_offset" + "$ncurses_file_offset"))

# typedef struct {
#     Elfxx_Word    vna_hash;
#     Elfxx_Half    vna_flags;
#     Elfxx_Half    vna_other;
#     Elfxx_Word    vna_name;
#     Elfxx_Word    vna_next;
# } Elfxx_Vernaux;
ncurses_verdaux_offset=$(readelf -V "$BINARY" | sed -n 's/^ *\(0x[0-9a-f]*\):[^:]*: NCURSES6\{0,1\}_TINFO_5.0.19991023.*$/\1/p')
[ -z "$ncurses_verdaux_offset" ] && error "Failed to read offset of ncurses verdaux"
ncurses_verdaux_offset=$(("$section_version_r_offset" + "$ncurses_verdaux_offset"))
# Elfxx_Vernaux.vn_name
ncurses_name_offset=$(cat_word "$BINARY" $(("$ncurses_verdaux_offset" + 8)))
ncurses_name_offset=$(("$section_dynstr_offset" + "$ncurses_name_offset"))

printf 'libtinfo.so.5\x00' | dd conv=notrunc of="$BINARY" bs=1 seek="$ncurses_file_offset" 2> /dev/null

printf 'NCURSES_TINFO_5.0.19991023\x00\x00' | dd conv=notrunc of="$BINARY" bs=1 seek="$ncurses_name_offset" 2> /dev/null
# ElfHash("NCURSES_TINFO_5.0.19991023") = 0x02a6c513
printf '\x13\xc5\xa6\x02' | dd conv=notrunc of="$BINARY" bs=1 seek="$ncurses_verdaux_offset" 2> /dev/null
