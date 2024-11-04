# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sheepla
pkgname=fzpac
pkgver=2.0.5
pkgrel=1
pkgdesc="Arch Linux (pacman) package finder with fzf"
arch=('any')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('MIT')

provides=("${pkgname}")
depends=("fzf" "pacman")
optdepends=('bash-completion: completion support for bash'
            'zsh-completions: completion support for zsh'
            "fish: for fish completion support"
            "yay: for AUR helper support"
            "paru: for AUR helper support"
			)

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef2f8cac36ac8270b5f08169865d3998f8cb68ebf5e252623e5be36ad0c92cfe')


package() {
	cd "${pkgname}-${pkgver}"

	PREFIX=${pkgdir}/usr make install
}
