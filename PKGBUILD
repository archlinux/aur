pkgname=commifs-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="This is filesystem that uses a lot of memory"
arch=(x86_64 i686)
url="https://github.com/Student-Team-Projects/CommiFS.git"
license=('MIT')
groups=()
depends=('fuse2' 'glibc')
makedepends=(
    git
    gcc
)
checkdepends=()
optdepends=()
provides=(commifs-git)
conflicts=($pkgname)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
    cd CommiFS
    make install
}

package() {
    cd CommiFS
    mkdir -p ${pkgdir}/opt/commifs-git
    cp -rf * ${pkgdir}/opt/commifs-git
}
