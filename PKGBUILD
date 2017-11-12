# Maintainer: Frederic Bezies <fredbezies at gmail.com>
# Contributor: goetzc

# Based on PKGBUILD proposed by "thetotalchaos" on october 27, 2017.

pkgname=finetune
pkgver=1.3
pkgrel=1
pkgdesc="Audio tagger, fix song information, cover art, lyrics, remove duplicate and missing tracks from your library".
arch=('x86_64')
url="http://flavio.tordini.org/finetune"
license=('custom')
depends=('taglib' 'qt5-base')
source=("${pkgname}-${pkgver}.deb::http://flavio.tordini.org/files/${pkgname}/${pkgname}.deb")
sha256sums=('f7a414b33113873a5ff38127092b63e714401c43d5089fb69b495328100b947e')

package() {
tar -Jxvf data.tar.xz -C "${pkgdir}"

install -Dm644 "${pkgdir}"/usr/share/doc/finetune/copyright \
"${pkgdir}"/usr/share/licenses/${pkgname}/copyright
} 
