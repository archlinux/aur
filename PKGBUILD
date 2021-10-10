# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=procfile-util
pkgver=0.13.0
pkgrel=1
pkgdesc='A tool for interacting with Procfiles.'
arch=('x86_64')
url='https://github.com/josegonzalez/go-procfile-util'
license=('MIT')

source=("https://github.com/josegonzalez/go-procfile-util/releases/download/v${pkgver}/procfile-util_${pkgver}_linux_amd64.tgz"
        'LICENSE')
sha256sums=('dc5fc16a8fa76e305aa55d98cd9768226c05cd03d2b8d020509c40f770763a99'
            '725569065205b55f534d4b040428cef585720756fd953fbdf1a055b6c3349321')

package() {
  install -Dm 755 procfile-util "${pkgdir}/usr/bin/procfile-util"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/procfile-util/LICENSE"
}
