# Maintainer: qsqcqs
pkgname='qwq'
pkgver=1.1
pkgrel=2
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
	
    install -Dm644 uwu "${pkgdir}"/usr/bin/uwu
    install -Dm644 qwq "${pkgdir}"/usr/bin/qwq
    chmod +x "${pkgdir}"/usr/bin/uwu
    chmod +x "${pkgdir}"/usr/bin/qwq
}


sha256sums=('30150224510f04c6f01c1a713cbf3a7455b98571ce29089ced77009b87c50575')
