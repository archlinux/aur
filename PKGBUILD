# Maintainer: Mizzt <mizztgc@gmail.com>
pkgname=konaste-linux
pkgver='0.2.5'
pkgrel=1
epoch=
pkgdesc="Run KONAMI Amusement Game Station (Konaste) games using Wine"
arch=('x86_64')
url="https://github.com/mizztgc/konaste-linux"
license=('GPL')
groups=()
depends=( 'bash' 'wine>=9.0' 'wine-mono>=8.1.0' 'noto-fonts-cjk'
		  'pipewire-pulse' 'wget' 'xdg-utils' 'hicolor-icon-theme'
		  'gstreamer' 'gst-plugins-ugly' 'gst-libav' 'x264' )
makedepends=()
checkdepends=()
optdepends=(
	"msitools: for silent install (--silent)"
	"zenity: dialog handling"
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
sha256sums=('20ac9e7d52a64fb6e43ba0bb4f5deb375556fd14c2bc7c896d3417a37a4f8bff')
validpgpkeys=()

package() {
	cd "${srcdir}"
	./install.sh --prefix "${pkgdir}/usr" -R
}
