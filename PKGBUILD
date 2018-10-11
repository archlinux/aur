# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=eksctl-bin
pkgver=0.1.6
pkgrel=3
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
arch=('x86_64')
license=('Apache')
url="https://eksctl.io"
depends=('kubectl')
makedepends=()
conflicts=('eksctl')

source=(https://github.com/weaveworks/eksctl/releases/download/$pkgver/eksctl_Linux_amd64.tar.gz)
sha256sums=('dfb5919e8e561446b19ee2008c64c0a07334544667d372cd9efc949d671594ad')

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/bin"
	install -m755 ${pkgname%-bin} "$pkgdir/usr/bin/${pkgname%-bin}"
}
