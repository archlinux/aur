# Maintainer Jocelyn Thode <jocelyn.thode@gmail.com>

_binname=crank
pkgname=kubectl-crossplane-bin
pkgver=1.8.0
pkgrel=0
pkgdesc="Crossplane kubectl plugin"
url="https://releases.crossplane.io"
depends=('kubectl')
license=('APACHE')
arch=('x86_64')
source=("$_binname::$url/stable/v$pkgver/bin/linux_amd64/$_binname")
sha256sums=('eb9b26a223681d36108866519aaf18c1b89337e291f76f854dfca9a94ae6931e')

package() {
	install -D -m 0755 $srcdir/$_binname $pkgdir/usr/bin/kubectl-crossplane
}

#vim: syntax=sh
