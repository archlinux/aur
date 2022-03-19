# Maintainer: Paul Black <paulrblack.prb@gmail.com>

pkgname="plasticity-bin"
pkgver="0.5.32"
pkgrel="1"
pkgdesc="Plasticity is a 3d modelling software for concept artists. Modeling in Plasticity is quick and efficient due to the unique gizmos, shortcuts, and thoughtful workflow."
arch=("x86_64")
license=("LGPL-3.0")
url='https://github.com/nkallen/plasticity'
depends=(alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme kde-cli-tools libcups libdrm libnotify libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils)
optdepends=('discord: For communication with the devs' 'apparmor: Extra protection' 'pulseaudio: For sound')
source=("plasticity_${pkgver}_amd64.deb::https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity_${pkgver}_amd64.deb")
sha512sums=("d300b9e41976c9507973833ccb3594e107322179e1a3a391e9a5ab8e0a5b9e59ea7ce153c9830f3b754cc3519ed3531739b6529053253f02f219cdc7911e0e6f")

package() {
    tar -xf data.tar.xz
    
    cp -r "$srcdir/usr" -t "$pkgdir"
}
