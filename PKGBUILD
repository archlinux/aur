# Maintainer : David Dotson <dotsdl at gmail dot com>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=1.9.4
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
license=('GPL3')
url='http://numixproject.org/'
depends=('gtk-engine-murrine')
replaces='gtk-theme-numix-frost'
source=("numix-frost-themes.tar.xz::http://repo.antergos.info/antergos/x86_64/numix-frost-themes-1.9.4-1-any.pkg.tar.xz")
sha256sums=('c942f0f8898680efc78d88f4709d2e707d97b2710aa13cd6d09243a3fd8f2f47')
package() {

cd "${srcdir}/usr/share/themes"
find Numix* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;

}
