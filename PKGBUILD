# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgname=('dracula-gtk-theme-bin' 'dracula-qt5-theme-bin' 'dracula-icons-bin')
pkgbase=dracula-themes
_pkgname=Dracula
pkgver=2021.08.25
pkgrel=1
arch=("any")
url="https://github.com/The-Repo-Club/$_pkgname"
license=('GPL')
source=("${_pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('7c7047054fc8946a92f706c0a5e5804680c2b9d46e1ecae6e9ad9349d861739e')

package_dracula-gtk-theme-bin() {
    pkgdesc="This theme provides support for GTK-3 and GTK-2 based desktop environments like Gnome, Unity, Budgie, Pantheon, XFCE, Mate, etc. Also provides support for KDE plasma."

    cd "$_pkgname-$pkgver"

    mkdir -p "${pkgdir}/usr/share/themes/"
    cp -a ".themes/"* "${pkgdir}/usr/share/themes/"
}

package_dracula-qt5-theme-bin() {
    pkgdesc="This theme provides support for QT5."

    cd "$_pkgname-$pkgver"

    mkdir -p "${pkgdir}/usr/share/qt5ct/colors"
    cp -a ".qt5ct/colors/"* "${pkgdir}/usr/share/qt5ct/colors"
}

package_dracula-icons-bin() {
    pkgdesc="This provides support dracula for icons."

    cd "$_pkgname-$pkgver"

    mkdir -p "${pkgdir}/usr/share/icons/"
    cp -a ".icons/"* "${pkgdir}/usr/share/icons/"
}
