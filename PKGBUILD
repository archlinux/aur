# Maintainer: Stéphane Meyer <teegre at icloud dot com>
# Contributor: Stéphane Meyer <teegre at icloud dot com>

pkgname=gmi
pkgver=0.7.3
pkgrel=2
pkgdesc="Gemini capsule generator."
arch=('any')
url="https://github.com/teegre/gmi"
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
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=(8a1e07156770452110ab1a60503917c577f783d09b87896774a4015e9b0ab760)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
