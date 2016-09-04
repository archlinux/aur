# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20160903
pkgrel=1
_hash="a4ac9f2"
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git" "micro" )
provides=("micro")
source_x86_64=("https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux32.tar.gz")
sha256sums_x86_64=('93d9a195dc0ea603545913464359c07aa88f41bc0f0c8a81d815c00142f5285e')
sha256sums_i686=('3eed03273207bc4829b0c77de80333928e601674979f443dd63b815ce13c237a')


package(){
 install -Dm755 $srcdir/micro-${_hash}/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-${_hash}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
