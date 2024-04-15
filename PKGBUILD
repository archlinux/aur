# Maintainer: qsqcqs
pkgname='qwq'
pkgver=nya
pkgrel=1
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



sha256sums=('f1cfae399c3628fcf429c7f964352d8c1daf857e7d24cec460744145de5e93f1')
