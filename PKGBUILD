# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=procfile-util
pkgver=0.14.0
pkgrel=2
pkgdesc='A tool for interacting with Procfiles.'
arch=('x86_64')
url='https://github.com/josegonzalez/go-procfile-util'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        'https://raw.githubusercontent.com/dokku/procfile-util/master/LICENSE')
sha256sums=('dcf130080e5719a498091219fd8631258919e6b4a70ff9dffbe9865ae63e7f92'
            '725569065205b55f534d4b040428cef585720756fd953fbdf1a055b6c3349321')

package() {
  install -Dm755 procfile-util-amd64 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
