# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.11
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
sha256sums=(c477975d73dff97a0ffc4045813a7089a268aca82b394cafa3ed9d46df308349)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
