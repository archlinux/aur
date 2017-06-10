# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-bin
pkgver=0.12.0rc7
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/lbryio/lbry-app/releases/download/v0.12.0rc7/LBRY_0.12.0-rc7_amd64.deb")
sha256sums=('6003c947692feb281b37e183ec10b04a6decbad0cac2c4e1936812fe27a335f6')

package() {
    tar -xvf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
