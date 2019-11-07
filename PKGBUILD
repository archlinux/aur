# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=procfile-util
pkgver=0.7.0
pkgrel=1
pkgdesc='A tool for interacting with Procfiles.'
arch=('x86_64')
url='https://github.com/josegonzalez/go-procfile-util'
license=(MIT)

source=("https://github.com/josegonzalez/go-procfile-util/releases/download/v${pkgver}/procfile-util_${pkgver}_linux_x86_64.tgz")
sha256sums=('e94e5e062e13f2940245578c97ee2478e189590eef2ab2ff0b0cebac61ea5471')

package() {
  install -Dm 755 procfile-util "${pkgdir}/usr/bin/procfile-util"
}
