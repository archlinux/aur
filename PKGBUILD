# This is the Rescribe AUR PKGBUILD file.
# For more information, see 'man PKGBUILD'.
# Maintainer: Rescribe <rescribe.dev@gmail.com>

pkgname=rescribe
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="code search engine cli"
arch=("x86_64")
url="https://rescribe.dev"
license=("CC-BY-NC-SA-4.0")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=("!strip")
install=
changelog=
source=("https://cli.rescribe.dev/linux.zip")
noextract=("https://cli.rescribe.dev/linux.zip")
md5sums=("8c7735e688fdbacfd8e192a256f7ffad")
validpgpkeys=()

prepare() {
	# do nothing
  :
}

build() {
	# do nothing
  :
}

check() {
	# do nothing
  :
}

package() {
  unzip linux.zip
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cp rescribe "$pkgdir/usr/bin"
  cp nodegit.node "$pkgdir/usr/bin"
}