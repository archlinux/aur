# Maintainer: Sven Nobis <aur@sven.to>

pkgname=gardenctl-bin
pkgver=v2.8.0
pkgrel=1
pkgdesc='gardenctl is a command-line client for the Gardener (verison 2).'
url='https://github.com/gardener/gardenctl-v2'
license=('Apache-2.0')
arch=('x86_64')
provides=('gardenctl')
source=("gardenctl::https://github.com/gardener/gardenctl-v2/releases/download/${pkgver}/gardenctl_v2_linux_amd64")
sha256sums=('71758cee54dc6f8041cd3a59ea84bffff47c409ddddaad4f0059f86836d31fa8')

package() {
    install -Dm 755 "$srcdir/gardenctl" "$pkgdir/usr/bin/gardenctl"
}
