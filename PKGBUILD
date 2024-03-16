# Maintainer: imoutocon
pkgname='qwq'
pkgver=1.0
pkgrel=1
pkgdesc="uwu/qwq for terminal"
arch=('x86_64')
url="https://github.com/qsqcqs/qwq/tree"
license=('GPL-3.0-or-later')
depends=('python3')
checkdepends=()
optdepends=()
replaces=('uwu-qwq')
source=("https://github.com/qsqcqs/$pkgname/archive/refs/tags/qwq-v$pkgver.tar.gz")
noextract=()
validpgpkeys=()


package() {
	cd "$pkgname-$pkgname-v$pkgver"
    sudo install -Dm755 uwu "/usr/bin/uwu"
    sudo install -Dm755 qwq "/usr/bin/qwq"
}
sha256sums=('dc7bdb57e2a96bce1fa75eb17979d4a7b9993b1ebfbc1ea6f60a805741fba4d3')
