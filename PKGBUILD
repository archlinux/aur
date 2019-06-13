# Maintainer: Philipp Kühn <p dot kuehn at posteo dot de>
pkgname=python-dictcc
pkgver=1.6
pkgrel=1
pkgdesc="commandline tool for dict.cc"
arch=('any')
url="https://github.com/randomn4me/dictcc/"
license=('ISC')
depends=('python'
         'python-beautifulsoup4'
         'python-tabulate')
source=("dictcc.py")
md5sums=('d8d72b4c1da2b6450e897511e12008b2')
provides=("python-dictcc=$pkgver-$pkgrel")
source=("https://github.com/randomn4me/${pkgname#python-}/archive/${pkgver}.tar.gz")

package() {
    cd "${pkgname#python-}-${pkgver}"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/dictcc.py" \
        "${pkgdir}/usr/bin/dictcc"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
