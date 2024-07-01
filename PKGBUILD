# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=pqrs-bin
pkgver=0.3.2
pkgrel=1
pkgdesc='Command line tool for inspecting Parquet files'
arch=('x86_64' 'aarch64')
url='https://github.com/manojkarthick/pqrs'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
provides=('pqrs')
conflicts=('pqrs')
source_x86_64=("https://github.com/manojkarthick/pqrs/releases/download/v${pkgver}/pqrs-${pkgver}-x86_64-unknown-linux-gnu.zip")
source_aarch64=("https://github.com/manojkarthick/pqrs/releases/download/v${pkgver}/pqrs-${pkgver}-aarch64-unknown-linux-gnu.zip")
sha256sums_x86_64=('51d471ee098eca5d9f6096a6c4b3324a3a8dd219cc79ae32607c2bb626453b5c')
sha256sums_aarch64=('8706cb0170b377dfb467fd0028f39fdba1aeb3b04ad6f9850b6821bbb2163a47')

package() {
  install -Dm755 "pqrs-${pkgver}-${CARCH}-unknown-linux-gnu/bin/pqrs" "${pkgdir}/usr/bin/pqrs"
}
