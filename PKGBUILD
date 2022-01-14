# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=ant-dracula-kde-theme
pkgver=3.0
pkgrel=1
pkgdesc="Ant Dracula theme for KDE Plasma"
license=('GPL3')
arch=(any)
url=https://github.com/dracula/gtk
options=(!strip)
conflicts=(ant-dracula-kde-theme-git)
optdepends=("ant-dracula-gtk-theme: Matching GTK theme"
              "ant-dracula-kvantum-theme: Ant Dracula theme for Kvantum Qt style (recommended)")

source=("https://github.com/dracula/gtk/archive/v$pkgver.tar.gz")
sha256sums=('c28527129c7a5020d5225ef105e4b2369f156970876d7a427db11f90d71395c6')

package(){
	cd "$srcdir/gtk-3.0/kde"

    mkdir -p "${pkgdir}/usr/share/aurorae/themes" "${pkgdir}/usr/share/sddm/themes"

    cp -r aurorae/* "${pkgdir}/usr/share/aurorae/themes"
    cp -r color-schemes "${pkgdir}/usr/share"
    cp -r plasma "${pkgdir}/usr/share"
    cp -r sddm/* "${pkgdir}/usr/share/sddm/themes"
}

