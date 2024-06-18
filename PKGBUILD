# Maintainer: qsqcqs
pkgname='qwq'
pkgver=nya
pkgrel=5
epoch=1
pkgdesc="uwu/qwq for terminal"
arch=('x86_64')
url="https://github.com/qsqcqs/qwq"
license=('GPL-3.0-or-later')
depends=('python3')
checkdepends=()
optdepends=()
replaces=(
'uwu-qwq'
'uwu'
)
source=("https://github.com/qsqcqs/$pkgname/archive/refs/tags/$pkgver-$pkgrel.tar.gz")
noextract=()
validpgpkeys=()


package() {
	cd "$pkgname-$pkgver-$pkgrel"
	
    install -Dm644 uwu "${pkgdir}"/usr/bin/uwu
    install -Dm644 qwq "${pkgdir}"/usr/bin/qwq
    chmod +x "${pkgdir}"/usr/bin/uwu
    chmod +x "${pkgdir}"/usr/bin/qwq
}





sha256sums=('41ccf469717be288760bc176d68b797b0272627cb7b6de2974963a11f63b5e4e')
