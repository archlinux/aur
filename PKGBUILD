# Maintainer: Philipp Jonczyk <p dot jonczyk at posteo dot de>
pkgname=python-dictcc
pkgver=1.0
pkgrel=1
pkgdesc="commandline tool for dict.cc"
arch=('any')
url="https://github.com/randomn4me/dictcc/"
license=('ISC')
depends=('python'
         'python-beautifulsoup4')
source=("dictcc.py")
provides=("python-dictcc=$pkgver-$pkgrel")
md5sums=('2382a6d99471b44cbcb9501b9dd17761')
source=("https://github.com/randomn4me/${pkgname#python-}/archive/${pkgver}.tar.gz")

package() {
    cd "${pkgname#python-}-${pkgver}"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/dictcc.py" \
        "${pkgdir}/usr/bin/dictcc"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
