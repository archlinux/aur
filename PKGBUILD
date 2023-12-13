# Maintainer: tippfehlr <tippfehlr at tippfehlr dot eu>

_pkgname=wrestic
pkgname=wrestic-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='A wrapper around restic built in rust'
arch=('x86_64')
url="https://github.com/alvaro17f/$_pkgname"
license=('LGPL3')
provides=('wrestic')
conflicts=('wrestic')
source=("$url/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('d95bdb3e885fbf7763337f69a80bf99ee8985a7791908c6c789a683400a23d4a')

package() {
	install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
