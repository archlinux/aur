# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=stegify-bin
pkgver=1.2
pkgrel=2
pkgdesc='Go tool for LSB steganography, capable of hiding any file within an image'
arch=('x86_64')
url="https://github.com/DimitarPetrov/stegify"
license=('MIT')
provides=('stegify')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/stegify_linux_x86-64"
        'LICENSE::https://github.com/DimitarPetrov/stegify/raw/master/LICENSE')
sha256sums=('1537a356963a8748b3d2f873a20781fb621964b825e8769c56eaf79ded14dba1'
            '92e64e90dc5712f5b365728023796dc5521d1c567461a99fb1abf6bbc708a6fb')

package() {
  install -Dm755 "${srcdir}"/stegify* "${pkgdir}/usr/bin/stegify"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: