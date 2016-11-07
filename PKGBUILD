# Maintainer: Atnanasis <ys2000pro@gmail.com>
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20161103
pkgrel=1
_hash="1.1.3-13"
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git" "micro" )
provides=("micro")
source_x86_64=("https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux32.tar.gz")
sha256sums_x86_64=('779b25e22d24d0e7f8df0659ba8bf90da0b6154598aae109235ba7771be14c1a')
sha256sums_i686=('db301886f4058092ca2f3a1ccdb9b97514dce86dff2879628efb5f2d8b0b963b')


package(){
 install -Dm755 $srcdir/micro-${_hash}/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-${_hash}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
