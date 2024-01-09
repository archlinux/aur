# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgbase=arteixo-sans
pkgname=('otf-arteixo-sans'
         'ttf-arteixo-sans')
pkgver=1.0
pkgrel=1
pkgdesc='Tipografía corporativa del Concello de Arteixo'
arch=('any')
url='https://arteixo.org/informacion/identidade-corporativa/'
license=('custom:unknown')
source=('https://arteixo.org/logotipos/arteixo-sans.zip')
b2sums=('cdfae0bbf1b30f90960a1411a2c4efc29043d4d03d43613500904fb7b848d2982160ab60fa8e879548acb75b0f45a21fd52ed2aa385b8ec0efe8029c8a1f5a11')

package_otf-arteixo-sans() {
  install -dm755 ${pkgdir}/usr/share/fonts/OTF/
  install -m644 "Arteixo Sans/Arteixo-Sans-Escritorio"/*.otf ${pkgdir}/usr/share/fonts/OTF/
}

package_ttf-arteixo-sans() {
  install -dm755 ${pkgdir}/usr/share/fonts/TTF/
  install -m644 "Arteixo Sans/Arteixo-Sans-Escritorio"/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
