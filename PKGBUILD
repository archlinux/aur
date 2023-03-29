# Maintainer: Paul Black <paulrblack.prb@gmail.com>

pkgname="plasticity-bin"
pkgver="0.10.4"
pkgrel="2"
pkgdesc="Plasticity is a 3d modelling software for concept artists. Modeling in Plasticity is quick and efficient due to the unique gizmos, shortcuts, and thoughtful workflow."
arch=("x86_64")
license=("nonfree")
url='https://github.com/nkallen/plasticity'
depends=(alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme kde-cli-tools libcups libdrm libnotify libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils)
optdepends=('discord: For communication with the devs' 'apparmor: Extra protection' 'pulseaudio: For sound')
source=("plasticity-beta_${pkgver}_amd64.deb::https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity-beta_${pkgver}_amd64.deb")
sha512sums=("2d4a9b613e875fb4a80859e5f7c2ff70f7e45faa4685683fef877dfeb17090c6611f1b6d7cb9edae90e14615602e6fd453684bcd0ddd9cf5faa9b55726e95220")

package() {
    tar -xf data.tar.zst
    
    cp -r "$srcdir/usr" -t "$pkgdir"
}
