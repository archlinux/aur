# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64')
url="https://github.com/bdd/runitor"
license=('0BSD')
source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-amd64")
sha512sums=('76ef63d2023eef4b0b0fbbe49e607629ca21e9369590ef6576a7a4e7f2e81e9ada1a609501080fa4b0383399eac40b878843e73e02cbd5e6fcb81a008bf24eaf')

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-amd64 $pkgdir/usr/bin/runitor
}
