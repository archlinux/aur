# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=procfile-util
pkgver=0.4.0
pkgrel=1
pkgdesc='A tool for interacting with Procfiles.'
arch=('x86_64')
url='https://github.com/josegonzalez/go-procfile-util'
license=(MIT)

source=("https://github.com/josegonzalez/go-procfile-util/releases/download/v${pkgver}/procfile-util_${pkgver}_linux_x86_64.tgz")
sha256sums=('235334660c29a318d683c4a4dd12a11ac9003d59a25ca401373c4861cb97dc0b')

package() {
  install -Dm 755 procfile-util "${pkgdir}/usr/bin/procfile-util"
}
