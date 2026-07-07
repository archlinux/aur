# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('151d83ce31d78edc7c04e1df69e14d19d1cd4c0e2f0bacdc5bc4870190b2c7b0')
sha256sums_aarch64=('7b4a6eed4de058b683d26a8c9ad0ec0af1de5af14961cd542f7064e2d848808b')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
