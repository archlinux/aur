pkgname=kf5-doc-qch
pkgver=5.12
pkgrel=1
conflicts=('frameworks5-doc-qch')
replaces=('frameworks5-doc-qch')
pkgdesc="Reference for developing with the KDE frameworks in Qt Help format"
arch=('any')
url='http://api.kde.org/'
license=('FDL')
source=("http://api.kde.org/qch/frameworks5-frameworks.qch")
md5sums=('f8e3757a63f54af3d7cebce08cc8a1a2')

package() {
    mkdir -p "$pkgdir/usr/share/doc/qt"
    cp "$srcdir"/frameworks5-frameworks.qch "$pkgdir/usr/share/doc/qt"
}
