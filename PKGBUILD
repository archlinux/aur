# Maintainer: Aquib Javed <aquibjavedt007@gmail.com>
pkgname=ice-bin
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="A lightweight CTF utility."
arch=('x86_64' 'i686')
url="https://github.com/tamton-aquib/ice"
license=('MIT')
makedepends=()
options=()
install=
changelog=
source=("ice.zip::https://github.com/tamton-aquib/ice/releases/download/v${pkgver}/ice-x86_64-unknown-linux-gnu.tar.gz")
noextract=()
noextract=()
sha256sums=('SKIP')

package() {
    tar -xzf "${srcdir}/ice-x86_64-unknown-linux-gnu.tar.gz" -C "${srcdir}"
    install -Dm755 "${srcdir}/ice-x86_64-unknown-linux-gnu/ice" "${pkgdir}/usr/bin/ice"
}
