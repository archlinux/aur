# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=7.7.0
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
sha256sums=('c891abcdb220212f0ded74d27cf2a23b3db33268d199539c6033aaab7857be1b')

package() {
    bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}
}
