# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.15
pkgrel=2
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
b2sums=(5cbee5a6a65824d4f23474b876567546d8138262bd554c960c1793e854e038c871e95e90d72b506dc08ffc33d45254cf3a1d319fe1c01d2bcd0067fefaf76eda)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
