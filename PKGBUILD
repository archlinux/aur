# Maintainer: Alberto Oliveira <orkan.aos@gmail.com>
pkgname=spinnaker-spin
pkgver=1.30.0
pkgrel=1
pkgdesc="Spin is a command-line administration tool to manage Spinnaker applications, pipelines and configs"
arch=('x86_64')
url="https://spinnaker.io/docs/guides/spin/"
license=('Apache')
provides=('spin=$pkgver')
source=("https://storage.googleapis.com/spinnaker-artifacts/spin/$pkgver/linux/amd64/spin")
sha256sums=('1745a658a03887d896cd439b7f209ce3255d428998ca34d52be1e8d3565d6b01')

package() {
    install -Dm 755 "$srcdir/spin" "$pkgdir/usr/bin/spin"
}
