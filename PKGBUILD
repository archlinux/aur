# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgname=dracula-qt5-theme
_pkgname=Dracula
pkgver=2021.05.25
pkgrel=1
pkgdesc="This theme provides support for QT5."
arch=("any")
url="https://github.com/The-Repo-Club/Dracula"
license=('GPL')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('6b4afc8502d05dc8da60fd4c48b3bf445883618d65fda27d3b5737d302383e95')

package() {
    cd "$_pkgname-$pkgver"

    mkdir -p "${pkgdir}/usr/share/qt5ct/colors"
    cp -a ".qt5ct/colors/"* "${pkgdir}/usr/share/qt5ct/colors"
}
