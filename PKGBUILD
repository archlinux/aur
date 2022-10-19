# Maintainer: Alberto Oliveira <orkan.aos@gmail.com>
pkgname=spinnaker-spin
pkgver=1.29.0
pkgrel=1
pkgdesc="Spin is a command-line administration tool to manage Spinnaker applications, pipelines and configs"
arch=('x86_64')
url="https://spinnaker.io/docs/guides/spin/"
license=('Apache')
provides=('spin=$pkgver')
source=("https://storage.googleapis.com/spinnaker-artifacts/spin/$pkgver/linux/amd64/spin")
sha256sums=('a43015239211710c2f4225c8c3ae2909b80f22851940574e5244ff0dd472249d')

package() {
    install -Dm 755 "$srcdir/spin" "$pkgdir/usr/bin/spin"
}
