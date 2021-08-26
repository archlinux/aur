# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.16
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
b2sums=(f743c10d5ae3b4d5da2ce7c7d1344ffc17a38ac3977ccbee39f36a733fe15bb81097b74b9fc6b4f3aedd02780387c4d80c8a6bc7ad4e11cb261d94bfb9aec5c4)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
