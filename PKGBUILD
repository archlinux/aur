# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=7.5.1
pkgrel=1
pkgdesc="The Grass Desktop Node is a lightweight standalone application that is designed to run on any desktop.
    Users of the desktop node are awarded priority network traffic and are able to earn additional rewards for
    occasional access to the user's bandwidth."
arch=('x86_64')
license=('unknown')
url="https://app.getgrass.io/dashboard/store/item/desktop"
depends=(
    'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
    'libayatana-appindicator' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'zlib'
)
source=(
    "https://files.getgrass.io/file/grass-extension-upgrades/v${pkgver}/grass-desktop_${pkgver}_amd64.deb"
)
sha256sums=('af447d2843b6ce0159852dbb556866350694ac4be542d5604aa26c1aeb3eeb03')

package() {
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
