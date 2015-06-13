# Maintainer: Emil Lundberg <lundberg.emil@gmail.com> (AUR/GitHub: emlun)

pkgname=passqr
pkgver=1.3.2
pkgrel=1
pkgdesc="Generate 2D barcodes from password-store entries"
arch=('any')
url='https://github.com/emlun/passqr'
license=('GPL')
backup=("etc/${pkgname}.conf")
depends=('pass' 'qrencode')
optdepends=(
    'feh: fast image viewer'
    'gpicview: fast image viewer'
    'imagemagick: fast image viewer'
    'nomacs: fast image viewer'
    'qiv: fast image viewer'
    'xv: fast image viewer'
    'gimmage: image viewer'
    'mirage: image viewer'
    'ristretto: image viewer'
    'viewnior: image viewer'
    'fbida: console image viewer'
    'fbv: console image viewer'
    )
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    make install DESTDIR="${pkgdir}"
}
