# Maintainer: Alex Talker < alextalker at openmailbox dot org >
# pulsemixer-git code by Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=pulsemixer
pkgver=1.2.0
pkgrel=1
pkgdesc="cli and curses mixer for pulseaudio"
arch=(any)
url="https://github.com/GeorgeFilipkin/$pkgname"
license=('MIT')
depends=('python' 'pulseaudio')
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
source=("https://github.com/GeorgeFilipkin/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('765901b0ce28720dbe89e635b695a577df475eb5be4f0e8be97ca36c91a14744')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m 755 -d "$pkgdir/usr/bin"
  install -m 755 pulsemixer "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
