# Maintainer: reakjra <reakjra@proton.me>
pkgname=omikuji-bin
_pkgname=omikuji
pkgver=0.20.10
pkgrel=1
pkgdesc='Qt/QML based wine apps launcher for Linux'
arch=('x86_64')
url='https://github.com/omikuji-launcher/omikuji'
license=('GPL-3.0-or-later')
depends=('qt6-base>=6.12' 'qt6-base<6.13' 'qt6-declarative>=6.12' 'qt6-declarative<6.13' 'qt6-svg' 'qt6-wayland'
         'openssl' 'xz' 'systemd-libs' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
optdepends=('plasma-integration: KDE Plasma theme integration'
            'vulkan-icd-loader: GPU selection and dxvk/vkd3d layers')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
_tarball="omikuji-${pkgver}-x86_64.tar.zst"
source=("${url}/releases/download/v${pkgver}/${_tarball}")
sha256sums=('8b4e2a4948a08aead00a87c545bb8e7ea96de7bb24d07c6e3014755a9c9b824f')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
