build_aur () {
    # TODO: Create a temp dir that isn't just the package name,
    #       just in case there's a freak accidental name collision
    old_dir=`pwd`
    package=$1

    # Extract the AUR package.
    cd /tmp
    rm -rf ${package} ${package}.tar.gz
    wget "https://aur.archlinux.org/cgit/aur.git/snapshot/${package}.tar.gz"
    tar xvzf "${package}.tar.gz"

    # Prep with a build-user (removed at the end):
    # TODO: Check if already exists, if so, randomize name/don't remove at the end.
    # TODO: Don't give permission to wheel, give it only to this user (easy, but needs debugging first)
    EXISTS=1
    if [ ! $(id -u builder) ]; then
        EXISTS=0
        useradd -m -G wheel builder
        sed -i 's/# %wheel ALL=(ALL) NO/%wheel ALL=(ALL) NO/' /etc/sudoers
    fi
    cd ${package}
    build_dir=$(pwd)
    chown -R builder.builder /tmp/${package}
    echo " => Buiilding ${package}"
    # 2>&1
    su - builder -c "(cd ${build_dir}; makepkg -s --noconfirm)" >/dev/null
    sed -i 's/%wheel ALL=(ALL) NO/# %wheel ALL=(ALL) NO/' /etc/sudoers

    echo " => Adding ${package} to local AUR hosting directory ${offline_mirror_path}"
    mkdir -p "${offline_mirror_path}/os/x86_64"
    sh -c "cp *.xz ${offline_mirror_path}/os/x86_64"
    sh -c "repo-add ${offline_mirror_path}/os/x86_64/arch_offline.db.tar.gz ${offline_mirror_path}/os/x86_64/*pkg*.xz"

    ## Long term storage inside the ISO? (if we want to install from CD to disk or host it to others)
    # sh -c "mv *.xz ${old_dir}/$2/$1.pkg.tar.xz"

    cd ${old_dir}
    if [ ${EXISTS} -lt 1 ]; then
        userdel builder
        rm -rf /home/builder
    fi
    rm -rf /tmp/${package}
    rm /tmp/${package}.tar.gz
}

make_aur_packages() {
    touch ${script_path}/packages.aur
    packages=$(cat ${script_path}/packages.aur)
    if [[ -n ${packages} ]]; then
        for package in ${packages}; do
            build_aur ${package}
        done
    fi
}

make_offline_mirror() {
    packages=$(cat ${script_path}/packages.x86_64)
    if  [[ -n ${packages} ]]; then
        echo " => Downloading packages to offline mirror."
        sh -c "pacman --noconfirm --dbpath /tmp/ -Syu -w --cachedir ${offline_mirror_path} $(echo ${packages} | sed ':a;N;$!ba;s/\n/ /g')"
    fi
    echo " => Downloading core packages to offline mirror."
    #sh -c "pacman --noconfirm --dbpath /tmp/ -Syu -w --cachedir ${offline_mirror_path} gawk gettext grep gzip pacman sed texinfo util-linux"
    sh -c "pacman --noconfirm --dbpath /tmp/ -Syu -w --cachedir ${offline_mirror_path} base base-devel"
    sh -c "repo-add ${offline_mirror_path}/arch_offline.db.tar.gz ${offline_mirror_path}/*pkg*.xz"
}
patch_in_local_mirror() {
    # [arch_offline]\n
    # SigLevel = Optional TrustAll\n
    # Server = file:///tmp/archlive_offline/work/x86_64/airootfs/srv/http/arch_offline/os/x86_64/
    # sh -c "sed -i 's?\[core\]?\[arch_offline\]\nServer = file://${script_path}/${work_dir}/x86_64/airootfs/srv/http/\$repo/os/\$arch\nSigLevel = Optional TrustAll\n\n&?' ${work_dir}/pacman.conf"
    cat <<EOF >> ${work_dir}/pacman.conf
[arch_offline]
SigLevel = Optional TrustAll
Server = file://${offline_mirror_path}/os/x86_64/
EOF
}

install_aur() {
    mkarchiso ${verbose} -w "${work_dir}/x86_64" -C "${work_dir}/pacman.conf" -D "${install_dir}" -p "$(grep -h -v ^# ${script_path}/packages.aur)" install
}

finalize_offline() {
    ## == Remove online repo references
    sed -i 's?\[core\]?# &?' ${script_path}/${work_dir}/x86_64/airootfs/etc/pacman.conf
    sed -i 's?\[extra\]?# &?' ${script_path}/${work_dir}/x86_64/airootfs/etc/pacman.conf
    sed -i 's?\[community\]?# &?' ${script_path}/${work_dir}/x86_64/airootfs/etc/pacman.conf
    sed -i 's?Include = /etc/pacman.d/mirrorlist?# &?' ${script_path}/${work_dir}/x86_64/airootfs/etc/pacman.conf

    cat <<EOF >> ${script_path}/${work_dir}/x86_64/airootfs/etc/pacman.conf
[arch_offline]
SigLevel = Optional TrustAll
Server = file:///srv/http/arch_offline/os/x86_64/
EOF
}

make_iso() {
