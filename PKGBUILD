# Maintainer: Mars160 <wapollo9@gmail.com>

pkgname=openhuman-core-bin
_upstream_name=openhuman-core
pkgver=0.61.8
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
sha256sums_x86_64=('838283b6390ba29e54a82771755c768e0c27d680eb26d42a155ec5c3c6bee6ce')
sha256sums_aarch64=('adab51211a6a35e07da2304e9860ec89da13bbd7959ab23d2a6a55fc654f1db7')

package() {
  install -Dm755 "${srcdir}/${_upstream_name}" "${pkgdir}/usr/bin/${_upstream_name}"
}
