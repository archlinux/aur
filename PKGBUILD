# Maintainer: Timur Kiyivinski <timur@linux.com>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Franklin

pkgname=lbry-app-bin
pkgver=0.35.3
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring' 'gconf')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.35.3/LBRY_0.35.3.deb')
sha256sums=('599239718098c7453f05e0018aa1a45726447f15dae892d2e517a6c3a23d7058')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm775 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/LBRY" "$pkgdir/usr/bin/lbry"
}
