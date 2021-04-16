# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=switchbashzsh
pkgver=1.2
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

sha256sums=('17717be680e81ab7058e7bdbd05e43ce2bb164425f046fec59202074c55d74a7')
