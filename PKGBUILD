# Maintainer : David Dotson <dotsdl at gmail dot com>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=2.5.2
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
license=('GPL3')
url='http://numixproject.org/'
depends=('gtk-engine-murrine')
replaces='gtk-theme-numix-frost'
source=("numix-frost-themes.tar.xz::http://repo.antergos.info/antergos/x86_64/numix-frost-themes-2.5.2-1-any.pkg.tar.xz")
sha256sums=('f7749300d70e9c2ee1eeca0ff94dc3c6362c4671aa60336d1c3b37d32a259560')
package() {

cd "${srcdir}/usr/share/themes"
find Numix* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;

}
