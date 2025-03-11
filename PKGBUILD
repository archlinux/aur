# Maintainer Jocelyn Thode <kleinerman[at]gmail.com>

_bin=kubectl-view_secret
pkgname=kubectl-view-secret-bin
pkgver=0.13.0
pkgrel=0
pkgdesc="kubectl view-secret plugin"
url="https://github.com/elsesiy/kubectl-view-secret"
depends=('kubectl')
license=('MIT')
arch=('x86_64')
source=("$_bin::$url/releases/download/v$pkgver/${_bin/_/-}_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('859421994b10b0cd2eb8e91cc634dc8db0cdb1fd01e02cd7e4c3700ac47331cf')

package() {
	install -D -m 0755 $srcdir/${_bin/_/-} $pkgdir/usr/bin/$_bin
}

#vim: syntax=sh
