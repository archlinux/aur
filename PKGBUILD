# Maintainer: Paul Black <paulrblack.prb@gmail.com>

pkgname="plasticity-bin"
pkgver="0.5.46"
pkgrel="2"
pkgdesc="Plasticity is a 3d modelling software for concept artists. Modeling in Plasticity is quick and efficient due to the unique gizmos, shortcuts, and thoughtful workflow."
arch=("x86_64")
license=("nonfree")
url='https://github.com/nkallen/plasticity'
depends=(alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme kde-cli-tools libcups libdrm libnotify libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils)
optdepends=('discord: For communication with the devs' 'apparmor: Extra protection' 'pulseaudio: For sound')
source=("plasticity_${pkgver}_amd64.deb::https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity_${pkgver}_amd64.deb")
sha512sums=("60bb3eb9635c73400d08fd19811d295d68b7ecff4eb3f4a630c323c939fc2084fcb67b0f4526a3bc69d1001c7c80cdb351f886b165b5c7cef416748603acfac3")

package() {
    tar -xf data.tar.xz
    
    cp -r "$srcdir/usr" -t "$pkgdir"
}
