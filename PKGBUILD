#Maintainer: npfeiler<npfeiler ät gmail.com>

pkgname=cppreference-qt
pkgver=20240610
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library, for qt help."
arch=('any')
url="https://en.cppreference.com/w/Cppreference:Archives#Unofficial_Release"
license=('CCPL:cc-by-sa')
source=("https://github.com/PeterFeicht/cppreference-doc/releases/download/v$pkgver/qch-book-$pkgver.tar.xz")
md5sums=('329c1c7fe531df54b6b18ba558f25437')

package() {
    mkdir -p "$pkgdir/usr/share/doc/qt"
    cp "$srcdir"/cppreference-doc-en-cpp.qch "$pkgdir/usr/share/doc/qt"
}
