pkgname=nerd-fonts-sarasa-mono
pkgver=2.1.0
pkgrel=1
pkgdesc='Sarasa Mono SC font patched with Nerd fonts.'
url='https://github.com/laishulu/Sarasa-Mono-SC-Nerd'
license=('OFL')
arch=('any')
source=("git+https://github.com/laishulu/Sarasa-Mono-SC-Nerd.git")

package() {
	install -d "${pkgdir}/usr/share/fonts/${pkgname}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/Sarasa-Mono-SC-Nerd/"*.ttf "${pkgdir}/usr/share/fonts/${pkgname}"
	install -Dm644 "${srcdir}/Sarasa-Mono-SC-Nerd/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
sha256sums=('SKIP')
