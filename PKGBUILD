# Maintainer: qsqcqs
pkgname='qwq'
pkgver=nya
pkgrel=4
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





sha256sums=('bd68a337409493d18ed948662de6745a726b4b8d724fe40cd3a9d40ad2f6c031')
