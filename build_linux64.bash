    virtualenv ".venv" -p python3
    source ".venv/bin/activate"
    pip install --upgrade certifi
    if command -v autobuild; then
        abver="$(autobuild --version)"
        echo "Found ${abver}"
        if [ "${abver}" = "autobuild 2.1.0" ]; then
            echo "Reinstalling autobuild to work around some bugs"
            pip3 uninstall --yes autobuild
            pip3 install autobuild -i https://git.alchemyviewer.org/api/v4/projects/54/packages/pypi/simple --extra-index-url https://pypi.org/simple
        fi
    else
        pip3 install autobuild -i https://git.alchemyviewer.org/api/v4/projects/54/packages/pypi/simple --extra-index-url https://pypi.org/simple
    fi
    # we have a lot of files, relax ulimit to help performance
    ulimit -n 20000
    # shellcheck disable=SC2153
    autobuild configure -A 64 -c ReleaseOS -- -DLL_TESTS:BOOL=OFF -DDISABLE_FATAL_WARNINGS=ON -DUSE_LTO:BOOL="$(grep -cq '[^!]lto' <<< "${1}" && echo 'ON' || echo 'OFF')" -DVIEWER_CHANNEL="Alchemy Test"
    cd "build-linux-64" || exit 1
    jobcount=$(nproc)
    if [[ ${jobcount} -gt 1 ]]; then
        # The viewer requires an average of 4GB of memory per CPU core to sucessfully link
        mempercorekb=$((4 * 1048576))
        requiredmemorykb=$(($(nproc) * mempercorekb))
        availablememorykb=$(grep MemTotal /proc/meminfo | tr -s ' ' | cut -d ' ' -f 2)
        freememkb="$(grep MemFree /proc/meminfo | tr -s ' ' | cut -d ' ' -f 2)"
        if [[ ${requiredmemorykb} -gt ${availablememorykb} ]]; then
        jobs=0
        until [[ $(((jobs + 1) * mempercorekb)) -gt ${availablememorykb} ]]; do
           jobs=$((jobs+1))
        done
        #((jobs--))
        jobcount=${jobs}
        elif [[ ${jobcount} -le 8 ]]; then
           jobcount=$((jobcount - 1))
        else
           jobcount=$((jobcount - 2))
        fi
    fi
    echo "Building with ${jobcount} jobs (adjusted)"
    time ninja -l"$(nproc)" -j${jobcount}
