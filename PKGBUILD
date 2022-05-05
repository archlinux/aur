# Maintainer Jocelyn Thode <jocelyn.thode@gmail.com>

_binname=crossplane
pkgname=kubectl-crossplane
pkgver=1.7.0
pkgrel=0
pkgdesc="Crossplane kubectl plugin"
url="https://releases.crossplane.io"
depends=('kubectl')
license=('APACHE')
arch=('x86_64')
source=("$_binname::$url/stable/v$pkgver/bin/linux_amd64/crossplane")
sha512sums=('a146104e5bb5e4279d89d798da277e886e4782f02b177a41661491f0fc0573fa5fc7e98ed3a5ac97e298a14d3a7ffcce52060daa8da61131adc1a1f92ead0275')

package() {
	install -D -m 0755 $srcdir/$_binname $pkgdir/usr/bin/$pkgname
}

#vim: syntax=sh
