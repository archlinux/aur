# Maintainer: Atnanasis <ys2000pro@gmail.com>
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=20170803
pkgrel=1
_hash="1.3.1-dev.13"
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
optdepends=(xclip)
conflicts=( "micro-git" "micro" )
provides=("micro")
# Binary tar files from github 
source_x86_64=("https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux64.tar.gz")
source_i686=("https://github.com/zyedidia/micro/releases/download/nightly/micro-${_hash}-linux32.tar.gz")
# Check sums for files downloaded
sha256sums_x86_64=('c791657db072976f7e67aec93c5676526e7b8cf60d7796b3106453096a7a1841')
sha256sums_i686=('a29b15d42191a86a32a40069c773cc8666270d717d2e9178b3e3c0fac702631f')


package(){
 install -Dm755 $srcdir/micro-${_hash}/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-${_hash}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
