# Maintainer: curlpipe <11898833+curlpipe@users.noreply.github.com>
pkgname=ox-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.7
pkgrel=1
pkgdesc="An independent Rust text editor that runs in your terminal!"
arch=(x86_64)
url="https://github.com/curlpipe/ox"
license=("GPLv2")
depends=("ttf-nerd-fonts-symbols-mono")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${url}/releases/download/${pkgver}/${_pkgname}")
sha256sums=("SKIP")

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
