# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stegify-bin
pkgver=1.2
pkgrel=1
pkgdesc='Go tool for LSB steganography, capable of hiding any file within an image'
arch=('x86_64')
url="https://github.com/DimitarPetrov/stegify"
license=('MIT')
provides=('stegify')
source=("${url}/releases/download/v1.2/stegify_linux_x86-64")
md5sums=('9dbd74e6f52ed67bad384d57c84033a7')

package() {
  cd "${srcdir}"
  install -Dm755 stegify* "${pkgdir}/usr/bin/stegify"
}
# vim:set ts=2 sw=2 et: