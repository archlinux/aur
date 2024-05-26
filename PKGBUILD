# Maintainer: Albert Latham <me@albertlatham.com>

pkgname="plasticity-bin-unstable"
pkgver="24.1.5"
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
sha512sums=('778e99189fcd44d19e2ccdffcaa2c883e3939d21a41dc94466afc0c92f31bf4001609b095a1bb96d6f2312eb347b2a42c1659986aede979163f08099f80d516b')

package() {
    tar -xvf data.tar.zst -C "$pkgdir"
}
