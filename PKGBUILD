# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=orbit-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="A cross-platform task runner for executing commands and generating files from templates"
arch=('x86_64')
url='https://github.com/gulien/orbit'
license=('MIT')
provides=('orbit')
source=("${url}/releases/download/v${pkgver}/orbit_Linux_x86_64.tar.gz")
sha256sums=('bcd0ea0e3cf7858724b5f1863c7e0fc3b04edbd4787497397f1ff8a1a329c663')

package() {
  install -Dm755 "${srcdir}"/orbit "${pkgdir}/usr/bin/orbit"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/orbit/LICENSE"
  install -Dm644 "${srcdir}"/README.md -t "${pkgdir}/usr/share/doc/orbit"
}