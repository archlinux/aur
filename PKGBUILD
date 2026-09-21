pkgname=endcord-installer
pkgver=1.5.4
pkgrel=1
pkgdesc="Installer script for endcord - feature rich Discord TUI client."
arch=('any')
url="https://github.com/sparklost/endcord"
license=('LicenseRef-SparkLost')
provides=('endcord-installer')
conflicts=('endcord-installer')
depends=('curl' 'bash')
makedepends=()
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland'
            'aspell: spellchecking'
            'yt-dlp: youtube support'
            'mpv: youtube in native player'
            'imagemagick: make notification images round'
            'gtk3: for endcord-gui'
            'libgirepository: required if building endcord-gui')
source=("install.sh::https://raw.githubusercontent.com/sparklost/endcord/main/tools/install.sh")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/install.sh" "${pkgdir}/usr/bin/endcord-install"
}
