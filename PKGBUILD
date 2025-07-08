# Maintainer: Mizzt <mizztgc@gmail.com>
pkgname=konaste-linux
pkgver='0.2.2'
pkgrel=1
epoch=
pkgdesc="Run KONAMI Amusement Game Station (Konaste) games using Wine"
arch=('x86_64')
url="https://github.com/mizztgc/konaste-linux"
license=('GPL')
groups=()
depends=( 'bash' 'wine>=9.0' 'wine-mono>=8.1.0' 'noto-fonts-cjk'
		  'pipewire-pulse' 'wget' 'xdg-utils' 'hicolor-icon-theme' )
makedepends=()
checkdepends=()
optdepends=(
	"msitools: for silent install (--silent)"
	"zenity: dialog handling (GTK-based DEs)"
	)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("https://github.com/mizztgc/${pkgname}/releases/download/v${pkgver}/konaste-linux-v${pkgver}.tar.gz")
#source=("konaste-linux-v${pkgver}.tar.gz")
noextract=()
sha256sums=('cfd82e1d827e95d16b7d26f45f5aef6e01398a6e54cb18358f286bf2c4beda10')
validpgpkeys=()

package() {
	cd "${srcdir}"
	./install.sh --prefix "${pkgdir}/usr" -R
}
