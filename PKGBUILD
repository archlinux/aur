pkgname=nerd-fonts-sarasa-mono
pkgver=2.1.0
pkgrel=3
pkgdesc='Sarasa Mono SC font patched with Nerd fonts.'
url='https://github.com/laishulu/Sarasa-Mono-SC-Nerd'
license=('OFL')
makedepends=('fontconfig')
arch=('any')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de9774741187d154aecad60b0e10ac5d05b72b1c2e4f767d922ec69ac7f0114d')

package() {
	install -d "${pkgdir}/usr/share/fonts/${pkgname}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/Sarasa-Mono-SC-Nerd-${pkgver}/"*.ttf "${pkgdir}/usr/share/fonts/${pkgname}"
	install -Dm644 "${srcdir}/Sarasa-Mono-SC-Nerd-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
