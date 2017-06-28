# Maintainer: Michael Lojkovic <mikelojkovic@gmail.com>

pkgname=gtk-theme-windows10
pkgver=1.0.0
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines."
arch=('any')
url="https://github.com/Elbullazul/Windows-10"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard' 'windows10-tint2rc')
changelog=${pkgname}.changelog
source=("https://github.com/B00merang-Project/Windows-10/archive/v1.0.0.tar.gz")
sha1sums=('d91bcaef6347faf99afd906bbf5c503c962a1b3d')

package() {
  	cd Windows-10-$pkgver/Windows\ 10\ Light

  	# create theme dir
  	install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  	# install theme
  	find . -type f -exec \
    	install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;
}
sha1sums=('a58582350cb09b8afdcd5f9bff9e6e5841c48b32')
