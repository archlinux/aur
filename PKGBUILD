# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=gnusound
pkgver=0.7.5
pkgrel=2
pkgdesc="A multitrack sound editor for GNOME 1 and 2"
arch=('i686')
url="http://www.gnu.org/software/gnusound/"
license=('GPL')
depends=('libsamplerate' 'audiofile' 'libgnomeui' 'jack-audio-connection-kit' 'lame')
options=('!makeflags')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('9f7515d9a68a54ac6b60ab78dfa72d80')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install
}
