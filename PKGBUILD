#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgname=gnome-shell-frippery
pkgver=3.20.0
pkgrel=1
pkgdesc="An unofficial extension pack providing GNOME2 like features for GNOME3."
arch=('any')
url="http://frippery.org/extensions/index.html"
license=('GPL2')
depends=('gnome-shell>=3.20' 'gnome-shell<3.21')
source=(http://frippery.org/extensions/$pkgname-$pkgver.tgz)
sha256sums=('43bec5fbe2b6a2fa1e929dcdd7f742e37aa3c6bb350bb483f9ef8d1d419152a5')

package() {
    cd "$srcdir/"

    rm -rf ".local/share/gnome-shell/$pkgname"
    cp -R ".local" "$pkgdir/usr"
}
