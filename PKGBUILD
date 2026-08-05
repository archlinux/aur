# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=7.6.0
pkgrel=1
pkgdesc="The Grass Desktop Node is a lightweight standalone application that is designed to run on any desktop.
    Users of the desktop node are awarded priority network traffic and are able to earn additional rewards for
    occasional access to the user's bandwidth."
arch=('x86_64')
license=('unknown')
url="https://app.grass.io/dashboard"
depends=(
    'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
    'libayatana-appindicator' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'zlib'
)
source=(
    "https://files.getgrass.io/file/grass-extension-upgrades/v${pkgver}/grass-desktop_${pkgver}_amd64.deb"
)
sha256sums=('aa8fec75036be20662a8ea7a7d4c1d7fbe6b61954cdd9e4b7aa8029a54ec0c10')

package() {
    bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}
}
