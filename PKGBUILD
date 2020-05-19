# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gkill-bin
pkgver=1.0.2
pkgrel=6
pkgdesc='Interactive process killer written in Go'
arch=('i686' 'x86_64')
url='https://github.com/heppu/gkill'
license=('MIT')
source_i686=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/gkill-linux-386"
       'LICENSE::https://raw.githubusercontent.com/heppu/gkill/master/LICENSE')
source_x86_64=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/gkill-linux-amd64"
         'LICENSE::https://raw.githubusercontent.com/heppu/gkill/master/LICENSE')
sha256sums_i686=('09d3104b90cd807478a9dcf1050bf5a1d31101d957eb08076af05f618ed8b2ba'
  '5bf63902d38458d166e5563aaa9957415d3b4f32d66b5126f0c4e72c4b426e49')
sha256sums_x86_64=('c677db2bd9faf723e8d0ed8c7b1a8e013d85b3724c0bd9e387fd71f420c5de88'
  '5bf63902d38458d166e5563aaa9957415d3b4f32d66b5126f0c4e72c4b426e49')

package() {
  install -Dm755 gkill* "${pkgdir}/usr/bin/gkill"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: