# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name='git-prompt.zsh'
pkgname="${_name}"
pkgver=2.0.0
pkgrel=2
pkgdesc='A fast, pure-shell, single-file Git prompt for Zsh.'
arch=('any')
url="https://github.com/woefe/${_name}"
license=('MIT')
source=("https://github.com/woefe/git-prompt.zsh/archive/v${pkgver}.tar.gz")
depends=('git' 'zsh')
sha256sums=('f9761a98761b4329e3c831ab5ccb67a052a160387b5429d6c4c8786ab2670e02')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -d "${pkgdir}/usr/share/zsh/scripts"
	install -m 0644 "${_name}" "${pkgdir}/usr/share/zsh/scripts/"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
