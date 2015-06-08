# Maintainer: helix <stargr_at_gmail_dot_com>
# Contributor: gyo <gyo_at_archlinux_dot_fr>
pkgname=repacman2
pkgver=2.0
pkgrel=2
pkgdesc="A tool for producing a pacman package from software's existing installation. Fork of repacman-en tool."
arch=('any')
url="http://archlinux.fr/repacman"
conflicts=('repacman' 'repacman-en')
license=('GPL')
_scriptname=repacman
source=("$pkgname-$pkgver.tar.gz")
md5sums=('c85a479161e96f71fe4fbd7b2cf1968c')

package() {
    mkdir -p $pkgdir/usr/bin/
    install -m755 $_scriptname $pkgdir/usr/bin/
}
