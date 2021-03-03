# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64')
url="https://github.com/bdd/runitor"
license=('0BSD')
source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-amd64")
sha512sums=('67dafcb0bbf229ea6a5a04315f7338062a84f36ba197c18a04198a2a28500b751fa9948f2b1c0cb37d49b3c08fbe2d69e3deccb2ae8ecccdde046d1cd95181d2')

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-amd64 $pkgdir/usr/bin/runitor
}
