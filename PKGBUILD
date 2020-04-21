# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com> 
# Contributor: Marco Steiger <marco (at) steiger (dot) online>
pkgname=buffalo-bin
pkgver=0.16.8
pkgrel=2
pkgdesc='A Go web development eco-system, designed to make your project easier.'
url="https://github.com/gobuffalo/buffalo/"
arch=('x86_64')
license=('MIT')
makedepends=('tar')
conflicts=('buffalo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gobuffalo/buffalo/releases/download/v${pkgver}/buffalo_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('77ade8c844d19d40bdece33366902df1b8c9cdde74632d7062621cc81d1a6094')

package() {
  install -Dm755 "${srcdir}/buffalo" "${pkgdir}/usr/bin/buffalo"
}
