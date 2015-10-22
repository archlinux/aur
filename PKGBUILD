#Maintainer: Maximilian Stein <theoddbird@posteo.org>
#Contributor: H.Gökhan Sarı <th0th@returnfalse.net>
#Contributor: Ramon Arriaga <ramon.arriaga@gmail.com>

pkgname=gnome-shell-frippery
pkgver=3.18.1
pkgrel=1
pkgdesc="An unofficial extension pack providing GNOME2 like features for GNOME3."
arch=('any')
url="http://intgat.tigress.co.uk/rmy/extensions/index.html"
license=('GPL2')
depends=('gnome-shell')
source=(http://frippery.org/extensions/$pkgname-$pkgver.tgz)
sha256sums=('b892ab6bfd4e727ee40ad5cfd41d4300e905fa948f1ba59f39e121d2c95f852f')

package() {
cd "$srcdir/"
mv ".local" "usr"
rm -rf "usr/share/gnome-shell/$pkgname"
rm -rf ".local"
cp -R "usr/" "$pkgdir/"
}
