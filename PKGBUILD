# Maintainer: fabbe <fabbe@carajo.no>

pkgname=postgrest-bin
pkgver=7.0.1
pkgrel=1
epoch=
pkgdesc="REST API for any Postgres database"
arch=('x86_64')
url="https://github.com/PostgREST/postgrest"
license=('MIT')
groups=()
depends=('postgresql-libs>=9.5')
makedepends=()
checkdepends=()
optdepends=()
provides=('postgrest' 'postgrest-bin')
conflicts=('postgrest')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/PostgREST/postgrest/releases/download/v$pkgver/postgrest-v$pkgver-linux-x64-static.tar.xz")
noextract=()
sha512sums=('87a8be36f791954a12a1c75e71ec0cff7050778b53f39941a8bd4b058039d52bde98ab44d9f7f9bd319dd7a8a7abea595c563d737a97078142da3e292fb3fa7e')
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/usr/bin/"
  ln -f postgrest "$pkgdir/usr/bin/"
}
