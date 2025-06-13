# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=microfetch-bin
_pkgname=microfetch
pkgver=0.0.2
pkgrel=1
pkgdesc="a fast fetch utility"
arch=('x86_64')
url="https://github.com/DemonKingSwarn/microfetch"
license=('GPL3')
depends=()
provides=(microfetch)
conflicts=()
replaces=()
backup=()
options=()
source=("${url}/releases/download/latest/${_pkgname}")
noextract=()
sha256sums=('SKIP')


package() {
	mkdir -p "$pkgdir"/usr/bin
  chmod +x "$_pkgname"
  cp -r "$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
}
