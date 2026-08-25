# Maintainer: Derek Enlow <derekenlow@gmail.com>
_pkgname="new-heterodox-mono"
pkgname="otf-${_pkgname}"
pkgver=20240112
pkgrel=1
epoch=
pkgdesc="A monospaced serif programming font."
arch=(any)
_repo="font-${_pkgname}"
url="https://github.com/hckiang/${_repo}"
license=('OFL-1.1')

source=("$pkgname-$pkgver.zip::https://github.com/hckiang/font-${_pkgname}/archive/main.zip")
sha256sums=('63029db695ee6d28eb349fd9e520a87e07107352193b71f71cd3814a3a0e43a7')

package() {
	cd "${srcdir}"
	install -Dm644 "${_repo}-main/NewHeterodoxMono-Book.otf" "${pkgdir}/usr/share/fonts/OTF/NewHeterodoxMono-Book.otf"
	install -Dm644 "${_repo}-main/NewHeterodoxMono-Bold.otf" "${pkgdir}/usr/share/fonts/OTF/NewHeterodoxMono-Bold.otf"
	install -Dm644 "${_repo}-main/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
}
