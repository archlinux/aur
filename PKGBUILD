# Maintainer: Chris Watson <cawatson1993@gmail.com>
# Co-maintainer: George <hello@wavetro.net>

pkgname="plasticity-bin"
pkgver="1.3.2"
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
sha512sums=('eefff7541f2c652662b48ff5de9b2632b75427e680b35ba1d91f75ece767c07877d6651703243567c1f2046029ac0de3952b950417a7ec80bac3e8bfc0c02554')

package() {
    tar -xvf data.tar.zst -C "$pkgdir"
}
