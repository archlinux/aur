# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.13
pkgrel=1
pkgdesc='CLI tool to generate terraform files from existing infrastructure (reverse Terraform)'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/googlecloudplatform/$_pkgname"
license=('Apache')
depends=('terraform')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname-all-$_goos-$_goarch")
sha256sums=(2c6465268335947083c4ef95be6db03b32295c4dae9dda3c4abb2540d4cdb541)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
