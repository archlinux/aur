# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=alarm
pkgver=1
pkgrel=1
pkgdesc="Schedule an alarm for a program when starting it"
url="https://github.com/maandree/alarm"
arch=(i686 x86_64)
license=(GPL3)
depends=(glibc)
makedepends=(make coreutils gcc glibc)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(b4af27a5fff94a993f7f751d0bde564b5ba2905aa3abeebcf324231d799f8578)

build() {
    cd "${srcdir}/alarm-${pkgver}"
    make DESTDIR="${pkgdir}"
}

package() {
    cd "${srcdir}/alarm-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
