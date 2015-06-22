# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=glcorearb
pkgver=1
pkgrel=1
pkgdesc="glcorearb Header"
arch=('any')
url="http://www.opengl.org/registry"
license=('custom')

package() {
  wget "http://www.opengl.org/registry/api/GL/glcorearb.h"

  install -m755 -d "${pkgdir}/usr/include/GL"
  install -m644 "glcorearb.h" "${pkgdir}/usr/include/GL/"
}
