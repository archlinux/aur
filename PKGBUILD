# Maintainer: Tal <talwat321@gmail.com>
pkgname=pap-bin
pkgver="0.13.3"
pkgrel=1
pkgdesc='a swiss army knife for minecraft servers (pre-compiled)'
url='https://github.com/talwat/pap'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
sha256sums_i686=('e2cc5c689719b01279d468d52154db0f5e7fb1b2f303b0727562f985cdf2ec85')
sha256sums_x86_64=('c9f4e22df843c6a7c6cbb208cdef58e82ce9d990ab6ccbc0c710c4c18eb8afe5')
sha256sums_armv7h=('701eb2dfa85e16becd8ac3f580b0c909bbde36e30aba322aa8baae873fdeb23d')
sha256sums_armv6h=('694ed6fd561ad3b942b33cf4177ac023a7ca76d534f995ea3ad44cfee86af86c')
sha256sums_aarch64=('f174d3368b134cca3135b02e0f35c3dd883bbecd86f2d89abd9a8a56537aa770')

source_x86_64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_amd64")
source_i686=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_386")
source_armv6h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv6")
source_armv7h=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_armv7")
source_aarch64=("https://github.com/talwat/pap/releases/download/v$pkgver/pap_${pkgver}_linux_arm64")

conflicts=('pap')
provides=('pap')
optdepends=('java-runtime: running the downloaded jarfiles')

package() {
  install -Dm755 pap_${pkgver}_linux_* "${pkgdir}"/usr/bin/pap
}
