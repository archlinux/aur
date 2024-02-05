# Maintainer:

_newpkg='bluez-deprecated-tools'
pkgname='bluez-tools-extra'
pkgver=5.72
pkgrel=2
pkgdesc="metapackage - migrate to $_newpkg"
arch=('any')

depends=(
  "bluez-libs"
)

provides=(
  'bluez-hciconfig'
  'bluez-hcitool'
  'bluez-rfcomm'
  'bluez-utils-compat'
)
conflicts=(
  'bluez-hciconfig'
  'bluez-hcitool'
  'bluez-rfcomm'
  'bluez-utils-compat'
)

package() {
  depends=("$_newpkg")
}
