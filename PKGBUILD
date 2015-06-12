# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=unstickpixels
pkgver=1
pkgrel=1
pkgdesc='Screen loop to try to unstick stuck pixels'
arch=(any)
url='https://github.com/maandree/unstickpixels'
license=(GPL3)
depends=(python3 coreutils)
makedepends=(texinfo gzip)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(78b2c47f8f4819624c310e5fc790d9a40055e0811d532a0d5db9a22b9c763299)


build() {
    cd "${srcdir}/unstickpixels-${pkgver}"
    make
}

package() {
    cd "${srcdir}/unstickpixels-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

