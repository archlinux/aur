
# Maintainer: Your Name <admin@matsyos.ml>
pkgname=matsyaui
pkgver=1.1
pkgrel=1
pkgdesc="UI of Matsya Ui."
arch=('x86_64')
url="https://github.com/MatsyaOs/matsyaui"
license=('GPL')
groups=('Matsya')
makedepends=('git')
depends=('kwindowsystem'  'qt6-declarative'  'qt6-graphicaleffects'  'qt6-quickcontrols2' 'qt6-tools' 'ninja' 'extra-cmake-modules'
)
source=('git'+'https://github.com/MatsyaOs/matsyaui')
md5sums=('SKIP')


build() {

	cd "$srcdir"/matsyaui/

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd matsyaui
  DESTDIR="$pkgdir" make install
}
