# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
provides=('nls')
conflicts=('nls')
source_x86_64=("nls-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("nls-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/nls_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cb2b619ef7b47576399370fe57ca8e09a409f8e111451dc52409a26dd43dd375')
sha256sums_aarch64=('0104f68d860592165fa7f6e94a45fe448e754ccdde3f4733d56568f84b4a0ecb')

package() {
  install -Dm755 nls "${pkgdir}/usr/bin/nls"
}
