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

    scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    baseDir="$scriptDir/../"

	cd "$pkgdir"
	mkdir -p usr/lib/whatnext
	mkdir -p usr/bin
	cp $baseDir/*.sh usr/lib/whatnext/
	cp $baseDir/*.py usr/lib/whatnext/
	cp $baseDir/whatnext usr/lib/whatnext/
	cp $scriptDir/wn-link usr/bin/whatnext
	pwd
    find .
}
