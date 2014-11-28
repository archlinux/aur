# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Paul Bredbury <brebs@sent.com>

pkgname=findbrokenpkgs
pkgver=1.1
pkgrel=1
pkgdesc="Broken package identifier for Arch Linux, based on Gentoo's revdep-rebuild."
arch=('i686' 'x86_64')
url="http://bbs.archlinux.org/viewtopic.php?id=13882"
license=('GPL')
depends=('binutils' 'pacman')
source=($pkgname-$pkgver.sh)
md5sums=('ee683c467e4881736ed60a15ebbcc7a5')

build() {
  install -D -m755 "$pkgname-$pkgver.sh" "${pkgdir}/usr/bin/$pkgname" || return 1
}
