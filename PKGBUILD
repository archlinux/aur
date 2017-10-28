# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-stable-bin
pkgver=0.17.1
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-app/releases/download/v0.17.1/LBRY_0.17.1_amd64.deb')
sha256sums=('bcec48771075214858b32b488a4946abac2d319a610461cf6b1051f5abb0fc03')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
