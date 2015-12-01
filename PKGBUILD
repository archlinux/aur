# Maintainer : David Dotson <dotsdl at gmail dot com>
# Contributor : dmiranda at gmail dot com

pkgname=numix-frost-themes
pkgver=3.0.2
pkgrel=1
pkgdesc='Official Numix GTK theme - Antergos edition'
arch=('any')
license=('GPL3')
url='http://numixproject.org/'
depends=('gtk-engine-murrine')
replaces='gtk-theme-numix-frost'
validpgpkeys=('24B445614FAC071891EDCE49CDBD406AA1AA7A1D')
source=('numix-frost-themes.tar.xz::http://repo.antergos.info/antergos/x86_64/numix-frost-themes-3.0.2-1-any.pkg.tar.xz'\
        'numix-frost-themes.tar.xz.sig::http://repo.antergos.info/antergos/x86_64/numix-frost-themes-3.0.2-1-any.pkg.tar.xz.sig')
sha256sums=('89612d0177bad203fe8879be8a802c3662792856927d112016bcb9a3094d9da1'\
            'd29c4b7252982e01d8172a29d606fc111161dde58a3f210b2f296a9c90c746b2')
package() {

cd "${srcdir}/usr/share/themes"
find Numix* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;

}
