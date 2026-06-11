# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-bin
pkgver=0.6.10
pkgrel=1
pkgdesc="Supervise multiple coding agents in one terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/ogulcancelik/herdr"
license=('AGPL-3.0-or-later')
provides=("herdr=${pkgver}")
conflicts=('herdr')
source_x86_64=("herdr-${pkgver}-x86_64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-x86_64")
source_aarch64=("herdr-${pkgver}-aarch64::https://github.com/ogulcancelik/herdr/releases/download/v${pkgver}/herdr-linux-aarch64")
sha256sums_x86_64=('78d298d5a1ef076b4607e8e3c92d98f5de9f0cb30daf31aa910a1a6e9abb4fa1')
sha256sums_aarch64=('b3144a41df364f0541bbbdfe840fa61dbd67daf6e313ee317fe495d2ccf4927a')

package() {
    install -Dm755 "herdr-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/herdr"
}
