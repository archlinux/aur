# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=pqrs-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='Command line tool for inspecting Parquet files'
arch=('x86_64' 'aarch64')
url='https://github.com/manojkarthick/pqrs'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('pqrs')
conflicts=('pqrs')
source_x86_64=("https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-${pkgver}-x86_64-unknown-linux-gnu.zip")
source_aarch64=("https://github.com/manojkarthick/pqrs/releases/download/v0.3.1/pqrs-${pkgver}-aarch64-unknown-linux-gnu.zip")
sha256sums_x86_64=('329ed189fecb7e2919f8013db7b746905d0c735abc42048dec3f7695a84f732c')
sha256sums_aarch64=('d1c5c74ebde7b24178de780e00e6d155a599f1fae928f59b19f8c3b158adb7d9')

package() {
  install -Dm755 "pqrs-${pkgver}-${CARCH}-unknown-linux-gnu/bin/pqrs" "${pkgdir}/usr/bin/pqrs"
}
