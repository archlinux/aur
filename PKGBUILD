# Maintainer: Atnanasis <ys2000pro@gmail.com>
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20161027
pkgrel=1
_hash="1.1.3-dev.2"
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git" "micro" )
provides=("micro")
source_x86_64=("https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux32.tar.gz")
sha256sums_x86_64=('3962306f50322de843b1cde760fb6402627ae0429cdcf782f4318f70e43bb28e')
sha256sums_i686=('0f90c5bc86207f98a220d7aa122364557ce147a82ad4c65818395800080cbc48')


package(){
 install -Dm755 $srcdir/micro-${_hash}/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-${_hash}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
