# Contributor: Darwin M. Bautista <djclue917@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf-kochi-substitute
pkgver=20030809
pkgrel=5
pkgdesc="High quality Japanese TrueType fonts"
arch=('any')
url="http://sourceforge.jp/projects/efont/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=("http://osdn.dl.sourceforge.jp/efont/5411/kochi-substitute-${pkgver}.tar.bz2")
md5sums=('c4b14e287cf2b1688c649e2274e128b3')
sha1sums=('9c48f3ba33558b4d48e7764b944fcb2f5f941dd8')
sha256sums=('f4d69b24538833bf7e2c4de5e01713b3f1440960a6cc2a5993cb3c68cd23148c')

package() {
  cd "$srcdir/kochi-substitute-$pkgver"
  mkdir -p $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/license.txt
}

