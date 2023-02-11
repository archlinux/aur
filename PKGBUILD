# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joao Chamine <jchamine@outlook.pt>
pkgname=xnotes-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Simple notepad create in python"
arch=(x86_64 i686)
url="https://JoaoChamine@bitbucket.org/JoaoChamine/xnotes.git"
license=('GPL')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(Xnotes)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	cd "$pkgname"
	sudo cp bin/linux/Xnotes /usr/bin/Xnotes
}
