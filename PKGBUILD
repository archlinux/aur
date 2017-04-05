# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-stable-bin
pkgver=0.9.1
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm')
source=("https://github.com/lbryio/lbry-app/releases/download/v0.9.1/LBRY_0.9.1_amd64.deb")
sha256sums=('1da4746f7a53fd22bc6d36e79c35cf399487c6b19cd8b2e110973e4f287755cf')

package() {
    tar -xvf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
