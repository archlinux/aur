#!/bin/bash

# SUBROUTINES

_notify() {
    [ $_verbosity -ge $1 ] && echo "$2"
}

_count_hosts() {
    grep -ah -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" "$@" | cut -d" " -f1 | sort -u | while read _addr; do
        _number=$(grep -Fc -- "$_addr " "$@")
        echo "$@: $_number urls redirected to $_addr."
    done
}

_strip_entries() {
    which pigz &>/dev/null
    if [ $? -eq 0 ]; then
        pigz -dc "$2" | grep -v "$1" | pigz $pigz_opt -c - > "$2".tmp
    else
        gzip -dc "$2" | grep -v "$1" | gzip $gzip_opt -c - > "$2".tmp
    fi
}

_extract_entries() {
    if [ ! -d "$_cachefile_dir" ]; then
        mkdir $_v -p -- "$_cachefile_dir"
        if [ $? -ne 0 ]; then
            _notify 0 "FAILED TO CREATE DIRECTORY $_cachefile_dir. EXITING..."
            exit 9
        fi
    fi
    cd "$_cachefile_dir"
    case "$_decompresser" in
        none)
            _compress_exit=0
            cp $_v -- "$_cachefile" "$_cachefile_dir"/ || _notify 1 "FAILED to move ${_cachefile##*/} to $_cachefile_dir."
        ;;
        unzip)
            unzip -B -o -j $_v_unzip -- "$_cachefile"
            _compress_exit=$?
            [ $_compress_exit -ne 0 ] && _notify 1 "FAILED to unzip ${_cachefile##*/}."
        ;;
        7z*)
            if [ $_verbosity -le 1 ]; then
                eval $_7zip_available e "$_cachefile" &>/dev/null
                _compress_exit=$?
            else
                eval $_7zip_available e "$_cachefile"
                _compress_exit=$?
            fi
            [ $_compress_exit -ne 0 ] && _notify 1 "FAILED to un7zip ${_cachefile##*/}."
        ;;
    esac
    if [ $_compress_exit -eq 0 ]; then
        _target_hostsfile="$tmpdir/hostsblock/hosts.block.d/${_cachefile##*/}.hosts"
        _cachefile_url=$(head -n1 "$cachedir"/"${_cachefile##*/}".url)
        grep -rah -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ./* | tr '\t' ' ' | tr -s ' ' | \
          sed -e "s/\#.*//g" -e "s/[[:space:]]$//g" -e "s/$_notredirect/$redirecturl/g" | sort -u | grep -Fvf "$whitelist" | \
          sed "s|$| \! $_cachefile_url|g" > "$_target_hostsfile"
        if [ $? -eq 0 ]; then
            [ $_verbosity -ge 2 ] && _count_hosts "$_target_hostsfile"
        else
            _notify 1 "FAILED to extract any obvious entries from ${_cachefile##*/}."
        fi
        grep -rahv "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" ./* | grep -v -e "^\." -e "\.$" -e "\*" -e "\"" -e "\$" |\
          grep -P '^(?=.*[[:alpha:]])(?=.*\.)' | sed "s/^/$redirecturl /g" | tr '\t' ' ' | tr -s ' ' | \
          sed -e "s/\#.*//g" -e "s/[[:space:]]$//g" | sort -u | grep -Fvf "$whitelist" | sed "s|$| \! $_cachefile_url|g" \
          >> "$_target_hostsfile"
        if [ $? -eq 0 ]; then
            [ $_verbosity -ge 2 ] && _count_hosts "$_target_hostsfile"
        else
            _notify 1 "FAILED to extract any less-obvious entries from ${_cachefile##*/}."
        fi
        cd "$tmpdir"/hostsblock && rm $_v -r -- "$_cachefile_dir" || _notify 1 "FAILED to delete $_cachefile_dir."
    fi
}

_check_url() {
    _url_escaped=$(echo "$@" | sed "s/\./\\\./g")
    if [ $? -eq 0 ]; then
        _matches=$(pigz -dc "$annotate" | grep -F " $_url_escaped ")
    else
        _matches=$(gzip -dc "$annotate" | grep -F " $_url_escaped ")
    fi
    _block_matches=$(echo "$_matches" | grep -- "^$redirecturl" | sed "s/.* \!\(.*\)$/\1/g" | tr '\n' ',' | sed "s/,$//g")
    _redirect_matches=$(echo "$_matches" | grep -v "^$redirecturl" | \
      sed "s/^\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\) .* \! \(.*\)$/to \1 by blocklist \2/g" | \
      tr '\n' ',' | sed "s/,$//g")
    _block_matches_count=$(echo "$_block_matches" | wc -w)
    _redirect_matches_count=$(echo "$_redirect_matches" | wc -w)
    if [ $_block_matches_count -gt 0 ] || [ $_redirect_matches_count -gt 0 ]; then
        [ $_block_matches_count -gt 0 ] && echo -e "\n'$@' \e[1;31mBLOCKED \e[0mby blocklist(s)${_block_matches}"
        [ $_redirect_matches_count -gt 0 ] && echo -e "\n'$@' \e[1;33mREDIRECTED \e[0m$_redirect_matches"
        echo -e "\t1) Unblock/unredirect just $@\n\t2) Unblock/unredirect all sites containing url $@\n\t3) Keep blocked/redirected"
        read -p "1-3 (default: 3): " b
        if [[ $b == 1 || "$b" == "1" ]]; then
            echo "Unblocking just $@"
            echo " $@" >> "$whitelist"
            _strip_entries " $@ \!" "$annotate"
            _strip_entries " $@$" "$blacklist"
            _strip_entries " $@$" "$hostsfile"
            [ ! -d "$tmpdir"/hostsblock ] && mkdir $_v -p "$tmpdir"/hostsblock
            touch "$tmpdir"/hostsblock/changed
        elif [[ $b == 2 || "$b" == "2" ]]; then
            echo "Unblocking all sites containing url $@"
            echo "$@" >> "$whitelist"
            _strip_entries "$@" "$annotate"
            _strip_entries "$@" "$blacklist"
            _strip_entries "$@" "$hostsfile"
            [ ! -d "$tmpdir"/hostsblock ] && mkdir $_v -p "$tmpdir"/hostsblock
            touch "$tmpdir"/hostsblock/changed
        fi
    else
        echo -e "\n'$@' \e[0;32mNOT BLOCKED/REDIRECTED\e[0m\n\t1) Block $@\n\t2) Block $@ and delete all whitelist url entries containing $@\n\t3) Keep unblocked (default)"
        read -p "1-3 (default: 3): " c
        if [[ $c == 1 || "$c" == "1" ]]; then
            echo "Blocking $@"
            echo "$@" >> "$blacklist"
            (
              if which pigz &>/dev/null; then
                  pigz -dc "$annotate" > "$tmpdir"/hostsblock/"${annotate##*/}".tmp
                  echo "$redirecturl $@ \! $blacklist" >> "$tmpdir"/hostsblock/"${annotate##*/}".tmp
                  sort -u "$tmpdir"/hostsblock/"${annotate##*/}".tmp | pigz $pigz_opt -c - > "$annotate"
              else
                  gzip -dc "$annotate" > "$tmpdir"/hostsblock/"${annotate##*/}".tmp
                  echo "$redirecturl $@ \! $blacklist" >> "$tmpdir"/hostsblock/"${annotate##*/}".tmp
                  sort -u "$tmpdir"/hostsblock/"${annotate##*/}".tmp | gzip $gzip_opt -c - > "$annotate"
              fi
              rm -f "$_v" -- "$tmpdir"/hostsblock/"${annotate##*/}".tmp
            ) &
            _strip_entries "^$@$" "$whitelist" &
            echo "$redirecturl $@" >> "$hostsfile" &
            [ ! -d "$tmpdir"/hostsblock ] && mkdir $_v -p "$tmpdir"/hostsblock
            touch "$tmpdir"/hostsblock/changed
            wait
        elif [[ $c == 2 || "$c" == "2" ]]; then
            echo "Blocking $@ and deleting all whitelist url entries containing $@"
            echo "$@" >> "$blacklist" &
            (
              if which pigz &>/dev/null; then
                  pigz -dc "$annotate" > "$tmpdir"/hostsblock/"${annotate##*/}".tmp
                  echo "$redirecturl $@ \! $blacklist" >> "$tmpdir"/hostsblock/"${annotate##*/}".tmp
                  sort -u "$tmpdir"/hostsblock/"${annotate##*/}".tmp | pigz $pigz_opt -c - > "$annotate"
              else
                  gzip -dc "$annotate" > "$tmpdir"/hostsblock/"${annotate##*/}".tmp
                  echo "$redirecturl $@ \! $blacklist" >> "$tmpdir"/hostsblock/"${annotate##*/}".tmp
                  sort -u "$tmpdir"/hostsblock/"${annotate##*/}".tmp | gzip $gzip_opt -c - > "$annotate"
              fi
              rm -f "$_v" -- "$tmpdir"/hostsblock/"${annotate##*/}".tmp
            ) &
            _strip_entries "$@" "$whitelist" &
            echo "$redirecturl $@" >> "$hostsfile" &
            [ ! -d "$tmpdir"/hostsblock ] && mkdir $_v -p "$tmpdir"/hostsblock
            touch "$tmpdir"/hostsblock/changed
        fi
    fi
}

# VARIABLE DEFAULTS
tmpdir="/tmp/hostsblock"
hostsfile="$HOME/hosts.block"
redirecturl="127.0.0.1"
postprocess() {
     /bin/true
}
blocklists=("http://support.it-mate.co.uk/downloads/HOSTS.txt")
blacklist="$HOME/black.list"
whitelist="$HOME/white.list"
hostshead="0"
cachedir="$HOME/cache"
pigz_opt="-9"
gzip_opt="-11"
redirects="0"
connect_timeout=60
retry=0
backup_old=0
recycle_old=0
annotate="$HOME/hostsblock.db.gz"
_verbosity=1
[ -f "$tmpdir"/hostsblock/changed ] && rm -f "$tmpdir"/hostsblock/changed
_check=0
max_simultaneous_downloads=4

# GET OPTIONS
while getopts "qvf:huc:" _option; do
    case "$_option" in
        f)  [ "$OPTARG" != "" ] && _configfile="$OPTARG";;
        v)  _verbosity=2;;
        q)  _verbosity=0;;
        u)
            [ ! -d "$tmpdir"/hostsblock ] && mkdir $_v -p "$tmpdir"/hostsblock
            touch "$tmpdir"/hostsblock/changed
        ;;
        c)
            _check=1
            [ "$OPTARG" != "" ] && _URL="$OPTARG"
        ;;
        *)
            cat << EOF
Usage:
  $0 [ OPTIONS ] - generate a HOSTS file with block and redirection lists
  
  $0 [ OPTIONS ] -c URL - Check if URL and other urls contained therein are blocked

Help Options:
  -h                            Show help options

Application Options:
  -f CONFIGFILE                 Specify an alternative configuration file (instead of /var/lib/hostsblock/hostsblock.conf)
  -q                            Only show fatal errors
  -v                            Be verbose.
  -u                            Force hostsblock to update its target file, even if no changes to source files are found
                                (Ignored with '-c' option)
EOF
            exit 1
        ;;
    esac
done

# SOURCE CONFIG FILE
if [ $_configfile ]; then
    if [ -f "$_configfile" ]; then
    . "$_configfile"
    elif [ $(whoami) != "root" ] && [ -f ${HOME}/.config/hostsblock/hostsblock.conf ]; then
        _notify 1 "Config file $_configfile missing. Using ${HOME}/.config/hostsblock/hostsblock.conf"
        . ${HOME}/.config/hostsblock/hostsblock.conf
    elif [ $(whoami) != "root" ] && [ -f ${HOME}/hostsblock.conf ]; then
        _notify 1 "Config file $_configfile missing. Using ${HOME}/hostsblock.conf"
        . ${HOME}/hostsblock.conf
    elif [ -f /etc/hostsblock/hostsblock.conf ]; then
        _notify 1 "Config file $_configfile missing. Using /etc/hostsblock/hostsblock.conf"
        . /etc/hostsblock/hostsblock.conf
    else
        _notify 1 "No config files found. Using defaults."
    fi
elif [ $(whoami) != "root" ] && [ -f ${HOME}/.config/hostsblock/hostsblock.conf ]; then
    . ${HOME}/.config/hostsblock/hostsblock.conf
elif [ $(whoami) != "root" ] && [ -f ${HOME}/hostsblock.conf ]; then
    . ${HOME}/hostsblock.conf
elif [ -f /etc/hostsblock/hostsblock.conf ]; then
    . /etc/hostsblock/hostsblock.conf
fi

# SET VERBOSITY FOR SCRIPT AND ITS SUBPROCESSES
if [ $_verbosity -eq 0 ]; then
    _v=""
    _v_curl="-s"
    _v_unzip="-qq"
    set +x
elif [ $_verbosity -eq 1 ]; then
    _v=""
    _v_curl="-s"
    _v_unzip="-qq"
    set +x
else
   _v="-v"
   _v_curl="-v"
   _v_unzip="-v"
   set -x
fi

# CHECK FOR CORRECT PRIVILEDGES AND DEPENDENCIES
if [ $(whoami) != "hostsblock" ]; then
    echo -e "WRONG PERMISSIONS. RUN AS USER hostsblock, EITHER DIRECTLY OR VIA SUDO, E.G. sudo -u hostsblock $0 $@\n\nYou may have to add the following line to the end of sudoers after typing 'sudo visudo':\n $(whoami)	ALL	=	(hostblock)	NOPASSWD:	$0\n\nExiting..."
    exit 3
fi

# MAKE SURE NECESSARY DEPENDENCIES ARE PRESENT
for _depends in mv cp rm sha1sum curl grep sed tr cut mkdir file; do
    which "$_depends" &>/dev/null
    if [ $? -ne 0 ]; then
        _notify 0 "MISSING REQUIRED DEPENDENCY $_depends. PLEASE INSTALL. EXITING..."
        exit 5
    fi
done

# RUN AS URLCHECK IF $_check = 1 or if run from a symlink named "hostsblock-urlcheck"
if [ $_check -eq 1 ] || [ "${0##*/}" == "hostsblock-urlcheck" ]; then
    # URLCHECK
    [ -f "$tmpdir"/hostsblock/changed ] && rm -f "$tmpdir"/hostsblock/changed
    echo "Checking to see if url is blocked or not..."
    _check_url $(echo "$_URL" | sed -e "s/.*https*:\/\///g" -e "s/[\/?'\" :<>\(\)].*//g")
    if [ -f "$tmpdir"/hostsblock/changed ]; then
        if [ $_verbosity -ge 1 ]; then
            postprocess
        else
            postprocess &>/dev/null
        fi
    fi
else
    # NORMAL PROCESS
    # CHECK FOR OPTIONAL DECOMPRESSION DEPENDENCIES
    if which unzip &>/dev/null; then
        _unzip_available=1
    else
        _notify 1 "Dearchiver for zip NOT FOUND. Optional functions which use this format will be skipped."
        _unzip_available=0
    fi

    if which 7za &>/dev/null; then
        _7zip_available="7za"
    elif which 7z &>/dev/null; then
        _7zip_available="7z"
    else
        _notify 1 "Dearchiver for 7za NOT FOUND. Optional functions which use this format will be skipped."
        _7zip_available=0
    fi

    # IDENTIFY WHAT WILL not BE OUR REDIRECTION URL
    if [ "$redirecturl" == "127.0.0.1" ]; then
        _notredirect="0.0.0.0"
    else
        _notredirect="127.0.0.1"
    fi

    # CREATE CACHE DIRECTORY IF NOT ALREADY EXISTENT
    if [ ! -d "$cachedir" ]; then
        mkdir $_v -p -- "$cachedir"
        if [ $? -ne 0 ]; then
            _notify 0 "CACHE DIRECTORY $cachedir COULD NOT BE CREATED. EXITING..."
            exit 6
        fi
    fi

    # DOWNLOAD BLOCKLISTS
    _notify 1 "Checking blocklists for updates..."
    for _url in ${blocklists[*]}; do
        _outfile=$(echo $_url | sed -e "s|http:\/\/||g" -e "s|https:\/\/||g" | tr '/%&+?=' '.')
        [ -f "$cachedir"/"$_outfile".url ] || echo "$_url" > "$cachedir"/"$_outfile".url
        [ -f "$cachedir"/"$_outfile" ] && _old_sha1sum=$(sha1sum < "$cachedir"/"$_outfile")

        # Make process wait until the number of curl processes are less than $max_simultaneous_downloads
        until [ $(pidof curl | wc -w) -lt $max_simultaneous_downloads ]; do
            sleep $(pidof sleep | wc -w)
        done

        # Add a User-Agent and referer string when needed
        if [ "$_url" == "http://adblock.mahakala.is/hosts" ]; then
            curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0" -e "http://forum.xda-developers.com/" $_v_curl --compressed -L --connect-timeout $connect_timeout --retry $retry -z "$cachedir"/"$_outfile" "$_url" -o "$cachedir"/"$_outfile"
            _curl_exit=$?
        else
            curl $_v_curl --compressed -L --connect-timeout $connect_timeout --retry $retry -z "$cachedir"/"$_outfile" "$_url" -o "$cachedir"/"$_outfile"
            _curl_exit=$?
        fi
        if [ $_curl_exit -eq 0 ]; then
            _new_sha1sum=$(sha1sum < "$cachedir"/"$_outfile")
            if [ "$_old_sha1sum" != "$_new_sha1sum" ]; then
                _notify 1 "Changes found to $_url"
                [ ! -d "$tmpdir"/hostsblock ] && mkdir $_v -p "$tmpdir"/hostsblock
                touch "$tmpdir"/hostsblock/changed
            fi
        else
            _notify 1 "FAILED to refresh/download blocklist $_url"
        fi
    done &
    wait

    # IF THERE ARE CHANGES...
    if [ -f "$tmpdir"/hostsblock/changed ]; then
        _notify 1 "Changes found among blocklists. Extracting and preparing cached files to working directory..."

        # CREATE TMPDIR
        if [ ! -d "$tmpdir"/hostsblock/hosts.block.d ]; then
            mkdir $_v -p -- "$tmpdir"/hostsblock/hosts.block.d
            if [ $? -ne 0 ]; then
                _notify 0 "FAILED TO CREATED TEMPORARY DIRECTORY $tmpdir/hostsblock/hosts.block.d. EXITING..."
                exit 7
            fi
        fi

        # EXTRACT CACHED FILES TO HOSTS.BLOCK.D
        for _cachefile in "$cachedir"/*; do
            echo "$_cachefile" | grep -q "\.url$" && continue
            _cachefile_dir="$tmpdir/hostsblock/${_cachefile##*/}.d"
            case "${_cachefile##*/}" in
                *.zip)
                    if [ $_unzip_available != 0 ]; then
                        _decompresser="unzip"
                    else
                        _notify 1 "${_cachefile##*/} is a ZIP archive, but an extractor is NOT FOUND. Skipping..."
                        continue
                    fi
                ;;
                *.7z)
                    if [ $_7zip_available != 0 ]; then
                        _decompresser="7z"
                    else
                        _notify 1 "${_cachefile##*/} is a 7z archive, but an extractor is NOT FOUND. Skipping..."
                        continue
                    fi
                ;;
                *)
                    _cachefile_type=$(file -bi "$_cachefile")
                    if [[ "$_cachefile_type" = *'application/zip'* ]]; then
                        if [ $_unzip_available != 0 ]; then
                            _decompresser="unzip"
                        else
                            _notify 1 "${_cachefile##*/} is a zip archive, but an extractor is NOT FOUND. Skipping..."
                            continue
                        fi
                    elif [[ "$_cachefile_type" = *'application/x-7z-compressed'* ]]; then
                        if [ $_7zip_available != 0 ]; then
                            _decompresser="7z"
                        else
                            _notify 1 "${_cachefile##*/} is a 7z archive, but an extractor is NOT FOUND. Skipping..."
                            continue
                        fi
                    else
                        _decompresser="none"
                    fi
                ;;
            esac
            _extract_entries &
        done
        wait

        # RECYCLE OLD HOSTS FILE INTO NEW FILE
        if [ $recycle_old == 1 ] || [ "$recycle_old" == "1" ] || [ "$recycle_old" == "yes" ] || [ "$recycle_old" == "true" ]; then
            sort -u "$hostsfile" | sed "s|$| ! $hostsfile.old |g" > "$tmpdir"/hostsblock/hosts.block.d/"${hostsfile##*/}".old || \
              _notify 1 "FAILED to recycle old $hostsfile into new version."
        fi

        # BACKUP OLD HOSTS FILE
        if [ $backup_old == 0 ] || [ "$backup_old" == "0" ] || [ "$backup_old" == "no" ] || [ "$backup_old" == "false" ]; then
            true
        else
            ls "$hostsfile".old* &>/dev/null && rm $_v -- "$hostsfile".old*
            which pigz &>/dev/null
            if [ $? -eq 0 ]; then
                cat "$hostsfile" | pigz $pigz_opt -c - > "$hostsfile".old.gz
                gzip_exit=$?
            else
                cat "$hostsfile" | gzip $gzip_opt -c - > "$hostsfile".old.gz
                gzip_exit=$?
            fi
            cp $_v -f -- "$hostsfile" "$hostsfile".old && \
            [ $gzip_exit -ne 0 ] && _notify 1 "FAILED to backup and compress $hostsfile."
        fi

        # INCLUDE HOSTS.HEAD FILE AS THE BEGINNING OF THE NEW TARGET HOSTS FILE
        if [ "$hostshead" == "0" ] || [ $hostshead -eq 0 ]; then
            rm $_v -- "$hostsfile" || _notify 1 "FAILED to delete existing $hostsfile."
        else
            cp $_v -f -- "$hostshead" "$hostsfile" || _notify 1 "FAILED to replace $hostsfile with $hostshead"
        fi

        # PROCESS AND WRITE BLOCK ENTRIES TO FILE
        _notify 1 "Compiling into $hostsfile..."
        grep -ahE -- "^$redirecturl" "$tmpdir"/hostsblock/hosts.block.d/* | tee "$tmpdir"/hostsblock/"${annotate##*/}".tmp | sed "s/ \!.*$//g" |\
          sort -u | grep -Fvf "$whitelist" >> "$hostsfile"
        if [ $? -ne 0 ]; then
            _notify 0 "FAILED TO COMPILE BLOCK ENTRIES INTO $hostsfile. EXITING..."
            exit 2
        fi

        # PROCESS AND WRITE REDIRECT ENTRIES TO FILE
        if [ $redirects == 1 ] || [ "$redirects" == "1" ]; then
            grep -ahEv -- "^$redirecturl" "$tmpdir"/hostsblock/hosts.block.d/* |\
              grep -ah -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" | tee -a "$tmpdir"/hostsblock/"${annotate##*/}".tmp |\
              sed "s/ \!.*$//g" | sort -u | grep -Fvf "$whitelist"  >> "$hostsfile" || \
                _notify 1 "FAILED to compile redirect entries into $hostsfile."
        fi

        # APPEND BLACKLIST ENTRIES
        while read _blacklistline; do
            echo "$redirecturl $_blacklistline \! $blacklist" >> "$tmpdir"/"${annotate##*/}".tmp
            grep -Fqx "$_blacklistline" "$hostsfile" || echo "$redirecturl $_blacklistline" >> "$hostsfile"
        done < "$blacklist" || _notify 1 "FAILED to append blacklisted entries to $hostsfile."

        # SORT AND COMPRESS ANNOTATION FILE.
        (
          which pigz &>/dev/null
          if [ $? -eq 0 ]; then
              sort -u "$tmpdir"/hostsblock/"${annotate##*/}".tmp | pigz $_pigz_opt -c - > "$annotate"
          else
              sort -u "$tmpdir"/hostsblock/"${annotate##*/}".tmp | gzip $_gzip_opt -c - > "$annotate"
          fi
          [ -f "$annotate" ] && rm -f "$_v" -- "$tmpdir"/hostsblock/"${annotate##*/}".tmp
        ) &

        # REPORT COUNT OF MODIFIED OR BLOCKED URLS
        ( [ $_verbosity -ge 1 ] && _count_hosts "$hostsfile" ) &

        # COMMANDS TO BE EXECUTED AFTER PROCESSING
        _notify 1 "Executing postprocessing..."
        postprocess || _notify 1 "Postprocessing FAILED."

        wait

        # CLEAN UP
        rm $_v -r -- "$tmpdir"/hostsblock || _notify 1 "FAILED to clean up $tmpdir/hostsblock."
    else
        _notify 1  "No new changes. DONE."
    fi
fi
