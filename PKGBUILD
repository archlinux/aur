# Maintainer: Gus deMayo <gus@thegusproject.xyz>

pkgname=zukitwo-manjaro
pkgver=1.1.2
pkgrel=1
pkgdesc="A simple green varient of the Zukitwo theme."
arch=('x86_64' 'i686')
url="https://gitlab.com/thegusproject/zukitwo-manjaro"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
source=("git+https://gitlab.com/thegusproject/zukitwo-manjaro")
sha1sums=("SKIP")

package() {
    cd "${srcdir}/"

    install -dm644 "${pkgdir}/usr/share/themes/"
    cp -r zukitwo-manjaro "${pkgdir}/usr/share/themes/"
}

