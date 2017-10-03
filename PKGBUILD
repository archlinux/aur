# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=lbry-app-stable-bin
pkgver=0.16.1
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.io/'
license=('MIT')
depends=('nodejs' 'npm' 'gnome-keyring')
source=('https://github.com/lbryio/lbry-app/releases/download/v0.16.1/LBRY_0.16.1_amd64.deb')
sha256sums=('9d68736ed09d253ce414dcdffe1235073ad9a45b37aecd36d6861f457a57f2fb')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
