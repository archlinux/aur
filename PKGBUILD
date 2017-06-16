# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-bin
pkgver=0.12.2rc2
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/lbryio/lbry-app/releases/download/v0.12.2rc2/LBRY_0.12.2-rc2_amd64.deb")
sha256sums=('f766a6557c2045b8b22adbf2cf70d1bfa3ee5fc8fbe40239fa19585281ac39d4')

package() {
    tar -xvf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
