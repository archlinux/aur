# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iv-space-grey-gtk-theme'
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSX IV Space Grey GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1508433759/Gnome-OSX-IV-Space-Grey-1.0.tar.gz')
md5sums=('398a7ddd98dc07828b7503ecd1fc8839')

_name='Gnome-OSX-IV-Space-Grey'

package() {
    cd "$srcdir"
    mv "$_name-$pkgver" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
