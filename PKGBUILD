# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=cppreference-qch
pkgver=20151129
pkgrel=1
pkgdesc="C++ Reference documentation from cppreference.com in Qt Help format"
arch=('any')
url='http://www.cppreference.com'
license=('CC-BY-SA' 'FDL')

source=("http://upload.cppreference.com/mwiki/images/2/2c/qch_book_${pkgver}.tar.gz")
sha1sums=('f0ace7ffca81e7aa79513c8d50700f4609385289')

package() {
    install -d -m755 "$pkgdir/usr/share/doc/qt"
    install -m644 "$srcdir/cppreference-doc-en-cpp.qch" \
                  "$pkgdir/usr/share/doc/qt/"
}
