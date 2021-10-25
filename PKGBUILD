# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=terraformer-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.18
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
b2sums=(d43d9f4e368a6f048a25e6c418f4c6518d3c347016c16b202089070b35e5a30441bdeea97317ae3ab767b3fd1f58ea5368e03584c90643a184632e5a2d044552)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
