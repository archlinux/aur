# Maintainer: nightsense <nightsense at protonmail dot ch>

pkgname=pacping
pkgver=1.1
pkgrel=1
pkgdesc="Compare response times of Arch Linux mirrors"
arch=('any')
url="https://github.com/nightsense/pacping"
license=('GPL3')
source=("https://github.com/nightsense/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('58ac29ad913c58e3d2cef39ac18da57f7a424af791fce6c0c07d6a5e15a39287')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m 755 pacping "${pkgdir}/usr/bin/pacping"
}
