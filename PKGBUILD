# Maintainer: vanillagreen
# Retired. VGS v1 shipped as vgs-shell; v2 ships as vgs-git, and as vgs from 0.1.0.
# This recipe installs nothing: it stops with the name of the package to use.
pkgname=vgs-shell
pkgver=0.5.0
pkgrel=2
pkgdesc='Retired: VGS v1. Install vgs-git instead (vgs from 0.1.0)'
arch=('any')
url='https://github.com/vanillagreencom/vgs'
license=('MIT')

_retired() {
  error 'vgs-shell is retired and installs nothing.'
  plain 'VGS v1 is no longer published. Install vgs-git instead, or vgs once 0.1.0 is released.'
  plain 'If vgs-shell is installed, remove it first: vgs-git conflicts with it.'
  return 1
}

prepare() {
  _retired
}

package() {
  _retired
}
