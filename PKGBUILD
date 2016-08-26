# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=sozi-extras-media
pkgver=16.02
pkgrel=1
pkgdesc="Extras for sozi presentation tool: Inkscape audio/video extensions"
arch=('any')
url="http://sozi.baierouge.fr/"
license=('MPL')
depends=(inkscape)
makedepends=()
source=(https://github.com/senshu/Sozi/releases/download/16.02-fix344/Sozi-extras-media-16.02.141048.zip)
md5sums=('baf541294af52a8f1a9fb2fc97f6c750')

package() {
	cd "$srcdir/"
        mkdir -p $pkgdir/usr/share/inkscape/extensions/
        mv *.inx *.py $pkgdir/usr/share/inkscape/extensions/
}
