# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pshash
pkgver=0.1.13.5
pkgrel=1
epoch=
pkgdesc="A functional pseudo-hash password generator"
arch=('any')
url="https://github.com/thornoar/pshash"
license=('MIT')
groups=()
depends=()
makedepends=('ghc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Main.hs::https://raw.githubusercontent.com/thornoar/pshash/0.1.13/app/Main.hs"
	"README.md::https://raw.githubusercontent.com/thornoar/pshash/0.1.13/README.md"
	"LICENSE::https://raw.githubusercontent.com/thornoar/pshash/0.1.13/LICENSE")
noextract=("Main.hs")
validpgpkeys=()

build() {
	ghc ./Main.hs -no-keep-o-files -no-keep-hi-files -o ./pshash
}

package() {
	install -Dm755 ./$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('15853fa4442ce357b66687e689e5b993c6d40e90cf2c5dcf5c4870fba1828d77'
            '8c6ecab033182455e5b9d04c9b2b4fd40b55cec565567fff8957481e73879d27'
            '92e498dfdf4478c5d306c11af29b375797420464964efda7329d27a8025af6bb')
sha256sums=('15853fa4442ce357b66687e689e5b993c6d40e90cf2c5dcf5c4870fba1828d77'
            '8c6ecab033182455e5b9d04c9b2b4fd40b55cec565567fff8957481e73879d27'
            '92e498dfdf4478c5d306c11af29b375797420464964efda7329d27a8025af6bb')
