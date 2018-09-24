# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='vpp-plugins'
pkgname="${_pkgname}-bin"
pkgver=18.07.1
pkgrel=1
pkgdesc="FD.io Vector Packet Processing - Plugins"
arch=('x86_64')
url="https://fd.io/"
license=('Apache')
provides=("${_pkgname}")
source=("https://packagecloud.io/fdio/release/packages/ubuntu/bionic/${_pkgname}_${pkgver}-release_amd64.deb/download.deb")
noextract=("download.deb")
sha256sums=('55eea27571abd8ec4ab5ab16f80b7556ca5821707774ceb6e800082656266180')

package() {
    bsdtar -O -xf download.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
