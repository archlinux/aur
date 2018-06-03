# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-bin
pkgver=0.21.5
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-app/releases/download/v0.21.5/LBRY_0.21.5.deb')
sha256sums=('afe44295c41d5887b51ae9057c3460a169fea36f885b18717ca5a9bff1c1d9dc')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
