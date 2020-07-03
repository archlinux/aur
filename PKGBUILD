# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ir-standard-fonts
pkgver=20170121
pkgrel=3
pkgdesc="Iran Supreme Council of Information and Communication Technology (SCICT) standard Persian fonts."
url="https://github.com/molaeiali/ir-standard-fonts"
arch=(any)
license=('unknown')
makedepends=('git')
provides=('ttf-irfonts' "$pkgname")
conflicts=('ttf-irfonts' "$pkgname")
replaces=('ttf-irfonts')
source=("https://github.com/molaeiali/$pkgname/archive/$pkgver.zip")
sha256sums=('SKIP')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 ./*.ttf
}

