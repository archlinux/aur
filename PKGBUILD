# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=procfile-util
pkgver=0.6.0
pkgrel=1
pkgdesc='A tool for interacting with Procfiles.'
arch=('x86_64')
url='https://github.com/josegonzalez/go-procfile-util'
license=(MIT)

source=("https://github.com/josegonzalez/go-procfile-util/releases/download/v${pkgver}/procfile-util_${pkgver}_linux_x86_64.tgz")
sha256sums=('45a4f91a2888d294ba773a80b032575f0cca430f7200b6a3bd02235f233b2605')

package() {
  install -Dm 755 procfile-util "${pkgdir}/usr/bin/procfile-util"
}
