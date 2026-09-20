# Maintainer: reakjra <reakjra@proton.me>
pkgname=omikuji-bin
_pkgname=omikuji
pkgver=0.17.0
pkgrel=1
pkgdesc='Qt/QML based wine apps launcher for Linux'
arch=('x86_64')
url='https://github.com/omikuji-launcher/omikuji'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland'
         'openssl' 'xz' 'systemd-libs' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
optdepends=('plasma-integration: KDE Plasma theme integration'
            'vulkan-icd-loader: GPU selection and dxvk/vkd3d layers')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
_tarball="omikuji-${pkgver}-x86_64.tar.zst"
source=("${url}/releases/download/v${pkgver}/${_tarball}")
sha256sums=('ec0a18516f7db88449b869d67f138de8ab267fea48a3581d770ded93ad1c1f4c')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
