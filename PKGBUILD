# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=signal-back-bin
pkgver=0.1.6
pkgrel=1
epoch=
pkgdesc="Decrypt Signal encrypted backups outside the app"
arch=('x86_64')
url="https://github.com/xeals/signal-back"
license=('Apache')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('signal-back')
conflicts=('signal-back-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/xeals/signal-back/releases/download/v$pkgver/signal-back_linux_amd64")
sha256sums=("86e98bec2d14b135c7497850c58fa79f80be22735095dc47e3a07e76f7e7ddcf")

package() {
	install -D -m555 "./signal-back_linux_amd64" "${pkgdir}/usr/bin/signal-back"
}
