# Maintainer: Mars160 <wapollo9@gmail.com>

pkgname=openhuman-core-bin
_upstream_name=openhuman-core
pkgver=0.57.53
pkgrel=1
pkgdesc='Core binary for OpenHuman'
arch=('x86_64' 'aarch64')
url='https://github.com/tinyhumansai/openhuman'
license=('GPL-3.0-only')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libx11' 'libxtst' 'openssl' 'xdotool')
provides=("${_upstream_name}=${pkgver}")
conflicts=("${_upstream_name}")
options=('!strip' '!debug')
source_x86_64=("${_upstream_name}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_upstream_name}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_upstream_name}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_upstream_name}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e3e4d9d1ba337b06f551cf2c8bf52feeaa3aa4c6f145102333c0ae8bcf586256')
sha256sums_aarch64=('28f5281d8e40b1d652c61e87efdb26606d99259497f48189b23714eaddc05d8f')

package() {
  install -Dm755 "${srcdir}/${_upstream_name}" "${pkgdir}/usr/bin/${_upstream_name}"
}
