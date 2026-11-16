# Maintainer: reakjra <reakjra@proton.me>
pkgname=omikuji-bin
_pkgname=omikuji
pkgver=0.21.0
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
sha256sums=('a972e2e47c8e41128888ef22ab27c5885391958b9b8c44f75627a4d818dcd4f2')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
