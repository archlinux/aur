# Maintainer: Chris Watson <cawatson1993@gmail.com>
# Co-maintainer: George <hello@wavetro.net>

pkgname="plasticity-bin"
pkgver="1.2.16"
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
sha512sums=('f7a05470bc87f07bc8415d1295cae9de4761b10939575951b6bb1cbdc442a8667dee67439ff5170987fdd3aed952be21ae8f9229e235a17cf5e605ab4b2bc081')

package() {
    tar -xvf data.tar.zst -C "$pkgdir"
}
