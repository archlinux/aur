# Maintainer: notscripter <grx8x0mfy@mozmail.com>
pkgname=spotube-nightly-bin
_pkgname=spotube
pkgver=5.0.0
pkgrel=1
epoch=
pkgdesc="🎧 Open source music client! Available for both desktop & mobile!"
arch=(i686 x86_64)
url="https://github.com/KRTirtho/spotube"
license=('BSD-4')
groups=()
depends=('mpv' 'libappindicator-gtk3' 'libsecret' 'jsoncpp' 'libnotify' 'xdg-user-dirs' 'webkit2gtk-4.1')
makedepends=()
checkdepends=()
optdepends=('yt-dlp-git')
provides=(spotube)
conflicts=(spotube)
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/KRTirtho/spotube/releases/download/nightly/spotube-linux-nightly-x86_64.tar.xz)
noextract=()
sha256sums=(7715767b6803a3b228adf775e2d235d3146117b34fb80c6688c86295e2aa6a78)
validpgpkeys=()

package() {
    cd ${srcdir}

    install -Dm644 ./spotube.desktop "${pkgdir}/usr/share/applications/spotube.desktop"
    install -Dm644 ./spotube-logo.png "${pkgdir}/usr/share/icons/spotube/spotube-logo.png"
    install -Dm644 ./com.github.KRTirtho.Spotube.appdata.xml "${pkgdir}/usr/share/appdata/spotube.appdata.xml"
    install -Dm755 -d ./data "${pkgdir}/usr/share/spotube/"
    install -Dm755 -d ./lib "${pkgdir}/usr/share/spotube/"
    install -Dm755 ./spotube "${pkgdir}/usr/bin/spotube"
 }
