# Maintainer: Chris Watson <cawatson1993@gmail.com>
# Co-maintainer: George <hello@wavetro.net>

pkgname="plasticity-bin"
pkgver="1.3.8"
pkgrel="1"
pkgdesc="Plasticity is a 3D modeling software for concept artists. Modeling in Plasticity is quick and efficient due to the unique gizmos, shortcuts, and thoughtful workflow."
arch=("x86_64")
license=("nonfree")
url='https://github.com/nkallen/plasticity'
depends=(alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat gdk-pixbuf2 glib2 gtk3 gvfs
         hicolor-icon-theme kde-cli-tools libcups libdrm libnotify libx11 libxcb libxcomposite libxdamage libxext
         libxfixes libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils)
optdepends=('discord: For communication with the devs'
            'apparmor: Extra protection'
            'pulseaudio: For sound')
source=("https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity_${pkgver}_amd64.deb")
sha512sums=('01f8b10e2c8d7727939ec672bdc3405a6c48f4bfdf1a118b39f219d1e331ebe0a30d6b7e93baec9fc884d73aa927807b082053c691bb1b0a35926bc3be5ac8a6')

package() {
    tar -xvf data.tar.zst -C "$pkgdir"
}
