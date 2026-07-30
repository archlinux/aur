# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsya-settings
pkgver=1.1
pkgrel=1
pkgdesc="settings of Matsya Ui."
arch=('x86_64')
url="https://github.com/MatsyaOs/matsya-settings"
license=('GPL')
groups=('Matsya')
makedepends=('git')
depends=(
	'pkgconfig'
	'cmake' 'bluedevil' 'kf6-bluez-qt' 'matsyaui' 'fontconfig' 'freetype2' 'icu' 'libmatsya' 'libxcursor' 'kf6-modemmanager-qt' 'kf6-networkmanager-qt' 'qt6-quickcontrols2' 'extra-cmake-modules' 'ninja' 'qt6-tools'
	'extra-cmake-modules'
	'kf6-config' 'kf6-kdecoration' 'kf6-guiaddons' 'kf6-coreaddons' 'kf6-configwidgets' 'kf6-kwindowsystem' 'kf6-kwayland' 'pkgconf' 'qt6-base' 'qt6-declarative' 'qt6-wayland' 'qt6-tools' 'kf6-kwindowsystem' 'polkit' 'polkit-qt6' 'xorg-server-devel' 'xf86-input-libinput' 'xf86-input-synaptics' 'qt6-base' 'qt6-declarative' 'freetype2' 'fontconfig' 'kf6-networkmanager-qt' 'kf6-modemmanager-qt'
)
source=('git+https://github.com/MatsyaOs/matsya-settings')
md5sums=('SKIP')


build() {

	cd "$srcdir"/matsya-settings/

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd matsya-settings
  DESTDIR="$pkgdir" make install
}
