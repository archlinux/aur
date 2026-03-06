# Maintainer: artist for XLibre <artist4xlibre@proton.me>

_pkgname1=kwin-x11
_pkgname2=sonic-win
pkgname="${_pkgname2}-bin"
pkgver=6.6.2
pkgrel=2
pkgdesc="kwin-x11 with ports from kwin-wayland, bug fixes, and maybe other improvements, for XLibre"
arch=(x86_64)
url="https://github.com/Sonic-DE/${_pkgname2}"
license=('GPL-2.0-or-later')
options=(!strip)
source=("https://x11libre.net/repo/arch_based/x86_64/${_pkgname2}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname1}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=(aurorae
         breeze
         gcc-libs
         glibc
         plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdeclarative
         kdecoration
         kglobalaccel
         kglobalacceld
         kguiaddons
         ki18n
         kirigami
         kitemmodels
         knewstuff
         knotifications
         kpackage
         kquickcharts
         kscreenlocker
         kservice
         ksvg
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         lcms2
         libcanberra
         libdisplay-info
         libdrm
         systemd-libs
         libepoxy
         libplasma=$_pkgver
         libqaccessibilityclient-qt6
         libx11
         libxcb
         libxi
         libxkbcommon
         libxkbcommon-x11
         mesa
         plasma-x11-session-sonic
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         qt6-wayland
         wayland
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm)
provides=($_pkgname kwin-x11 "${_pkgname1}-sonic-bin")
conflicts=($_pkgname kwin-x11 "${_pkgname1}-sonic-bin")
replaces=("${_pkgname1}-sonic-bin")

sha256sums=('2a7723e52895abdaab93aebe33044eb29a136dd384de3b538dc41b5cb120b883')

package() {
  tar -xf "${_pkgname1}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

