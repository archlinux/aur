# Maintainer: mmoya <mmoya at mmoya dot org>

pkgname=maki-dbdr-bin
pkgver=0.4.12
pkgrel=1
pkgdesc="An efficient AI coding agent extendable by neovim like Lua plugins (dbdr-fork)"
arch=('x86_64')
url="https://github.com/deep-blue-dark-red/maki-dbdr"
license=('MIT')
source=("${url}/releases/download/v${pkgver}-dbdr/maki-v${pkgver}-dbdr-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('d3c74c4206f4147935c8e5aa57fc48064e4afd362235bdd1eb3ebd7ef7bf6d1d')
options=('!debug')
conflicts=('maki-bin')

package() {
    install -Dm755 maki "${pkgdir}/usr/bin/maki"
}
