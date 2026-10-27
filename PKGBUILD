# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=grass-desktop-node
pkgver=8.1.0
pkgrel=1
pkgdesc="The Grass Desktop Node is a lightweight standalone application that is designed to run on any desktop.
    Users of the desktop node are awarded priority network traffic and are able to earn additional rewards for
    occasional access to the user's bandwidth."
arch=('x86_64')
license=('unknown')
url="https://app.grass.io/dashboard"
depends=(
    'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
    'libayatana-appindicator' 'libgcc' 'libsoup3' 'webkit2gtk-4.1'
)
source=(
    "https://files.grass.io/file/grass-extension-upgrades/v${pkgver}/grass-desktop_${pkgver}_amd64.deb"
)
sha256sums=('76b28055bb4936064f1b2b29f4e4adc1605993cf6fae8bf35ffcbbf60b4639e8')

package() {
    bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}
}
