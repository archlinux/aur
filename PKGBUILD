# Maintaine: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=findbrokenpkgs
pkgver=1.1
pkgrel=1
pkgdesc="Broken package identifier for Arch Linux, based on Gentoo's revdep-rebuild"
arch=('any')
url="http://bbs.archlinux.org/viewtopic.php?id=13882"
license=('GPL')
depends=('binutils' 'pacman')
source=($pkgname-$pkgver.sh)
md5sums=('ee683c467e4881736ed60a15ebbcc7a5')

package() {
  install -Dm755 $pkgname-$pkgver.sh "${pkgdir}"/usr/bin/$pkgname
}
