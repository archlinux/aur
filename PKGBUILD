# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=gitmux-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.9
pkgrel=2
pkgdesc="Git in your tmux status bar"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/arl/gitmux"
license=('MIT')
depends=('tmux')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgname}-${pkgver}-386.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('156f98946cc437572576c69f062f287e4d0e5a98855bd47cd6a2f15c9e385107')
sha256sums_i686=('60ad0033546362bd016e6c820637358b07e08aae999e5ec0956311be115767f7')
sha256sums_aarch64=('959111d5de93aecc87cb706cc3729fce93b27b3a31a7bfbc4d9d1bc7bb93391e')

package() {
	cd "${srcdir}"
	
	install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
