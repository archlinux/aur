# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-bin
pkgver=0.9.2rc3
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/lbryio/lbry-app/releases/download/v0.9.2rc3/LBRY_0.9.2_amd64.deb")
sha256sums=('52c2dfc49614b43164b6b660e54e5ae26943d427ee44e4f288c6d569f78b2902')

package() {
    tar -xvf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
