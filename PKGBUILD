# Maintainer: Albert Latham <me@albertlatham.com>

pkgname="plasticity-bin-unstable"
pkgver="24.2.5"
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
sha512sums=('82209a7aeaaf5e1a23bd41b1d4e3795ec9be7e5a430aebd08400229a609ba405eab416cd869cba5b727171a00c73fe6ea156c95b73f06d903b7650053c312b2e')

package() {
    tar -xvf data.tar.zst -C "$pkgdir"
}
