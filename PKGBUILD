# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgname=dracula-gtk-theme
_pkgname=Dracula
pkgver=2021.06.30
pkgrel=1
pkgdesc="This theme provides support for GTK-3 and GTK-2 based desktop environments like Gnome, Unity, Budgie, Pantheon, XFCE, Mate, etc. Also provides support for KDE plasma."
arch=("any")
url="https://github.com/The-Repo-Club/$_pkgname"
license=('GPL')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('9b3613fc4f4557b5140baff174b64326ddb4329d7f0f62460e998087a542fc31')

package() {
    cd "$_pkgname-$pkgver"

    mkdir -p "${pkgdir}/usr/share/themes/"
    cp -a ".themes/"* "${pkgdir}/usr/share/themes/"

    mkdir -p "${pkgdir}/usr/share/icons/"
    cp -a ".icons/"* "${pkgdir}/usr/share/icons/"
}
