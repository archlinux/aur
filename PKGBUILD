# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-bin
pkgver=0.14.0rc2
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm')
source=('https://github.com/lbryio/lbry-app/releases/download/v0.14.0rc2/LBRY_0.14.0-rc2_amd64.deb')
sha256sums=('b41b6c896b5a76d254252ca12ff8874d97fbb1003ea3093334c41e0c30e3653c')

package() {
    tar -xvf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
