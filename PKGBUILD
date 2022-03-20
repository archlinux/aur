# Maintainer: Paul Black <paulrblack.prb@gmail.com>

pkgname="plasticity-bin"
pkgver="0.5.33"
pkgrel="2"
pkgdesc="Plasticity is a 3d modelling software for concept artists. Modeling in Plasticity is quick and efficient due to the unique gizmos, shortcuts, and thoughtful workflow."
arch=("x86_64")
license=("nonfree")
url='https://github.com/nkallen/plasticity'
depends=(alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme kde-cli-tools libcups libdrm libnotify libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils)
optdepends=('discord: For communication with the devs' 'apparmor: Extra protection' 'pulseaudio: For sound')
source=("plasticity_${pkgver}_amd64.deb::https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity_${pkgver}_amd64.deb")
sha512sums=("eb15ae2ec668656a99b8089940053d8aa5bff087e4ff9024fbd1064849552940cb1066bd81ea5dc0461fdba495b542fad29fb6296844e31677b293a7275d0c3f")

package() {
    tar -xf data.tar.xz
    
    cp -r "$srcdir/usr" -t "$pkgdir"
}
