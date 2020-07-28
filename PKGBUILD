# This is the Rescribe AUR PKGBUILD file.
# For more information, see 'man PKGBUILD'.
# Maintainer: Rescribe <rescribe.dev@gmail.com>

pkgname=rescribe
pkgver=0.0.6
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
install="hooks.install"
changelog=
source=("https://cli.rescribe.dev/linux.zip")
noextract=()
md5sums=("8c7735e688fdbacfd8e192a256f7ffad")
validpgpkeys=()

package() {
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cp rescribe "$pkgdir/usr/bin"
  cp nodegit.node "$pkgdir/usr/bin"
}
