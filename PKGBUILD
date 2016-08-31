# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Contributor: blainester <theblainestory@gmail.com>
pkgname=micro
pkgver=1.0.1
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=("micro-git")

source_x86_64=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux32.tar.gz")

sha256sums_x86_64=('1d59797bfb47306b9068e5aec6d1e1c3c8b3e974a05029f4386dd3c6b519a765')
sha256sums_i686=('7c493f72311470b526d03df9bbd980e01b21668318fbee94ed58f2014b7bc0a7')

package(){
 install -Dm755 $srcdir/$pkgname/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
