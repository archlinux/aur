
# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsya-texteditor
pkgver=1.1
pkgrel=1
pkgdesc="Text Editor of Matsya Ui."
arch=('x86_64')
url="https://github.com/MatsyaOs/texteditor"
license=('GPL')
groups=('Matsya')
makedepends=('git')
depends=(
	'pkgconfig'
	'cmake'
	'extra-cmake-modules'
	'kf6-config' 'kf6-kdecoration' 'kf6-guiaddons' 'kf6-coreaddons' 'kf6-configwidgets' 'kf6-kwindowsystem' 'kf6-kwayland' 'pkgconf' 'qt6-base' 'qt6-declarative' 'qt6-wayland' 'qt6-tools' 'kf6-kwindowsystem' 'polkit' 'polkit-qt6' 'xorg-server-devel' 'xf86-input-libinput' 'xf86-input-synaptics' 'qt6-base' 'qt6-declarative' 'freetype2' 'fontconfig' 'kf6-networkmanager-qt' 'kf6-modemmanager-qt'
)
source=('git+https://github.com/MatsyaOs/texteditor')
md5sums=('SKIP')


build() {

	cd "$srcdir"/texteditor/

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd texteditor
  DESTDIR="$pkgdir" make install
}
