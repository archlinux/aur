# Maintainer: Barazok <barazok.blackrocks@gmail.com>
pkgname=mlv
pkgver=2.0.2
pkgrel=5
pkgdesc="The MLV library is a simplified multimedia library. This library is ideal for students who are new to C programming and want to add graphic and sound effects to their programs."
arch=('any')
url="http://www-igm.univ-mlv.fr/~boussica/mlv/api/French/html/index.html"
license=('GPL')
groups=()
depends=('sdl' 'sdl_gfx' 'sdl_mixer' 'sdl_ttf' 'glib2' 'libxml2' 'sdl_image')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://download.savannah.gnu.org/releases/mlv/mlv-2.0.2/libmlv0_2.0.2-1_amd64.deb"
	"http://download.savannah.gnu.org/releases/mlv/mlv-2.0.2/libmlv0-dev_2.0.2-1_amd64.deb")
md5sums=("1c258a34b96c136aaf094772a172b874"
	 "2184ed0c53c0b29764e507aa17155811")

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
