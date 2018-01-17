# Maintainer: Jean Carlo Machado <contato@jeancarlomachado.com.br>
pkgname=whatnext
pkgver=0.1
pkgrel=1
arch=('x86_64')
pkgdesc="Control your recurrent activities in a smart way"
url="https://github.com/jeanCarloMachado/whatnext"
source=("https://github.com/jeanCarloMachado/whatnext/archive/master.zip")
md5sums=('84e3948f36312c94b0baf360009f26f6')
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
	pwd
    find .
}
