# Maintainer: Stéphane Meyer <teegre at icloud dot com>
# Contributor: Stéphane Meyer <teegre at icloud dot com>

pkgname=gmi
pkgver=0.7.5
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
sha256sums=('0465b857ae61d903f08c562f9d6516c9483ff5c145d2b4b18a3593ce5d511281')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
