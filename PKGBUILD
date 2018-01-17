# Maintainer: Jean Carlo Machado <contato@jeancarlomachado.com.br>
pkgname=whatnext
pkgver=1.0
pkgrel=1
arch=('x86_64')
pkgdesc="Control your recurrent activities in a smart way"
url="https://github.com/jeanCarloMachado/whatnext"
source=("https://github.com/jeanCarloMachado/whatnext/archive/1.0.zip")
md5sums=('36e196fce5cdf72eaa607a145d155ea7')
license=('MIT')
depends=('python' 'jq')

package() {

    srcdir="$(pwd)/whatnext-1.0/"
	cd "$pkgdir"
	mkdir -p usr/lib/whatnext
	mkdir -p usr/bin
	cp "$srcdir"/*.sh usr/lib/whatnext/
	cp "$srcdir"/*.py usr/lib/whatnext/
	cp "$srcdir"/whatnext usr/lib/whatnext/
	cp "$srcdir"/wn-link usr/bin/whatnext
}
