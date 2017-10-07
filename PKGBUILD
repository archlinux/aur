#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgname=gnome-shell-frippery
pkgver=3.26.0
pkgrel=1
pkgdesc="An unofficial extension pack providing GNOME2 like features for GNOME3."
arch=('any')
url="http://frippery.org/extensions/index.html"
license=('GPL2')
depends=('gnome-shell>=3.26' 'gnome-shell<3.27')
source=(http://frippery.org/extensions/$pkgname-$pkgver.tgz)
sha256sums=('0c863ac663901a9905a4df8e479249b5a123acf1560a3ef927e05b64410c20b4')

package() {
    cd "$srcdir/"

    rm -rf ".local/share/gnome-shell/$pkgname"
    cp -R ".local" "$pkgdir/usr"
}
