# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=ant-dracula-kde-theme
pkgver=4.0.0
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
sha256sums=('462f397f957d8443cfef7cddf5e6b92878c5aeef1af9f581307d43257279eb4c')

package(){
	cd "$srcdir/gtk-4.0.0/kde"

    mkdir -p "${pkgdir}/usr/share/aurorae/themes" "${pkgdir}/usr/share/sddm/themes"

    cp -r aurorae/* "${pkgdir}/usr/share/aurorae/themes"
    cp -r color-schemes "${pkgdir}/usr/share"
    cp -r plasma "${pkgdir}/usr/share"
    cp -r sddm/* "${pkgdir}/usr/share/sddm/themes"
}

