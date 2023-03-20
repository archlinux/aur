# Maintainer: Paul Black <paulrblack.prb@gmail.com>

pkgname="plasticity-bin"
pkgver="0.9.16"
pkgrel="2"
pkgdesc="Plasticity is a 3d modelling software for concept artists. Modeling in Plasticity is quick and efficient due to the unique gizmos, shortcuts, and thoughtful workflow."
arch=("x86_64")
license=("nonfree")
url='https://github.com/nkallen/plasticity'
depends=(alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme kde-cli-tools libcups libdrm libnotify libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils)
optdepends=('discord: For communication with the devs' 'apparmor: Extra protection' 'pulseaudio: For sound')
source=("plasticity-beta_${pkgver}_amd64.deb::https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity-beta_${pkgver}_amd64.deb")
sha512sums=("73a0a57b91e79a9bed407bc737d74ea211a342e30afee9b243f74eafe6fa55000e5e891ace286baf7c339dbb5170a1e2c2c6ba7955f3d34cce638ae6f3a6cf57")

package() {
    tar -xf data.tar.zst
    
    cp -r "$srcdir/usr" -t "$pkgdir"
}
