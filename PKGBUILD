# Maintainer: Tomás Duarte <alfarrofo@gmail.com>
_pkgname=projectmanager
pkgname=${_pkgname}
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Create and manage diferent projects!"
arch=('x86_64')
url="https://github.com/MustachedSquid/ProjectManager"
license=('MIT')
groups=()
depends=('bash')
makedepends=()
checkdepends=()
optdepends=('git: git support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/MustachedSquid/ProjectManager/releases/download/0.1.0/projectmanager-0.1.0.tar.gz")
noextract=()
sha256sums=("d0266b895b9611a4b16b892f7b9b6c8a039be49d90dc69386bd08349f76b28ae")

package() {
	cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
