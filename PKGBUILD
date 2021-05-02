# Maintainer: Mayank Gite
pkgname=socialhub-git
pkgver=1.0
pkgrel=1
pkgdesc="Surfing social-media and shopping online now at your finger tip."
arch=('any')
url="https://gitlab.com/mayankgite/socialhub.git"
license=('MIT')
groups=()
depends=(figlet lolcat electron)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(socialhub)
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
  install -Dm755 "$srcdir"/socialhub/socialhub "$pkgdir"/usr/bin/socialhub
  install -Dm644 "$srcdir"/socialhub/socialhub.desktop "$pkgdir"/usr/share/applications/socialhub.desktop
}
