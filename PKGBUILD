# Maintainer: qsqcqs
pkgname='qwq'
pkgver=nya
pkgrel=6
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





sha256sums=('e749c7c1fdd5872b4b8c04deb3f7d30b83ca0f598be9b69a9807656b8fd29f8c')
