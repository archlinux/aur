# Maintainer: Daniel Ruiz de Alegría <daniel@drasite.com>

pkgname="flat-remix-gnome"
pkgver=20191027
pkgrel=1
pkgdesc="Flat Remix GNOME theme is a pretty simple shell theme inspired on material design following a modern design using \"flat\" colors with high contrasts and sharp borders."
arch=('any')
depends=(gnome-shell)
install=flat-remix-gnome.install
url="https://drasite.com/flat-remix-gnome"
license=('CC-BY-SA-4.0')
options=('!strip')
source=("https://github.com/daniruiz/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	make install DESTDIR=${pkgdir}
}
