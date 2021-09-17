# Maintainer: Rémi BERTHO <remi.bertho@dalan.fr>
# Contributor: Rémi BERTHO <remi.bertho@dalan.fr>
pkgname=recettescuisine
pkgver=1.3.0
pkgrel=1
pkgdesc="A recipe manager written in java"
arch=(any)
url="https://www.dalan.fr"
license=('GPL')
depends=('java-runtime')
install="INSTALL"
source=('https://www.binaries.dalan.fr/RecettesCuisine/RecettesCuisine.jar'
		'logo.png'
		'recettescuisine.desktop'
		'recettescuisine')
sha256sums=('b083b4ed1dfd361c32dc7b2b0747210936f42eb5700fcb6767909b3c5b5beed9'
			'b22cfa31a19a5027a236b2d968f39378967ee11e309d8405b3784699f64bde7a'
			'e553612b1a2086f79fec4253bfde61c66d6dcebe3bde74c38b43c895b7a7c5c1'
			'1a00beeaaaf5e0aece33f3428c9ea033c5e236a7362ad17016bebb887efe6f8e')

package()
{
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/recettescuisine/"
    mkdir -p "$pkgdir/usr/share/applications/"

    cp recettescuisine "$pkgdir/usr/bin/"
    cp RecettesCuisine.jar "$pkgdir/usr/share/recettescuisine/RecettesCuisine.jar"
    cp logo.png "$pkgdir/usr/share/recettescuisine/"
    cp recettescuisine.desktop "$pkgdir/usr/share/applications/"
}
