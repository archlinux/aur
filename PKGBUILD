# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-bin
pkgver=0.21.4
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-app/releases/download/v0.21.4/LBRY_0.21.4.deb')
sha256sums=('9811bdb635c3135a050ff917a42ad4e0ee82a652b616646e519e198e1c42912b')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
