# Maintainer: Chris Watson <cawatson1993@gmail.com>

pkgname="plasticity-bin"
pkgver="1.2.0"
pkgrel="2"
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
sha512sums=('fc463e26ede8432db0db99629327e314a26d138552dad8b31d4fabdd261f274a6de6df7f0cbbf152c8eac8623086ca0c016d285a2fcce03f9db911069a61b373')

package() {
    tar -xvf data.tar.zst -C "$pkgdir"
}
