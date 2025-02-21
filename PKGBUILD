#Maintainer: npfeiler<npfeiler ät gmail.com>

pkgname=cppreference-qt
pkgver=20250209
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library, for qt help."
arch=('any')
url="https://en.cppreference.com/w/Cppreference:Archives#Unofficial_Release"
license=('CCPL:cc-by-sa')
source=("https://github.com/PeterFeicht/cppreference-doc/releases/download/v$pkgver/qch-book-$pkgver.tar.xz")
md5sums=('f9f6f17fa3ca76fc6c97c756f73429dc')

package() {
    mkdir -p "$pkgdir/usr/share/doc/qt"
    cp "$srcdir"/cppreference-doc-en-cpp.qch "$pkgdir/usr/share/doc/qt"
}
