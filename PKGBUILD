# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=disorderfs
pkgver=0.5.1
pkgrel=1
pkgdesc="FUSE filesystem that introduces nondeterminism"
arch=('x86_64')
url="https://reproducible-builds.org/"
license=('GPL3')
depends=('fuse')
makedepends=('asciidoc')
source=("http://httpredir.debian.org/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('334e15cadeecedce5a79715a61acda5adf0f0a8fafc42a8aca26708e3198dd5a')

build() {
  make
}

package() {
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
