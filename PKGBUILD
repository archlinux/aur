#
# Maintainer: Iacopo Isimbaldi <isiachi@rhye.it>
#
# Contributor: Maximilian Stein <theoddbird@posteo.org>
# Contributor: H.Gökhan Sarı <th0th@returnfalse.net>
# Contributor: Ramon Arriaga <ramon.arriaga@gmail.com>
#

pkgname=gnome-shell-frippery
pkgver=3.18.2
pkgrel=1
pkgdesc="An unofficial extension pack providing GNOME2 like features for GNOME3."
arch=('any')
url="http://frippery.org/extensions/index.html"
license=('GPL2')
depends=('gnome-shell>=3.18' 'gnome-shell<3.19')
source=(http://frippery.org/extensions/$pkgname-$pkgver.tgz)
sha256sums=('e21a7074037beb4931d5e29adba9c8fbfc49bac6dc95c49a022ff9eb00789938')

package() {
    cd "$srcdir/"

    rm -rf ".local/share/gnome-shell/$pkgname"
    cp -R ".local" "$pkgdir/usr"
}
