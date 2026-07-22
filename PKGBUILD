# Maintainer: Mars160 <wapollo9@gmail.com>

pkgname=openhuman-core-bin
_upstream_name=openhuman-core
pkgver=0.63.0
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
sha256sums_x86_64=('18666671d7986837344bd93d9de5aae1ae7cbd23dd0716fd2ffcf2dd5a032838')
sha256sums_aarch64=('ac74758b044934b787b7b96d97a2c9709f715ea26ab12c4cabba587a75474d00')

package() {
  install -Dm755 "${srcdir}/${_upstream_name}" "${pkgdir}/usr/bin/${_upstream_name}"
}
