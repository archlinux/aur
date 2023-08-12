#Maintainer: npfeiler<npfeiler ät gmail.com>

pkgname=cppreference-qt
pkgver=20230810
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library, for qt help."
arch=('any')
url="https://en.cppreference.com/w/Cppreference:Archives#Unofficial_Release"
license=('CCPL:cc-by-sa')
source=("https://github.com/PeterFeicht/cppreference-doc/releases/download/v$pkgver/qch-book-$pkgver.tar.xz")
md5sums=('f85c56ffec6f7a5c86c4a3c2bdba6996')

package() {
    mkdir -p "$pkgdir/usr/share/doc/qt"
    cp "$srcdir"/cppreference-doc-en-cpp.qch "$pkgdir/usr/share/doc/qt"
}
