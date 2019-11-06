# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=dumptorrent
pkgver=1.2
pkgrel=1
pkgdesc="non-interactive text mode program which displays BitTorrent .torrent file information"
url="https://sourceforge.net/projects/dumptorrent/"
license=("GPL-2")
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-1.2.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 dumptorrent ${pkgdir}/usr/bin/dumptorrent
  install -Dm755 scrapec ${pkgdir}/usr/bin/scrapec
}
md5sums=('90c68a0889bd0eae2ed3392bd5e1fb03')
