# Maintainer: Philipp Kühn <p dot kuehn at posteo dot de>
pkgname=python-dictcc
pkgver=1.5
pkgrel=1
pkgdesc="commandline tool for dict.cc"
arch=('any')
url="https://github.com/randomn4me/dictcc/"
license=('ISC')
depends=('python'
         'python-beautifulsoup4'
         'python-tabulate')
source=("dictcc.py")
md5sums=('f5feda49f310d7a7cf8b974fe649c28a')
provides=("python-dictcc=$pkgver-$pkgrel")
source=("https://github.com/randomn4me/${pkgname#python-}/archive/${pkgver}.tar.gz")

package() {
    cd "${pkgname#python-}-${pkgver}"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/dictcc.py" \
        "${pkgdir}/usr/bin/dictcc"

    install -Dm755 "${srcdir}/${pkgname#python-}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
