# Maintainer: Stéphane Meyer <tigerlost at tigerfunk dot tk>
# Contributor: Stéphane Meyer <tigerlost at tigerfunk dot tk>

pkgname=gmi
pkgver=0.7.3
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
sha256sums=(331b5b84b9eef350b9bb9ea582e94b15b4be81228353303a2e2cd4731ef1f299)

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
