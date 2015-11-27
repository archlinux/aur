# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=alarm
pkgver=1.1
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://github.com/maandree/alarm"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc)
makedepends=(make coreutils gcc glibc)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(d02c9584a242cac33b9009f9e4f2ff0a49020e64e6f8946a0fd3ec7444fb632b)

build() {
    cd "${srcdir}/alarm-${pkgver}"
    make DESTDIR="${pkgdir}"
}

package() {
    cd "${srcdir}/alarm-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
