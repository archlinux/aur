# Maintainer: qsqcqs
pkgname='qwq'
pkgver=nye
pkgrel=4
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




sha256sums=('217d5ee3c3181ea35f17fccbd7bf25559f33f3c98a9f8364d2907a69afa2bc9f')
