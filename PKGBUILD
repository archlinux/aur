# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-stable-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/lbryio/lbry-app/releases/download/v0.10.0/LBRY_0.10.0_amd64.deb")
sha256sums=('14e113aaa3be9a121104fa9647ae975bdf4f71bbab93d2353a2e953bf97ad01c')

package() {
    tar -xvf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
