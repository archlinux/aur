# Maintainer: Mizzt <mizztgc@gmail.com>
pkgname=konaste-linux
pkgver='0.2.1'
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
	"gamemode: run with better performance (--gamemode)"
	"gamescope: run games through a gamescope (--gamescope)"
	"mangohud: enable performance overlay (--mangohud)"
	"kdialog: dialog handling (Qt-based distros)"
	"zenity: dialog handling (GTK-based distros)"
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
sha256sums=('3445e8f5b9c56ea0d86f6a5aa25399878ebc3e0f1cf41b5a27d9bb4e98274371')
validpgpkeys=()

package() {
	cd "${srcdir}"
	./install.sh --prefix "${pkgdir}/usr" -R
}
