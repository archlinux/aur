# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-dict-naves'
pkgver=3.0
pkgrel=1
pkgdesc="Nave's Topics were originally produced by O.J. Nave while serving as a chaplain in the US Army, and published in the early 1900's. It consists of 20,000+ topics and sub-topics, and 100,000+ references to scripture."
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-dict-naves"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-dict-naves/sword-dict-naves_3.0-1_all.deb")
sha256sums=('244597b26cb8aaad3fffad7081d82174b8a7559c95a1e7722e9f716177ec287f')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr ../pkg/${pkgname}/usr
}
