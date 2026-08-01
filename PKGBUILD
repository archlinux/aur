# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=7.5.4
pkgrel=1
pkgdesc="The Grass Desktop Node is a lightweight standalone application that is designed to run on any desktop.
    Users of the desktop node are awarded priority network traffic and are able to earn additional rewards for
    occasional access to the user's bandwidth."
arch=('x86_64')
license=('unknown')
url="https://app.getgrass.io/dashboard/download/item/desktop"
depends=(
    'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
    'libayatana-appindicator' 'libgcc' 'libsoup3' 'webkit2gtk-4.1' 'zlib'
)
source=(
    "https://files.getgrass.io/file/grass-extension-upgrades/v${pkgver}/grass-desktop_${pkgver}_amd64.deb"
)
sha256sums=('d2380362da47313e7ec2a37f4a9a4c9fa41423e741e5e5016e04c51e2c092ea3')

package() {
    bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}
}
