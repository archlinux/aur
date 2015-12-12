# Maintainer: Rémi BERTHO <remi.bertho@openmailbox.org>
# Contributor: Rémi BERTHO <remi.bertho@openmailbox.org>
pkgname=recettescuisine
pkgver=1.1.0
pkgrel=1
pkgdesc="A recipe manager written in java"
arch=(any)
url="http://www.dalan.rd-h.fr/wordpress"
license=('GPL')
depends=('java-runtime')
install="INSTALL"
source=('http://www.dalan.rd-h.fr/binaries/RecettesCuisine/RecettesCuisine.jar'
		'logo.png'
		'recettescuisine.desktop'
		'recettescuisine')
sha256sums=('e1ab02c4669434c97e91716b49dc24a2b7824dfa3750f0554b53d73f17c0cd6e'
			'b22cfa31a19a5027a236b2d968f39378967ee11e309d8405b3784699f64bde7a'
			'e553612b1a2086f79fec4253bfde61c66d6dcebe3bde74c38b43c895b7a7c5c1'
			'1a00beeaaaf5e0aece33f3428c9ea033c5e236a7362ad17016bebb887efe6f8e')

package()
{
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/recettescuisine/"
    mkdir -p "$pkgdir/usr/share/applications/"

    cp recettescuisine "$pkgdir/usr/bin/"
    cp RecettesCuisine.jar "$pkgdir/usr/share/recettescuisine/"
    cp logo.png "$pkgdir/usr/share/recettescuisine/"
    cp recettescuisine.desktop "$pkgdir/usr/share/applications/"
}
