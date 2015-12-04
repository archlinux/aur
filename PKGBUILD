# Maintainer: nightsense <nightsense at protonmail dot ch>

pkgname=eyeware
pkgver=1.0
pkgrel=1
pkgdesc="'The Lord of the Rings'-based diceware passphrase generator"
arch=('any')
url="https://github.com/nightsense/eyeware"
license=('GPL3')
source=("https://github.com/nightsense/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8731252aede1b5b7fd2baa091a5a02b0fe5b4690fe7273ddd10f0b0a7575627a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 755 eyeware-passphrase-generator "${pkgdir}/usr/bin/eyeware"
    install -D -m 644 eyeware8k "${pkgdir}/usr/share/eyeware/eyeware8k"
}
