# Maintainer: qsqcqs
pkgname='qwq'
pkgver=2.0
pkgrel=3
pkgdesc="uwu/qwq for terminal"
arch=('x86_64')
url="https://github.com/qsqcqs/qwq"
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



sha256sums=('522d8a110a50b0e1c0f8c28c3134733eac7e0f5540214e74d65387e4fc3c6e86')
