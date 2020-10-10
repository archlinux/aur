# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=switchbashzsh
pkgver=1.1
pkgrel=1
pkgdesc="Portably switch between Bash and Zsh across BSD/Linux/Cygwin"
arch=(any)
license=('BSD')
url="https://github.com/bourne-again/switchBashZsh"
source=("switchBashZsh-${pkgver}.tar.gz::https://github.com/bourne-again/switchBashZsh/archive/${pkgver}.tar.gz")

package() {
	cd "switchBashZsh-${pkgver}"

	install -Dm755 switchBashZsh "${pkgdir}"/usr/bin/switchBashZsh
	install -Dm644 switchBashZsh.1 "${pkgdir}"/usr/share/man/man1/switchBashZsh.1
}

sha256sums=('f8b6fed89627eec3a214b88c5cbd0a5befbf413c186341488995756706dc5f81')
