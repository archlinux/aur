# Maintainer: Alex Talker < alextalker at openmailbox dot org >
# pulsemixer-git code by Jeff Parent <jecxjo@sdf.lonestar.org>
pkgname=pulsemixer
pkgver=1.4.0
pkgrel=1
pkgdesc="cli and curses mixer for pulseaudio"
arch=(any)
url="https://github.com/GeorgeFilipkin/$pkgname"
license=('MIT')
depends=('python' 'pulseaudio')
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
source=("https://github.com/GeorgeFilipkin/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('2fcce7fe285b5ece1f3987a7fa848bb9a01d3a5f3a0de71b755d6417416aead2')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -m 755 -d "$pkgdir/usr/bin"
  install -m 755 pulsemixer "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
