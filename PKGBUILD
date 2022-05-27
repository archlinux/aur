# Maintainer: Frolleks <frolleks@hotmail.com>
pkgname=goosemod
pkgver=12.3
pkgrel=1
pkgdesc="A light, secure, and easy to use Discord mod"
arch=('x86_64')
url="https://goosemod.com"
license=('MIT')
depends=('discord')
source=("patch.sh")
sha256sums=('bd6e4592141cd7dcb6ca11c4eda9ab62c551fdf263b28c78c0344d9b664df958')

package() {
	install -Dm755 patch.sh "$pkgdir/patch.sh"
}