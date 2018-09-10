# Maintainer: hanss314 <hanss314@gmail.com>
pkgname=tlowscript
pkgver=0.0.1
pkgrel=1
pkgdesc="TLOWScript and variants"
arch=('any')
url="https://github.com/hanss314/TLOWScript"
license=('MIT')
groups=()
depends=('python' 'java-runtime-common')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()

package() {
  git clone "$url" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share"
  cp -p "tlowscript" "$pkgdir/usr/bin"
  cp -rp "scripts" "$pkgdir/usr/share/tlowscript"
}

