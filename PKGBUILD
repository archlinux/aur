# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-bin
pkgver=0.23.1
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.23.1/LBRY_0.23.1.deb')
sha256sums=('e092729421df15e1e1697a413a1d6963de996e496f561501ba66eec91f5546bf')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
