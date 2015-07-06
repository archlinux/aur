# Contributor: damir <damir at archlinux dot org>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=yudit
pkgver=2.9.6
pkgrel=1
epoch=
pkgdesc="A free Unicode plain-text editor for Unix-like systems."
arch=('i686' 'x86_64')
url="http://www.yudit.org/"
license=('GPL')
groups=()
depends=('libx11')
makedepends=()
checkdepends=()
optdepends=('hunspell: spell checking')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://yudit.org/download/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('be9ca4253204579c26ac1860cba1220f')
sha1sums=('904f41815a657efe58cb80ccdbc855e4fd926c13')
sha256sums=('ded0b47742fce92aedb6403e8e758162abc73395f9c5a3268ceb2093fbfdf906')
validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

