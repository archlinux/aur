#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgname=gnome-shell-frippery
pkgver=3.22.0
pkgrel=1
pkgdesc="An unofficial extension pack providing GNOME2 like features for GNOME3."
arch=('any')
url="http://frippery.org/extensions/index.html"
license=('GPL2')
depends=('gnome-shell>=3.20' 'gnome-shell<3.21')
source=(http://frippery.org/extensions/$pkgname-$pkgver.tgz)
sha256sums=('51be0c6e3bfec1d248106a734e3b2a1f28218ebf3febfeb92b7672b416b99dbc')

package() {
    cd "$srcdir/"

    rm -rf ".local/share/gnome-shell/$pkgname"
    cp -R ".local" "$pkgdir/usr"
}
