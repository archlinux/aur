# Maintainer: Atnanasis <ys2000pro@gmail.com>
# Contributor: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-nightly-bin
pkgver=1.3.1-dev.17
pkgrel=1
_hash="1.3.1-dev.18"
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
sha256sums_i686=('dc6a523c63e5ec225bfd01ec2ec3483f8ec1ea60b616536fd9bdc7ec4f021434')
sha256sums_x86_64=('d651ade8722fa5e2386e6f2ccbb37ca6e28abea3265a6444ab16267bf6e1c4d5')


package(){
 install -Dm755 $srcdir/micro-${_hash}/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/micro-${_hash}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
