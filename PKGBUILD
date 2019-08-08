# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=eksctl-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
arch=(x86_64)
url='https://eksctl.io'
license=(Apache)
depends=(kubectl)
conflicts=($name)

source=("https://github.com/weaveworks/eksctl/releases/download/$pkgver/${_pkgname}_Linux_amd64.tar.gz")
sha256sums=(468497bda7e50eb24caf27639cf355671d03e8cb3677f3e6b817588f957004ad)

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/bin"
	install -m755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
