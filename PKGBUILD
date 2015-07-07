#Maintainer: Maximilian Stein <theoddbird@posteo.org>
#Contributor: H.Gökhan Sarı <th0th@returnfalse.net>
#Contributor: Ramon Arriaga <ramon.arriaga@gmail.com>

pkgname=gnome-shell-frippery
pkgver=0.10.2
pkgrel=1
pkgdesc="An unofficial extension pack providing GNOME2 like features for GNOME3."
arch=('any')
url="http://intgat.tigress.co.uk/rmy/extensions/index.html"
license=('GPL2')
depends=('gnome-shell')
source=(http://frippery.org/extensions/$pkgname-$pkgver.tgz)
sha256sums=('26f9f89a1ee02204918280a5d12a955c5b26bdd9f3ea8d3ac081cd4882d61ec6')

package() {
cd "$srcdir/"
mv ".local" "usr"
rm -rf "usr/share/gnome-shell/$pkgname"
rm -rf ".local"
cp -R "usr/" "$pkgdir/"
}
