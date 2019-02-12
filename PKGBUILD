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
sha256sums=('3a5cb3a84b78518a4370be7e9550f2978a20fcba390619008e3e4ed86c830f68')

package() { 
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"  
}
# vim:set ts=2 sw=2 et:
