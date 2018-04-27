# Maintainer: Josh Hoffer < hoffer dot joshua at gmail dot com > 

pkgname=molecular-workbench
pkgdesc='Modeling tool for designing and conducting computational experiments across science.'
pkgver=3.0.0
pkgrel=3
arch=('any')
url="http://mw.concord.org"
license=(CCPL)
depends=('java-environment' 'bash')
source=("http://mw2.concord.org/public/lib/mw.jar"
	"mw.sh"
	"molecular-workbench.desktop")

md5sums=('1ec169630beb8d8b298c850fd6eb3797'
         '83070b0d60c30a00db87ae7bbf36487a'
         '784c824346606bd1c49b5e504b97a118')

package() {
	cd "$srcdir"
	install -Dm 0644 mw.jar "$pkgdir/usr/share/java/mw/mw.jar"
	install -Dm 0644 mw.sh "$pkgdir/usr/bin/molecular-workbench"
	install -Dm 0644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
#	install -Dm 0644 logo_48x48x32.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

