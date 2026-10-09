# Maintainer: Mars160 <wapollo9@gmail.com>

pkgname=openhuman-core-bin
_upstream_name=openhuman-core
pkgver=0.64.15
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
sha256sums_x86_64=('f86ae0157b4ed28767c580c443e04027b62fe14e6f3260786f44cd265a242587')
sha256sums_aarch64=('eabac98af5f1feb711b4ffd48185aa06a233fa6bbcd1bcd4d733397dace03b9b')

package() {
  install -Dm755 "${srcdir}/${_upstream_name}" "${pkgdir}/usr/bin/${_upstream_name}"
}
