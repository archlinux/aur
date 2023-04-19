# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=calyxos-flasher
pkgname=$_pkgname-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="A simple way to install CalyxOS on your device (binary release)"
arch=('x86_64')
url="https://gitlab.com/CalyxOS/device-flasher"
license=('Apache2')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("https://release.calyxinstitute.org/device-flasher/$pkgver/device-flasher.linux"
        "$url/-/raw/main/LICENSE")
sha256sums=('530bef93de1af79400db3a46494d20d5848f8b765ba3cf5e814e04c79f8b711b'
            'SKIP')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 device-flasher.linux "$pkgdir/usr/bin/calyxos-flasher"
}
