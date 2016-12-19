# Maintainer: Elrondo46 directed by ERA Energie Assistance IT Departement <elrond94@hotmail.com>

pkgname=openconcerto-beta
pkgver=1.5b1
pkgrel=2
pkgdesc="ERP ILM Openconcerto beta channel client multi and mono"
arch=('any')
license=('GPL3')
url="https://www.openconcerto.org/"
conflicts=('openconcerto')
depends=('jre7-openjdk' 'jre8-openjdk' 'jre7-openjdk-headless' 'jre8-openjdk-headless')

source=("http://www.openconcerto.org/fr/telechargement/betas/${pkgver}/openconcerto-${pkgver}.deb")
sha256sums=('fc1517fbf3678f1545e08d724fde9e8ecca37e7de72f0b853976c7d800acd086')

package() {
	bsdtar xf data.tar.gz
	chmod -R g-w usr
	mv usr "${pkgdir}"
	chmod -R g-w opt
	mv opt "${pkgdir}"
       } 

