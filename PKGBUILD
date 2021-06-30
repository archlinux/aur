# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgname=dracula-qt5-theme
_pkgname=Dracula
pkgver=2021.06.30
pkgrel=1
pkgdesc="This theme provides support for QT5."
arch=("any")
url="https://github.com/The-Repo-Club/$_pkgname"
license=('GPL')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('9b3613fc4f4557b5140baff174b64326ddb4329d7f0f62460e998087a542fc31')

package() {
    cd "$_pkgname-$pkgver"

    mkdir -p "${pkgdir}/usr/share/qt5ct/colors"
    cp -a ".qt5ct/colors/"* "${pkgdir}/usr/share/qt5ct/colors"
}
