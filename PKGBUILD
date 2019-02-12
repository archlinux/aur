# Maintainer: Brandon Taylor (br dot ta dot 2818 at gmail dot com)
# Contributor: Ivan Semkin (ivan at semkin dot ru)

pkgname=electron-windows95-bin
_pkgname=windows95
pkgver=2.0.0
pkgrel=2
pkgdesc='Windows 95 in Electron. Runs on macOS, Linux, and Windows.'
arch=('x86_64')
url='https://github.com/felixrieseberg/windows95'
license=('MIT')
depends=('electron')
source=("${url}/releases/download/v${pkgver}/windows95-linux-${pkgver}.${arch}.rpm")
sha256sums=('7f83e6361d0606db16e77f7d1592e74a6882df53f2d98b74e0b7db3f9714353e')

package() { 
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"  
}
# vim:set ts=2 sw=2 et:
