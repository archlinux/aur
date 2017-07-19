#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#

pkgname=gnome-shell-frippery
pkgver=3.24.0
pkgrel=1
pkgdesc="An unofficial extension pack providing GNOME2 like features for GNOME3."
arch=('any')
url="http://frippery.org/extensions/index.html"
license=('GPL2')
depends=('gnome-shell>=3.24' 'gnome-shell<3.25')
source=(http://frippery.org/extensions/$pkgname-$pkgver.tgz)
sha256sums=('2ec4e814949fc9b8c1f7f93b45937aad9004ffaacc0e44b926cd4c00358cfcdb')

package() {
    cd "$srcdir/"

    rm -rf ".local/share/gnome-shell/$pkgname"
    cp -R ".local" "$pkgdir/usr"
}
