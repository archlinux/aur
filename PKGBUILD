# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=kf5-doc-qch
pkgver=2016.03.18
pkgrel=1
conflicts=('frameworks5-doc-qch')
replaces=('frameworks5-doc-qch')
pkgdesc="Reference for developing with the KDE frameworks in Qt Help format"
arch=('any')
url='http://api.kde.org/'
license=('FDL')
source=("http://api.kde.org/qch/frameworks5-frameworks.qch")
sha1sums=('980266e41424ec6c701c2c5db85d683bf9a38ae9')

package() {
    mkdir -p "$pkgdir/usr/share/doc/qt"
    cp "$srcdir"/frameworks5-frameworks.qch "$pkgdir/usr/share/doc/qt"
}
