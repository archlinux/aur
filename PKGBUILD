# Maintainer: Chris Watson <cawatson1993@gmail.com>
# Co-maintainer: George <hello@wavetro.net>

pkgname="plasticity-bin"
pkgver="1.2.4"
pkgrel="1"
pkgdesc="Plasticity is a 3d modelling software for concept artists. Modeling in Plasticity is quick and efficient due to the unique gizmos, shortcuts, and thoughtful workflow."
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
sha512sums=('3966b50cf7f702ecab9be2b9f900da42bc48b602140515bec0336d455f02dba36c31af856e7447490595ca2bd10712c783eb08a633e51cdcd5db83c13a083fde')

package() {
    tar -xvf data.tar.zst -C "$pkgdir"
}
