# Maintainer: xeptore
pkgname=gohugo-extended-bin
pkgver=0.115.3
pkgrel=3
pkgdesc="Hugo - The world's fastest framework for building websites (Extended)"
arch=('x86_64' 'aarch64')
url="https://gohugo.io/"
license=('Apache 2.0')
conflicts=('hugo' 'hugo-git' 'hugo-extended-cli' 'hugo-extended-bin' 'gohugo-bin')
provides=("hugo")
source_x86_64=("https://github.com/gohugoio/hugo/releases/download/v0.115.3/hugo_extended_0.115.3_linux-amd64.tar.gz")
source_aarch64=("https://github.com/gohugoio/hugo/releases/download/v0.115.3/hugo_extended_0.115.3_linux-arm64.tar.gz")
md5sums_x86_64=("SKIP")
md5sums_aarch64=("SKIP")

package() {
  cd "${srcdir}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/hugo"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/hugo"
  install -Dm755 "hugo" -t "${pkgdir}/usr/bin"
}
