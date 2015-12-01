# Maintainer : David Dotson <dotsdl at gmail dot com>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.0.0
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
license=('GPL3')
url='http://numixproject.org/'
depends=('gtk-engine-murrine')
replaces='gtk-theme-numix-frost'
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D')
source=('numix-frost-themes.tar.xz::http://repo.antergos.info/antergos/x86_64/numix-frost-themes-3.0.0-1-any.pkg.tar.xz'\
        'numix-frost-themes.tar.xz.sig::http://repo.antergos.info/antergos/x86_64/numix-frost-themes-3.0.0-1-any.pkg.tar.xz.sig')
sha256sums=('8aecae42ecd476b02fa111cba915d3a423e1392b7bb26ced561b92d08ff74cc0'\
            'cc95d01312cbfa6a0768b8210a236fbc29f22a00b731854d7d038b2a3660335b')
package() {

cd "${srcdir}/usr/share/themes"
find Numix* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;

}
