# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.8
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
sha256sums=('13ec1725f3eff6f241ffbd128a75b13d9eb9bf358b04901a7e8eb7da16d148b8')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
