# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=plugn
pkgver=0.13.0
pkgrel=1
pkgdesc='Hook system that lets users extend your application with plugins'
arch=('x86_64')
url='https://github.com/dokku/plugn'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        'LICENSE')
sha256sums=('093bc8f6ad6f92519c39ee9e2ccb977ab2825a65b3fc8b0116712d3784ae91be'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')

package() {
  install -Dm755 "${pkgname}-amd64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
