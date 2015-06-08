# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=mtp-declare
pkgver=20140531
pkgrel=1
pkgdesc="Declare MTP device for automount in one click"
arch=('x86_64' 'i686')
url="https://github.com/NicolasBernaerts/mtp-automount/"
license=('GPL')
depends=('go-mtpfs-git' 'mtpfs' 'zenity' 'sudo')
source=("https://github.com/NicolasBernaerts/mtp-automount/raw/master/$pkgname")
md5sums=("3568b3c9154036798ff41dece8d4736a")

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/local/sbin/$pkgname"
}