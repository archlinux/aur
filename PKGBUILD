# Maintainer Jocelyn Thode <jocelyn.thode@gmail.com>

_bin=kubectl-view_secret
pkgname=kubectl-view-secret-bin
pkgver=0.9.1
pkgrel=0
pkgdesc="kubectl view-secret plugin"
url="https://github.com/elsesiy/kubectl-view-secret"
depends=('kubectl')
license=('MIT')
arch=('x86_64')
source=("$_bin::$url/releases/download/v$pkgver/${_bin/_/-}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('c4101893fdb0c420622fe1dff7d8322606d01896fc9a57fee54ac512c5bd7d1e')

package() {
	install -D -m 0755 $srcdir/${_bin/_/-} $pkgdir/usr/bin/$_bin
}

#vim: syntax=sh
