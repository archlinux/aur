# Author: Matt McDonald <gardotd426@gmail.com>
# Contributor: Kevin Gilmer
# Contributor: Avinash Duduskar <strykar@hotmail.com>
# Maintainer: Matt McDonald <gardotd426@gmail.com>


pkgbase=regolith-de
pkgname=(regolith-i3 # (regolith-i3-gaps regolith-i3-gaps-session i3-gaps-wm i3-gaps-wm-dbg i3-snapshot i3xrocks gnome-flashback ubiquity-slideshow-regolith)
	i3-snapshot
        regolith-i3xrocks # allll the i3xrocks shit
        regolith-styles # alll the styles shit
        regolith-st 
        regolith-desktop-config)
pkgver=1.5.3
pkgrel=1
arch=('x86_64')
url=https://github.com/regolith-linux/regolith-desktop
url2=https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+files
url3=https://launchpad.net/~regolith-linux/+archive/ubuntu/unstable/+files
url4=http://archive.ubuntu.com/ubuntu/pool/main/g/gnome-session/
url5=https://launchpad.net/~regolith-linux/+archive/ubuntu/stable/+files
license=('custom: multiple')
groups=('regolith-de')
makedepends=('wget')

source=(http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/a/ayu-theme/ayu-theme_0.2.2-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/c/cahuella/cahuella_1.0.3-1_amd64.deb
        "${url2}"/i3-snapshot_1.0.1-2hirsute_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/i/i3xrocks/i3xrocks_1.3.5-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-battery_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-cpu-usage_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-focused-window-name_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-info_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-key-indicator_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-media-player_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-memory_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-net-traffic_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-nm-vpn_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-openvpn_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-temp_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-time_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-volume_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-weather_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/i3xrocks-wifi_3.6.4-1_amd64.deb
        "${url2}"/nordic_1.6.5-1ubuntu1ppa1_all.deb
	"${url2}"/paper-icon-theme_1.5.723-201905252133~daily~ubuntu19.04.1_all.deb
	"${url2}"/plano-theme_3.36-1-1regolith1_all.deb
        "${url2}"/plymouth-theme-regolith_1.0.3-1_all.deb
        "${url2}"/regolith-compositor-picom-glx_1.1.3-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-default-settings/regolith-default-settings_1.0.8-1hirsute_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-desktop/regolith-desktop-complete_2.124-1hirsute_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-ftue/regolith-ftue_1.1.2-1_amd64.deb
        "${url2}"/regolith-gdm3-theme_2.0.0-1ubuntu1~ppa1_amd64.deb
        "${url2}"/regolith-gnome-flashback_2.6.2-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3-gaps-config/regolith-i3-gaps-config_2.8.6-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-i3xrocks-config/regolith-i3xrocks-config_3.6.4-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-lightdm-config/regolith-lightdm-config_1.1.1-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-ayu_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-ayu-dark_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-ayu-mirage_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-cahuella_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-dracula_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-gruvbox_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-lascaille_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-nord_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-pop-os_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-solarized-dark_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-look-ubuntu_2.9.7-1_amd64.deb
        "${url2}"/regolith-rofi-config_1.3.1-1_amd64.deb
        "${url2}"/regolith-st_0.8.2-1ubuntu20ppa5_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-styles/regolith-styles_2.9.7-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/r/regolith-system/regolith-system_1.5.3-1_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/s/solarc-theme/solarc-theme_800c997-2_amd64.deb
        http://ppa.launchpad.net/regolith-linux/release/ubuntu/pool/main/u/ubiquity-slideshow-regolith/ubiquity-slideshow-regolith_168.6-regolith1_all.deb
        "${url2}"/xrescat_1.2.1-1_amd64.deb
        flashback.patch
	git+https://github.com/regolith-linux/regolith-rofication.git
	http://launchpad.net/\~regolith-linux/+archive/ubuntu/release/+files/midnight-gtk-theme_1.1.0-1_all.deb
	http://launchpad.net/\~regolith-linux/+archive/ubuntu/release/+files/regolith-look-solarized-light_2.9.7-1_amd64.deb
	http://launchpad.net/\~regolith-linux/+archive/ubuntu/release/+files/i3xrocks-app-launcher_3.6.4-1_amd64.deb
	https://launchpad.net/~regolith-linux/+archive/ubuntu/release/+files/regolith-look-midnight_2.9.7-1_amd64.deb)


sha256sums=(6e8c3d2dbe8c192c40593c85c9c5f2f6fb29ea376e72770461b41b867a2dd996
            bc90c3f172fbff7b570a0bac516b9c76f7ed4cf3ca2a09003ff6c966fc03193d
	    afab55c89c58210ce24bc0416cb1cf474deb446010b209df623c29d1bdc481fb
            ed7b5e923a706ff10f94944ce568a49d05c0917b1ffb841ff531ed656fc2c0e6
            362458ae72f749e8c42185b736500a7947f2580288a28ce8743230462c4e9e51
            bcad5c52397bf04ad4320be5e62ccaad5b7e139f9fe86148a70d77dcf12c152f
            19c063c5f92bf07b7aadc28d814bbd2578c707df51071b70f73c8e4b5043a9e3
            ef699b935b2d919f3f2b8dc6cd78da8fdcac80463f48a0af11029b8b282986ee
            4f32552584a21c01397c6ebe397b9903b31d2c26f7d7ac90489b84134f6bbb12
            f7129b41e733a2572375b5b8a6675001c533de5d4170826ac894e03438db06e5
            c6fbd5e44dabecb72ab297d697f7aa78ef547a85fc7ff43d40298fab1f7e61f6
            1ae8f4051cb6e8256d146dcd8f4140188e850a5ca6e76ba8ba36db168ee1eb9d
            b5cbb54801fcb621a5481c4ecc48c1fb468908336ba8d1942f4e18ec123c923c
            35e10cf26fb83c2dec1c3394c8084f07617af20b594f1fb3ffc5fd40b5d3e689
            12a99b6d9e87710e8321ebf5fe1dfa0c9db21d82ba6e50574eb3137efbf7256d
            51de4f03eeac9de7c07391d53bb1f703eb57432352eb9971212bd79afeab8e93
            dc605ad61d8657dd87c16b538ede4c011d00ceb9be53a96559aa181e2c302b68
            4bc7b0f3380d2dfc502d67c5a7083aa2c82d4d43a8c9efaebff847b533e66939
            32a5fcc332967f54e973a2ac8fcb17f7b2f91bffb0bf347694dc49560e3c2bc0
            05c66c372d378d2992ec59be553bd7de1cf0574d61313d84274f1e64bfe23d3b
            eea3b0004671455426336e21aa285dadb2d891d1d4917f2b3ebcbcc391fe6864
            04ca38cece64a64774744325194e1b2c040a700d01439b7feb1f04eec28d82cb
            f9fabeb0442eb849a8e95163c20fbf9b40f288af0812583b270120e4d8092608
            bda06402859032215fff3b499a4d7034e3933be6eafa8473d1bb8c78aea85549
            a627f086ccc09ef3d96766cad8d422685785deb5e36792eaca743139fba332f3
            f7af2e26790998191cdea97ba492c8f8152006a3099559a55064686f55bdd162
            3a4f894fcb77e76a61220f4ea5397b9ebe8d0778b9ec07b90e5a1696fbdcece4
            82050c4f1a95faeb4fd34eada50028f855527ffeda4277a7563a050e81f5cd02
            f8d8497b096f759797cb51c47adef958a6245e6608126db1e840097e2b3afdf5
            3a2c34cf6c4ccf9c205185286c45a61619a897fd7b5ad0dc6b48a16a66842231
            366710eca08bc30da80759b29be8fbc6762fbed1ff9eb14862e60143b45ae3f5
            e9877b4c5c0013a1b2dfd0c4375fbe79461c01fb5246b19236b81ab6362d4f20
            e8c503b6adc0d299146d51fee5978c354d7bd4707de3697ef58ffc37516d25a2
            a4255f30cedd4223c256e84b09b613a4965ac7b6b8086c93e67b8a5c44077d13
            15d54bd84de2d242517d4946afa1bd44163235eae0fe02873d6ffae1fba2450d
            f77df0ec461417447a443b16acc57cbe41e30464c0fa6383c95ca1d804bed1b2
            277baa72cfef413f9341d8706f764ec04023c827d5c86d7b4b92af56cf120fc4
            e0b15bc5ca4ed9b85dd47bf34622875cfc811d8e9e67adbf864b56e41a85205e
            c33e493cfac187e129650ed8879ed742dcf53ae709f3ba3765496f2ac76d8d3e
            24cacb6b41cb5adec5e31f05e7387379261479c438501dd195ac742be1ffb0c6
            9a2e85ee62e51413263be7f90cf781fe2a86f9ce7f7c19565c033cf5ae72a038
            122b15438765be36fdd50fd53cd69bc5f873a97c1357d09f9c77fa824b94c6da
            5ef87bae9ba8c84b56a595858b0de84954bd07548275a0c86e57bfecdbea0737
            1edb890270688a337bdf6243dd1216a282210ab9a35b67cf91a4610b0df8cb85
            900c285972a9969b4d2d8bcd67dabccb817a2a77a102251d5dc1b2e254f095c8
            24b0501147a6c6e706b1e51b073df17c288cf45f875262bddd2f37d58e6cea7e
            dab3cfb66be6e312e177ac794dbcc42628216c76d0efbffb4699fd50395f6226
            7be92e96f74cb0ec7e97c6c38861c6e9417636c9cb9bacb77f6aea8bd5eb3cb4
	    e58c01ccee273f5567a33509b74766eb5a5572284d7cbb32b7017ac7986f90eb
	    ae1b03ac0d10e6f5de8ac40670caf3204f2f38f2a3a3a3d29182a2fd5740edce
	    63082efb191f31c3bc4be28f7118aa38e53b0d18b4366cbdc275a628b36876ce
	    'SKIP'
	    528e231adb021eba916a2d9a82c5f4937f1103027d0588941d577112a1163161
	    5c4752152bdfbf2936d0f5affd96b8be8a0e2ca341f2393737fa03f6261f7ead
	    3aba80c709377e53c4beabc0e14cb274cc96e57e2fbf6e1e467e834f0033cf05
	    4311b12f301b27bf24aaafa49528d251144c2a1071f999c1dae1341aa66b3c1a)




PKGEXT=".pkg.tar"


# extracts a debian package
# $1: deb file to extract
extract_deb() {
    local tmpdir="$(basename "${1%.deb}")"
    rm -Rf "$tmpdir"
    mkdir "$tmpdir"
    cd "$tmpdir"
    ar x "$1"
    tar -C "${pkgdir}" -xf data.tar.xz
}
# move ubuntu specific /usr/lib/x86_64-linux-gnu to /usr/lib
# $1: debian package library dir (from x86_64 or i386)
# $2: arch package library dir (goes to usr/lib or usr/lib32)
move_libdir() {
    local deb_libdir="$1"
    local arch_libdir="$2"

    if [ -d "${pkgdir}/${deb_libdir}" ]; then
        if [ ! -d "${pkgdir}/${arch_libdir}" ]; then
            mkdir -p "${pkgdir}/${arch_libdir}"
        fi
        mv -t "${pkgdir}/${arch_libdir}/" "${pkgdir}/${deb_libdir}"/*
        find ${pkgdir} -type d -empty -delete
    fi
}
# move copyright file to proper place and remove debian changelog
move_copyright() {
    find ${pkgdir}/usr/share/doc -name "changelog.Debian.gz" -delete
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    find ${pkgdir}/usr/share/doc -name "copyright" -exec mv {} ${pkgdir}/usr/share/licenses/${pkgname} \;
    find ${pkgdir}/usr/share/doc -type d -empty -delete
}

package_regolith-i3 () {
    pkgdesc="Regolith's i3-gaps-based DE's underpinnings and gnome foundational dependencies"
    license=('MIT')
    arch=('x86_64')
    depends=('i3-gaps' 'i3status' 'xorg-server-common' 'xorg-server-devel' 'xcb-util-keysyms'  'xcb-util-wm'  'libev'  
             'yajl'  'startup-notification'  'pango'  'perl' 'xorg-server'
             'xcb-util-xrm'  'libxkbcommon-x11' 'python-i3ipc' 'gnome-flashback' 
             'accountsservice' 'cups-pk-helper' 'libgtop' 'gnome-control-center' 'gnome-desktop' 
	     'xorg-xwininfo' 'dbus' 'python-gobject' 'python-dbus' 'xorg-xprop' 'libev' 'pcre'
	     'libconfig' 'xcb-util-image' 'xcb-util-renderutil' 'libsigc++' 'gnome-session'
             'gnome-settings-daemon' 'playerctl')
    optdepends=('picom: For compositing/desktop effects - strongly recommended!'
		'unclutter-xfixes-git: For unclutter'
		'lightdm: Display Manager - Regolith LightDM theme included in regolith-desktop-config' )
    provides=('xrescat' 'regolith-gnome-flashback')
    conflicts=()
    groups=('regolith-de')

    extract_deb "${srcdir}"/regolith-gnome-flashback_2.6.2-1_amd64.deb
    extract_deb "${srcdir}"/xrescat_1.2.1-1_amd64.deb
    
    # extra command
    patch "${pkgdir}"/usr/bin/regolith-session -i "${srcdir}"/flashback.patch

    move_copyright
}

package_i3-snapshot () {
    pkdesc="Save and restore window and workspace layout within an i3wm instance. Alternative to i3-save-tree from Regolith Linux"
    license=('BSD-3-Clause')
    arch=('x86_64')
    depends=('i3-wm' 'jsoncpp' 'libsigc++')
    provides=('i3-snapshot')
    groups=('regolith-de')

    extract_deb "${srcdir}"/i3-snapshot_1.0.1-2hirsute_amd64.deb

    move_copyright
}

package_regolith-i3xrocks () {
    pkgdesc="Regolith's i3xrocks with associated widgets and config files"
    license=('GPLv3')
    arch=('x86_64')
    depends=('glibc' 'accountsservice' 'alsa-utils' 'bc' 'ttf-font-awesome')
    conflicts=('i3xrocks')
    provides=('i3xrocks')
    groups=('regolith-de')

    extract_deb "${srcdir}"/i3xrocks_1.3.5-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-app-launcher_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-battery_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-cpu-usage_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-focused-window-name_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-info_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-key-indicator_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-media-player_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-memory_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-net-traffic_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-nm-vpn_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-openvpn_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-temp_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-time_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-volume_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-weather_3.6.4-1_amd64.deb
    extract_deb "${srcdir}"/i3xrocks-wifi_3.6.4-1_amd64.deb

    move_copyright

}


package_regolith-styles () {
    pkgdesc="Regolith's themes for i3, gdm, gtk, rofi, plymouth, etc."
    license=('custom: GPLv3')
    depends=("regolith-i3" "gtk3" "ttf-jetbrains-mono" "ttf-ubuntu-font-family")
    conflicts=("paper-icon-theme" "nordic-theme-git" "gtk-theme-solarc-git" "gtk-theme-plano" "gtk-theme-plano-git")
    provides=("paper-icon-theme" "regolith-styles" "regolith-look" "gtk-theme-solarc" "gtk-theme-plano")
    groups=('regolith-de')

    extract_deb "${srcdir}"/ayu-theme_0.2.2-1_amd64.deb
    extract_deb "${srcdir}"/cahuella_1.0.3-1_amd64.deb
    extract_deb "${srcdir}"/nordic_1.6.5-1ubuntu1ppa1_all.deb
    extract_deb "${srcdir}"/paper-icon-theme_1.5.723-201905252133~daily~ubuntu19.04.1_all.deb
    extract_deb "${srcdir}"/plano-theme_3.36-1-1regolith1_all.deb
    extract_deb "${srcdir}"/plymouth-theme-regolith_1.0.3-1_all.deb
    extract_deb "${srcdir}"/regolith-gdm3-theme_2.0.0-1ubuntu1~ppa1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-ayu_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-ayu-dark_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-ayu-mirage_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-cahuella_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-dracula_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-gruvbox_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-lascaille_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-nord_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-pop-os_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-solarized-dark_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-ubuntu_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-styles_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/solarc-theme_800c997-2_amd64.deb
    extract_deb "${srcdir}"/midnight-gtk-theme_1.1.0-1_all.deb
    extract_deb "${srcdir}"/regolith-look-solarized-light_2.9.7-1_amd64.deb
    extract_deb "${srcdir}"/regolith-look-midnight_2.9.7-1_amd64.deb
    move_copyright
    cp "${pkgdir}"/etc/regolith/styles/ayu/typeface "${pkgdir}"/etc/regolith/styles/lascaille/typeface
    cp "${pkgdir}"/etc/regolith/styles/ayu/typeface "${pkgdir}"/etc/regolith/styles/cahuella/typeface
}

package_regolith-desktop-config () {
    pkgdesc="Regolith DE's desktop settings and configuration files, for rofi, i3, lightdm, i3xrocks, etc. plus ubiquity-slideshow-regolith"
    license=('Custom')
    provides=('regolith-ftue' 'regolith-rofication')
    depends=('rofi' 'adobe-source-code-pro-fonts')
    optdepends=('lightdm: For the Regolith LightDM customization' 
		'regolith-i3xrocks: For i3xrocks (i3blocks) support'
	        'i3-gaps: For i3-gaps config support'
		'picom: For compositing configuration')
    groups=('regolith-de')

    extract_deb "${srcdir}"/regolith-compositor-picom-glx_1.1.3-1_amd64.deb
    extract_deb "${srcdir}"/regolith-default-settings_1.0.8-1hirsute_amd64.deb
    extract_deb "${srcdir}"/regolith-desktop-complete_2.124-1hirsute_amd64.deb
    extract_deb "${srcdir}"/regolith-ftue_1.1.2-1_amd64.deb
    extract_deb "${srcdir}"/regolith-lightdm-config_1.1.1-1_amd64.deb
    extract_deb "${srcdir}"/regolith-i3-gaps-config_2.8.6-1_amd64.deb
    extract_deb "${srcdir}"/regolith-rofi-config_1.3.1-1_amd64.deb
    extract_deb "${srcdir}"/regolith-system_1.5.3-1_amd64.deb
    extract_deb "${srcdir}"/ubiquity-slideshow-regolith_168.6-regolith1_all.deb
    extract_deb "${srcdir}"/regolith-i3xrocks-config_3.6.4-1_amd64.deb

    move_copyright
## extra commands
#    rm "${pkgdir}"/usr/share/backgrounds/lucas-bellator-C0OD8OM-oM0-unsplash.jpg
#    rm "${pkgdir}"/usr/share/applications/reboot.desktop
#    rm "${pkgdir}"/usr/share/applications/logout.desktop
#    rm "${pkgdir}"/usr/share/applications/shutdown.desktop
    sed -i 's/x-terminal-emulator/st/g' "${pkgdir}"/etc/regolith/i3/config
    cd "${srcdir}"/regolith-rofication
    python setup.py build
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "${srcdir}"/regolith-rofication/80_rofication "${pkgdir}"/etc/regolith/i3xrocks/conf.d/
}


package_regolith-st () {
    pkgdesc="Regolith's fork of st - the simple terminal"
    license=("MIT")
    provides=('st')
    conflicts=('st')
    groups=('regolith-de')

	extract_deb "${srcdir}"/regolith-st_0.8.2-1ubuntu20ppa5_amd64.deb
}
