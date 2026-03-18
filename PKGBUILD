# Maintainer: ks1686 <ks1686@users.noreply.github.com>
pkgname=gpm-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Track, sync, and reproduce your software environment across Linux, macOS, and WSL2.'
arch=('x86_64' 'aarch64')
url='https://github.com/ks1686/gpm'
license=('MIT')
source_x86_64=("https://github.com/ks1686/gpm/releases/download/v${pkgver}/gpm_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/ks1686/gpm/releases/download/v${pkgver}/gpm_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('519aeb4ece19fdd94043a345bee749f2522942d85f13a96de1b6a807f9d011de')
sha256sums_aarch64=('97afbb593b4b65e1fb1974bca1aeb6ccb44473ef39500fbcb7997316a26858b0')

package() {
  install -Dm755 "./gpm" "${pkgdir}/usr/bin/gpm"
}
