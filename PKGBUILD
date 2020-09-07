# Maintainer: Jacob Koziej <jacobkoziej@gmail.com>
pkgname=dots
pkgver=0.1.2
pkgrel=1
pkgdesc='A simple tool for managing dotfiles with VCS'
arch=('any')
url='https://git.jacobkoziej.xyz/dotfile-manager/'
license=('GPL3')
depends=('bash')
optdepends=('git: for versioning')
source=("git+${url}#tag=v${pkgver}?signed")
validpgpkeys=('1BF98D10E0D00B41572358364C133A84E6469228')
sha256sums=('SKIP')

package() {
	cd "${srcdir}/dotfile-manager"
	make DESTDIR="${pkgdir}" install
}
