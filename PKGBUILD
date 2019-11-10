# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=eksctl-bin
_pkgname=${pkgname%-bin}
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
arch=(x86_64)
url='https://eksctl.io'
license=(Apache)
depends=(kubectl)
conflicts=($name)

source=("https://github.com/weaveworks/eksctl/releases/download/$pkgver/${_pkgname}_Linux_amd64.tar.gz")
sha256sums=(422d5d67176d8cf3b9dda7814e2d105529704bf95ef5a98e879481bd384ef354)

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/bin"
	install -m755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
