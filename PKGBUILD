pkgname=brick-bin
pkgver=0.2.10.34
pkgrel=1
provides=('brick')
conflicts=('brick' 'brick-git' 'mesa-demos')
pkgdesc="An open source Bitrix24 messenger client"
arch=('x86_64')
depends=("alsa-lib" "desktop-file-utils" "gconf" "libxtst" "libxss" "xdg-utils" "gtk2" "libnotify" "nss")
optdepends=("libappindicator-gtk2: modern system indicator support for KDE5, Cinnamon, Unity, etc")
url="https://github.com/buglloc/brick"
license=('MIT')

source_x86_64=(
    "http://ppa.launchpad.net/buglloc/brick/ubuntu/pool/main/b/brick/brick_${pkgver}-0ubuntu${pkgrel}~xenialppa0_amd64.deb"
)
sha256sums_x86_64=(
    '8185c7536deccdf29743b42db6aa8d45436c80de783edc96b7fa203e9d4858de'
)

package() {
    tar xf "$srcdir/data.tar.xz" -C "$pkgdir"
    ls "$pkgdir"
}
