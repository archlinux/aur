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

	cd "$pkgdir"
	srcDir="../../src/whatnext-master"
	mkdir -p usr/lib/whatnext
	mkdir -p usr/bin
	cp $srcDir/*.sh usr/lib/whatnext/
	cp $srcDir/*.py usr/lib/whatnext/
	cp $srcDir/whatnext usr/lib/whatnext/
	cp $srcDir/wn-link usr/bin/whatnext
}
