# This is the reScribe AUR PKGBUILD file.
# For more information, see 'man PKGBUILD'.
# Maintainer: reScribe <rescribe.dev@gmail.com>

pkgname=rescribe-bin
# update version in package.json, not here
pkgver=0.0.16
pkgrel=1
epoch=
pkgdesc="reScribe code search engine. CLI for interacting with reScribe api."
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
install=$pkgname.install
changelog=
source=("https://cli.rescribe.dev/linux.zip")
noextract=()
md5sums=("402401326e2fce9d346b557d3e141a3a")
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin"
  chmod +x rescribe
  mv rescribe "$pkgdir/usr/bin"
  mv nodegit.node "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/home/$USER"

  ./postinstall.sh $pkgdir
}
