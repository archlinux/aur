# Maintainer: Yamada Hayao <hayao@fascode.net>
# Maintainer: Peter Reschenhofer <peter.reschenhofer@gmail.com>

pkgname=gnome-shell-extension-extensions
_pkgname=${pkgname%-git}

pkgver="11"
pkgrel=3
pkgdesc="Extensions which allows to enable and disable extensions via a menu in the status area in the main menu panel."
arch=('any')
url="https://github.com/petres/gnome-shell-extension-extensions"
license=('GPL3')
depends=('gnome-shell')
source=("https://extensions.gnome.org/extension-data/extensionsabteil.org.v${pkgver}.shell-extension.zip")
md5sums=('14d383540cd224d91c7f5424c1178e8a')
provides=("gnome-shell-extension-extensions-git")
conflicts=("gnome-shell-extension-extensions-git")

package() {
	mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/extensions@abteil.org/"
	cp -r "${srcdir}/"* "${pkgdir}/usr/share/gnome-shell/extensions/extensions@abteil.org/"
    rm -rf "${pkgdir}/usr/share/gnome-shell/extensions/extensions@abteil.org/extensionsabteil.org.v${pkgver}.shell-extension.zip"
}
