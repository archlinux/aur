# Maintainer: helix <stargr_at_gmail_dot_com>
# Contributor: gyo <gyo_at_archlinux_dot_fr>
pkgname=repacman2
pkgver=2.0
pkgrel=3
pkgdesc="A tool for producing a pacman package from software's existing installation. Fork of repacman-en tool."
arch=('any')
conflicts=('repacman' 'repacman-en')
license=('GPL')
url="http://archlinux.fr/repacman"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/repacman2/archive/$pkgver.tar.gz")
_scriptname=repacman
sha512sums=('5b4b9ec3dc053329b33b6037dd3e7fe3710528a242e515e7b162bc1de11ccef86df92c5ce79dc3063cf8aacffbbfe78677de44e269067efdf4bb882e5a00a13a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $_scriptname "$pkgdir/usr/bin/$_scriptname"
}
