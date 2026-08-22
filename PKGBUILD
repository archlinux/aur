# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.4.13
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan, Tuic and Juicity protocols"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'loong64')
url="https://github.com/v2rayA/v2rayA"
license=('AGPL3')
provides=('v2raya')
conflicts=('v2raya')
backup=("etc/default/v2raya")

source_i686=(
    "installer_archlinux_x86_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_x86_${pkgver}.pkg.tar.zst"
)
source_x86_64=(
    "installer_archlinux_x64_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_x64_${pkgver}.pkg.tar.zst"
)
source_armv7h=(
    "installer_archlinux_armv7_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_armv7_${pkgver}.pkg.tar.zst"
)
source_aarch64=(
    "installer_archlinux_arm64_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_arm64_${pkgver}.pkg.tar.zst"
)
source_loong64=(
    "installer_archlinux_loongarch64_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_loongarch64_${pkgver}.pkg.tar.zst"
)

sha256sums_i686=('53c77ff812b7316b5613f4ae2231cc0e9648b6f44ed0b3220c896a27823fee09')
sha256sums_x86_64=('3b17dbf656da6404450fe158e2d443216a608f4812e43060d2f8452168360080')
sha256sums_armv7h=('975a87304d7b80f08446570a97f45b54305a0e8fa62960793b07bfbcbaaadaa4')
sha256sums_aarch64=('d079a5e2427fcf02166453540a905e1c9df97c25d029058f83dd5499d9b8e4bc')
sha256sums_loong64=('3cf73b1eb3ca9b3df8d7de08fcce651153b97642f8c6774d0af5b82fcb592276')

package() {
    cp -a "${srcdir}"/etc "${srcdir}"/usr "${pkgdir}"/
}
