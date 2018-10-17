# Maintainer: Salamandar <felix@piedallu.me>

pkgname=geotortue-bin
pkgver=3.14.02.19
pkgrel=1
pkgdesc='Programmation LOGO'
arch=('any')
url="http://geotortue.free.fr"
license=('GPLv3')
groups=('math')
depends=(
  'jre8-openjdk'
)
source=(
  'http://geotortue.free.fr/deploy/deb/geotortue-3.14.02.19.deb'
)
sha512sums=(
  'b69a25a031f4aeb09758093e32300dd3beb638c2a6b58e30ef4a97ff303cc53884f0ef9cbcadbc06bec871fba42aaae16472d39df9f79dbd994045147620b3fd'
)

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}
