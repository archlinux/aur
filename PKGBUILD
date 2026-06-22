# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Lare <lare354@duck.com>
pkgname=waller-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="rofi wallpaper changer with optional automatic blurring"
arch=(any)
url="https://github.com/lare354/waller"
license=('MIT')
groups=()
depends=(awww rofi imagemagick)
makedepends=()
checkdepends=()
optdepends=()
provides=(waller)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://raw.githubusercontent.com/lare354/waller/refs/heads/main/install.sh")
noextract=()
sha256sums=('0ae41487504b76dcba09f03be683f3b2952deb57d5b83623fbf180f02290973d')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	sh ./install.sh
}

package() {
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
