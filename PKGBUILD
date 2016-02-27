# Maintainer: Alex Talker < alextalker at openmailbox dot org >
# pulsemixer-git code by Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=pulsemixer
pkgver=1.1.0
pkgrel=1
pkgdesc="cli and curses mixer for pulseaudio"
arch=(any)
url="https://github.com/GeorgeFilipkin/$pkgname"
license=('MIT')
depends=('python' 'pulseaudio')
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
source=("https://github.com/GeorgeFilipkin/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7bc9b34c23771eaf947e1be21e805304d65b1e70e8c93ec0db237bb7f0f707ee')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m 755 -d "$pkgdir/usr/bin"
  install -m 755 pulsemixer "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
