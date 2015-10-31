#Maintainer  : mark@markelee.com
#Contributor : mark@markelee.com

pkgname='baseos-squashfs'
url='https://github.com/bluerider/baseOS.git'
pkgdesc='Initcpio hooks for baseOS boot'
pkgver=1
pkgrel=1
arch=('any')
depends=('util-linux')
makedepends=('git')
license=('GPL3')
source=("git+$url")
sha256sums=('SKIP')

package() {
  install -m755 -d "${pkgdir}/usr/lib/initcpio/hooks"
  install -m755 -d "${pkgdir}/usr/lib/initcpio/install"
  install -m644 {"${srcdir}/baseOS/initcpio-hooks","${pkgdir}/usr/lib/initcpio"}/hooks/squashfs
  install -m644 {"${srcdir}/baseOS/initcpio-hooks","${pkgdir}/usr/lib/initcpio"}/install/squashfs
}
