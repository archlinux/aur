# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=switchbashzsh
pkgver=1.0
pkgrel=1
pkgdesc="Portably switching between Bash/Zsh across BSD/Linux/Cygwin"
arch=(any)
license=('BSD')
url="https://github.com/bourne-again/switchBashZsh"
source=("switchBashZsh-${pkgver}.tar.gz::https://github.com/bourne-again/switchBashZsh/archive/${pkgver}.tar.gz")

provides=(poshinit)
replaces=(poshinit)

package() {
	cd "switchBashZsh-${pkgver}"

	install -Dm755 switchBashZsh "${pkgdir}"/usr/bin/switchBashZsh
	install -Dm644 switchBashZsh.1 "${pkgdir}"/usr/share/man/man1/switchBashZsh.1
}

sha256sums=('d40f28a0d21105cbd864eca182485455038221384b0cb45f049ac5c47434688e')
