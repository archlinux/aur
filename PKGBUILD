# Maintainer: syst3mctl <support@usectl.com>
pkgname=usectl
pkgver=1.0.4
pkgrel=1
pkgdesc="CLI for the usectl self-hosted deployment platform"
arch=('x86_64' 'aarch64')
url="https://github.com/syst3mctl/usectl-cli"
license=('MIT')
depends=('glibc')
source_x86_64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/usectl_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('acaa2ce5adee7c0bed9b3a7204476bdb7230d6761cad14b36ad502f4320306bc')
sha256sums_aarch64=('54dfcff23d184362563e50a99452cac4da1a82947b6322134eb027cbe4a36339')
package() {
  install -Dm755 usectl "$pkgdir/usr/bin/usectl"
}
