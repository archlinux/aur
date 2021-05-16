# Maintainer: termuellinator

pkgname=proton-community-updater
pkgver=1.0
pkgrel=3
pkgdesc="Script to download and manage Community Proton builds"
arch=('any')
depends=('bash' 'coreutils' 'curl' 'xz')
optdepends=('zenity')
provides=('proton-community-updater')
url="https://github.com/Termuellinator/Proton-Community-Updater"
license=('GPL3')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Termuellinator/Proton-Community-Updater/archive/v${pkgver}.tar.gz"
    'proton-community-updater.desktop'
)
sha256sums=(
    '8d923a42e097c2d7769664a1a0f5a3f8a70719d1badc6993926ebcba06111a48'
    '07fcec5276fd0ad227fdedf5ea8dab3b054beb8a094ccda60b2c80ed4ea8411d'
)


package() {
    install -Dm755 "${srcdir}/Proton-Community-Updater-${pkgver}/proton-community-updater.sh" "$pkgdir/usr/bin/proton-community-updater"
    install -Dm755 "${srcdir}/Proton-Community-Updater-${pkgver}/proton-community-updater-icon.png" "$pkgdir/usr/share/pixmaps/proton-community-updater-icon.png"
    install -Dm755 "${srcdir}/proton-community-updater.desktop" "$pkgdir/usr/share/applications/proton-community-updater.desktop"
}
 

