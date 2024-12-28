# Maintainer: limuy <limuyang202011@163.com>
pkgsubn=dora-ssr
pkgname=dora-ssr
pkgver=1.6.2
pkgrel=1
pkgdesc="A game engine for rapid development across devices, featuring a built-in Web IDE with intuitive toolchain."
arch=('x86_64')
url="https://github.com/IppClub/Dora-SSR"
license=('MIT')
source=(dora.zip::https://github.com/limuy2022/Dora-SSR/releases/download/1.6.2/dora-ssr-archlinux.zip)
sha256sums=('66c57b9d7a7e88d08f798be3cc57eda3521d56ab040849c31784513764dc9b34')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/dora-ssr/"* "${pkgdir}/opt/${pkgname}"

    # Launcher
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/dora-ssr/launcher" "${pkgdir}/usr/bin/dora-ssr"
}
