# Maintainer: Mars160 <wapollo9@gmail.com>

pkgname=openhuman-core-bin
_upstream_name=openhuman-core
pkgver=0.63.7
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
sha256sums_x86_64=('3281bcb34c07498537d920d3a70bf351e06e97953aff6f82ab6faa1a9a6e6f9e')
sha256sums_aarch64=('22db54839653fcebf2117918499d239185a31fc2babefbdbe78287be99b5ca83')

package() {
  install -Dm755 "${srcdir}/${_upstream_name}" "${pkgdir}/usr/bin/${_upstream_name}"
}
