# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name='git-prompt.zsh'
pkgname="${_name}"
pkgver=1.0.0
pkgrel=1
pkgdesc='A fast, pure-shell, single-file Git prompt for Zsh.'
arch=('any')
url="https://github.com/woefe/${_name}"
license=('MIT')
source=("https://github.com/woefe/git-prompt.zsh/archive/v${pkgver}.tar.gz")
depends=('git')
sha1sums=('46afe36ac8636b779e31cdcd9ed4f61eca06a58d')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	install -d ${pkgdir}/usr/share/zsh/scripts
	install -m 0644 "${_name}" ${pkgdir}/usr/share/zsh/scripts/
}
