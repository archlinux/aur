# Maintainer: Mizzt <mizztgc@gmail.com>
pkgname=konaste-linux
pkgver='0.1'
pkgrel=4
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
	"gamemode: run with better performance"
	"gamescope: run games through a gamescope (--gamescope)"
	)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("https://github.com/mizztgc/${pkgname}/releases/download/v${pkgver}b/konaste-linux-v${pkgver}b.tar.gz")
#source=("konaste-linux-v${pkgver}.tar.gz")
noextract=()
sha256sums=('140124ce10a079c3aa6851f387c725bbec36d43b6166d3b504afb5c504c77555')
validpgpkeys=()

package() {
	cd "${srcdir}"
	./install.sh --prefix "${pkgdir}/usr" -R
}
