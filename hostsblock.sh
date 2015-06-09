#!/bin/bash

# GET OPTIONS
while getopts "v:f:h" _option; do
    case "$_option" in
        f)  [ "$OPTARG" != "" ] && _configfile="$OPTARG";;
        v)  [ "$OPTARG" != "" ] && _verbosity_override=$OPTARG;;
        *)
            cat << EOF
Usage:
  $0 [ -f CONFIGFILE ] [ -v VERBOSITY ] - update the HOSTS file with block and redirection lists

Help Options:
  -h                            Show help options

Application Options:
  -f CONFIGFILE                 Specify an alternative configuration file (instead of /etc/hostsblock/hostsblock.conf)
  -v VERBOSITY                  Specify how much information hostsblock provides (0=only fatal errors to 5=the kitchen sink)
EOF
            exit 1
        ;;
    esac
done

# SOURCE DEFAULT SETTINGS AND SUBROUTINES
if [ -f /usr/lib/hostsblock-common.sh ]; then
    source /usr/lib/hostsblock-common.sh
elif [ -f /usr/local/lib/hostsblock-common.sh ]; then
    source /usr/local/lib/hostsblock-common.sh
elif [ -f ./hostsblock-common.sh ]; then
    source ./hostsblock-common.sh
else
    echo "hostsblock-common.sh NOT FOUND. INSTALL IT TO /usr/lib/ OR /usr/local/lib/. EXITING..."
    exit 1
fi

_source_configfile
_verbosity_check
_set_subprocess_verbosity
_check_root
_check_depends mv cp rm curl grep sed tr cut mkdir file
_check_unzip
_check_7z

# IDENTIFY WHAT WILL not BE OUR REDIRECTION URL
if [ "$redirecturl" == "127.0.0.1" ]; then
    _notredirect="0.0.0.0"
else
    _notredirect="127.0.0.1"
fi

# CREATE CACHE DIRECTORY IF NOT ALREADY EXISTENT
if [ -d "$cachedir" ]; then
    _notify 4 "Cache directory $cachedir already created."
else
    _notify 4 "Creating cache directory $cachedir..."
    mkdir $_v -p -- "$cachedir" && _notify 3 "Created temporary cache directory $cachedir" || \
      _notify 1 "FAILED to create cache directory $cachedir."
fi

# DOWNLOAD BLOCKLISTS
_changed=0
_notify 3 "Checking blocklists for updates..."
for _url in ${blocklists[*]}; do
    _outfile=$(echo $_url | sed "s|http:\/\/||g" | tr '/%&+?=' '.')
    if [ -f "$cachedir"/"$_outfile".url ]; then
        _notify 4 "Url file for $cachedir/$_outfile present."
    else
        _notify 4 "Url file for $cachedir/$_outfile not present. Creating it..."
        echo "$_url" > "$cachedir"/"$_outfile".url
    fi
    if [ -f "$cachedir"/"$_outfile" ]; then
        _notify 4 "Cache file $cachedir/$_outfile for blocklist $_url exists. Noting its modification time."
        _old_ls=$(ls -l "$cachedir"/"$_outfile")
    else
        _notify 4 "Cache file $cachedir/$_outfile for blocklist $_url not found. It will be downloaded."
    fi
    _notify 4 "Checking and, if needed, downloading blocklist $_url to $cachedir/$_outfile"
    if curl $_v_curl --compressed -L --connect-timeout $connect_timeout --retry $retry -z "$cachedir"/"$_outfile" "$_url" -o "$cachedir"/"$_outfile"; then
        _notify 3 "Refreshed blocklist $_url."
        _new_ls=$(ls -l "$cachedir"/"$_outfile")
        if [ "$_old_ls" != "$_new_ls" ]; then
            _changed=1
            _notify 2 "CHANGES FOUND for blocklist $_url."
        else
            _notify 4 "No changes for blocklist $_url."
        fi
    else
        _notify 1 "FAILED to refresh/download blocklist $_url."
    fi
done

# IF THERE ARE CHANGES...
if [ $_changed != 0 ]; then
    _notify 3 "Changes found among blocklists. Extracting and preparing cached files to working directory..."

    # CREATE TMPDIR
    if [ -d "$tmpdir"/hostsblock/hosts.block.d ]; then
        _notify 4 "Temporary working directory $tmpdir/hostsblock/hosts.block.d exists."
    else
        _notify 4 "Temporary working directory $tmpdir/hostsblock/hosts.block.d does not exist. Creating it..."
        mkdir $_v -p -- "$tmpdir"/hostsblock/hosts.block.d
    fi

    # EXTRACT CACHED FILES TO HOSTS.BLOCK.D
    _notify 4 "Extracting cached blocklist files to $tmpdir/hostsblock/hosts.block.d."
    for _cachefile in "$cachedir"/*; do
        echo "$_cachefile" | grep -q "\.url$" && continue
        _basename_cachefile=$(basename "$_cachefile")
        _cachefile_dir="$tmpdir/hostsblock/$_basename_cachefile.d"
        _notify 4 "Inspecting $_basename_cachefile for extraction..."
        case "$_basename_cachefile" in
            *.zip)
                if [ $_unzip_available != 0 ]; then
                    _notify 4 "$_basename_cachefile is a zip archive. Will use unzip to extract it..."
                    _decompresser="unzip"
                else
                    _notify 1 "$_basename_cachefile is a zip archive, but an extractor is NOT FOUND. Skipping..."
                    continue
                fi
            ;;
            *.7z)
                if [ $_7zip_available != 0 ]; then
                    _notify 4 "$_basename_cachefile is a 7z archive. Will use $_7zip_available to extract it..."
                    _decompresser="7z"
                else
                    _notify 1 "$_basename_cachefile is a 7z archive, but an extractor is NOT FOUND. Skipping..."
                    continue
                fi
            ;;
            *)
                _notify 4 "$_basename_cachefile has an ambiguous suffix. Inspecting it for its filetype..."
                _cachefile_type=$(file -bi "$_cachefile")
                if [[ "$_cachefile_type" = *'application/zip'* ]]; then
                    if [ $_unzip_available != 0 ]; then
                        _notify 4 "$_basename_cachefile is a zip archive. Will use unzip to extract it..."
                        _decompresser="unzip"
                    else
                        _notify 1 "$_basename_cachefile is a zip archive, but an extractor is NOT FOUND. Skipping..."
                        continue
                    fi
                elif [[ "$_cachefile_type" = *'application/x-7z-compressed'* ]]; then
                    if [ $_7zip_available != 0 ]; then
                        _notify 4 "$_basename_cachefile is a 7z archive. Will use $_7zip_available to extract it..."
                        _decompresser="7z"
                    else
                        _notify 1 "$_basename_cachefile is a 7z archive, but an extractor is NOT FOUND. Skipping..."
                        continue
                    fi
                else
                    _notify 4 "$_basename_cachefile is a plaintext file. No extractor needed."
                    _decompresser="none"
                fi
            ;;
        esac
        _extract_entries &
    done

    _notify 4 "Waiting for extraction processes to finish..."
    wait
    _backup_old

    # INCLUDE HOSTS.HEAD FILE AS THE BEGINNING OF THE NEW TARGET HOSTS FILE
    if [ "$hostshead" == "0" ] || [ $hostshead == 0 ]; then
        _notify 4 "Not using a hostshead file, so deleting existing $hostsfile to make way for its new version..."
        rm $_v -- "$hostsfile" && _notify 4 "Deleted existing $hostsfile." || _notify 1 "FAILED to delete existing $hostsfile."
    else
        _notify 4 "Using a hostshead file, so overwriting $hostsfile with $hostshead..."
        cp $_v -f -- "$hostshead" "$hostsfile" && _notify 3 "Replaced existing $hostsfile with $hosthead." || \
          _notify 1 "FAILED to replace $hostsfile with $hostshead"
    fi

    # PROCESS AND WRITE BLOCK ENTRIES TO FILE
    _notify 3 "Compiling block entries into $hostsfile..."
    if grep -ahE -- "^$redirecturl" "$tmpdir"/hostsblock/hosts.block.d/* | tee "$annotate".tmp | sed "s/ \!.*$//g" |\
        sort -u >> "$hostsfile"; then
        _notify 3 "Compiled block entries into $hostsfile."
    else
        _notify 0 "FAILED TO COMPILE BLOCK ENTRIES INTO $hostsfile. EXITING."
        exit 2
    fi

    # PROCESS AND WRITE REDIRECT ENTRIES TO FILE
    if [ $redirects == 1 ] || [ "$redirects" == "1" ]; then
        _notify 3 "Compiling redirect entries into $hostsfile..."
        if grep -ahEv -- "^$redirecturl" "$tmpdir"/hostsblock/hosts.block.d/* |\
          grep -ah -- "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" | tee -a "$annotate".tmp |\
          sed "s/ \!.*$//g" | sort -u | grep -vf "$whilelist"  >> "$hostsfile"; then
            _notify 3 "Compiled redirect entries into $hostsfile."
        else
            _notify 1 "FAILED to compile redirect entries into $hostsfile."
        fi
    else
        _notify 4 "Skipping redirect entries..."
    fi

    # APPEND BLACKLIST ENTRIES
    _notify 3 "Appending blacklisted entries to $hostsfile..."
    while read _blacklistline; do
        echo "$redirecturl $_blacklistline \! $blacklist" >> "$annotate".tmp
        grep -q "$_blacklistline" "$hostsfile" || echo "$redirecturl $_blacklistline" >> "$hostsfile"
    done < "$blacklist" && _notify 3 "Appended blacklisted entries to $hostsfile." || \
      _notify 1 "FAILED to append blacklisted entries to $hostsfile."

    # SORT AND, IF REQUESTED, COMPRESS ANNOTATION FILE.
    case "$annotate" in
        *.gz)
            which pigz &>/dev/null && \
              sort -u "$annotate".tmp | pigz -zc - > "$annotate" || \
              sort -u "$annotate".tmp | gzip -zc - > "$annotate"
        ;;
        *)
            sort -u "$annotate".tmp > "$annotate"
        ;;
    esac
    [ -f "$annotate" ] && rm -f "$_v" -- "$annotate".tmp

    # REPORT COUNT OF MODIFIED OR BLOCKED URLS
    [ $verbosity -ge 3 ] && _count_hosts "$hostsfile"

    # COMMANDS TO BE EXECUTED AFTER PROCESSING
    _notify 3 "Executing postprocessing..."
    if [ $verbosity -ge 5 ]; then
        postprocess && _notify 3 "Postprocessing completed." || _notify 1 "Postprocessing FAILED."
    else
        postprocess &>/dev/null && _notify 3 "Postprocessing completed." || _notify 1 "Postprocessing FAILED."
    fi

    # CLEAN UP
    _notify 4 "Cleaning up temporary directory $tmpdir/hostsblock..."
    rm $_v -r -- "$tmpdir"/hostsblock && _notify 2 "Cleaned up $tmpdir/hostsblock." || _notify 1 "FAILED to clean up $tmpdir/hostsblock."
    _notify 3 "DONE."
else
    _notify 3 "No new changes. DONE."
fi
