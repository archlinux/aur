# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=gmi
pkgver=0.7.2
pkgrel=1
pkgdesc="Gemini capsule generator."
arch=('any')
url="https://gitlab.com/teegre/gmi"
license=('GPL')
groups=()
depends=('bash' 'coreutils' 'findutils' 'fzf' 'openssh' 'rsync' 'sed' 'tar')
makedepends=()
checkdepends=()
optdepends=('nano')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha256sums=(4cee2de651f31a970e3e222c531dd229cff8a68e76c8712a06e7f698b32a44e3)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
