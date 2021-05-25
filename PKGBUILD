# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgname=dracula-qt5-theme
_pkgname=Dracula
pkgver=2021.05.25
pkgrel=1
pkgdesc="This theme provides support for GTK-3 and GTK-2 based desktop environments like Gnome, Unity, Budgie, Pantheon, XFCE, Mate, etc. Also provides support for KDE plasma."
arch=("any")
url="https://github.com/The-Repo-Club/Dracula"
license=('GPL')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('28bdc1394f21320b79adf6702ba0a913a67814705544c9bb5d6a6d1091320e79')

package() {
    cd "$_pkgname-$pkgver"

    mkdir -p "${pkgdir}/usr/share/qt5ct/colors"
    cp -a ".qt5ct/colors/"* "${pkgdir}/usr/share/qt5ct/colors"
}
