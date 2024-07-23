# Maintainer: Albert Latham <me@albertlatham.com>

pkgname="plasticity-bin"
pkgver="24.1.8"
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
sha512sums=('0857c572ea147641383f3503f6129e7d5ba2940729202f36d308413caeddfbd8a13492ad4dacd2476402f840abac70e6d185792001056c03fa66529188b4bd09')

package() {
    tar -xvf data.tar.zst -C "$pkgdir"
}
