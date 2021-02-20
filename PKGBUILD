# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ulrik Boll Djurtoft <ullebe1 at gmail dot com>
pkgname=beeracademy
pkgver=2.0.466
pkgrel=2
epoch=
pkgdesc="The official BeerAcademy package for the legacy java version of the gamem"
arch=('any')
url="https://academy.beer/"
license=('Freeware')
depends=('java-runtime<=8')
source=('https://static.academy.beer/old/academy_v2.jar'
        'beeracademy'
        'beeracademy.desktop'
        'beeracademy.png')
noextract=('academy_v2.jar')
md5sums=('3f123726c711cdb751193d1c9cf03023'
         'd3c37726f8b97f27f8b2f86b6284fb82'
         'ed5bdf5c5b7010468b1970eddb74294f'
         'cbbf7238f09e2cfbc3fe5df3cc585cac')

package() {
	cd "${srcdir}"
  install -D -m755 "${srcdir}/beeracademy"         "${pkgdir}/usr/bin/beeracademy"
  install -D -m644 "${srcdir}/beeracademy.desktop" "${pkgdir}/usr/share/applications/beeracademy.desktop"
  install -D -m644 "${srcdir}/beeracademy.png"     "${pkgdir}/usr/share/pixmaps/beeracademy.png"
  install -D -m644 "${srcdir}/academy_v2.jar"     "${pkgdir}/usr/share/java/beeracademy/beeracademy.jar"
}
