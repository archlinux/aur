pkgname=please
pkgver=2.0.0
pkgrel=3
pkgdesc="A command line utility that makes it easy to integrate web services into your shell scripts"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/stilvoid/please"
license=('GPL-3.0-or-later')
sha256sums_x86_64=('0bb48c1fc5cd6c34527977a7532bcf29fb56950c1ad548326ff1ef379ec4c70a')
sha256sums_aarch64=('3da2512dd07828ae25d8b9d10ca28b1d2321eb5f576f60594f38c0b874605e88')
sha256sums_i686=('8191953ec75b8bb6486c4a31df995d137a7bf7691b2e07bb1779ea2ccb6d3d1b')
source_x86_64=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.zip")
source_aarch64=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.zip")
source_i686=("https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_i386.zip")

package() {
  install -Dm 755 "${srcdir}/please" "${pkgdir}/usr/bin/please"
}
