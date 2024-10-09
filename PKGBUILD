# Maintainer: Fazzi <faaris <dot> ansari <at> proton <dot> me> 

pkgname=sudachi-bin
_pkgver=v1.0.11
pkgver=1.0.11
pkgrel=1
pkgdesc="Sudachi is a Nintendo Switch emulator for Android, Linux, macOS and Windows, written in C++"
arch=(x86_64)
url=https://sudachi.emuplace.app/
license=(GPL-3.0-or-later)
provides=('sudachi')
provides=('sudachi')
depends=('brotli' 'enet' 'llvm-libs' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libcrypto.so' 'libssl.so' 'libva.so' 'lz4' 'qt6-base' 'qt6-multimedia' 'qt6-webengine' 'sdl2' 'zlib')
optdepends=('qt6-wayland: wayland support')
source=("https://github.com/emuplace/sudachi.emuplace.app/releases/download/${_pkgver}/sudachi-linux-${_pkgver}.7z"
        "sudachi.svg"
        "sudachi.desktop")
sha256sums=('b91d1cc675b313cd99f6d5de31c79ff5050111c6112eb6e426e5dc4a5acb6ec2'
            '1edb61d2a01d926654fc98f8e59253df600d88ca4b2c5706a3b01368b830f31d'
            '0081f2b36ef69abfc328e11cfae2dd83ed74695bfec0f04938ad80b6f5200708')

package() {
install -Dm755 $srcdir/sudachi -t "$pkgdir/usr/bin"
install -Dm755 $srcdir/sudachi-cmd -t "$pkgdir/usr/bin"
install -Dm755 $srcdir/sudachi-room -t "$pkgdir/usr/bin"
install -Dm755 $srcdir/sudachi.desktop -t "$pkgdir/usr/share/applications"
install -Dm644 $srcdir/sudachi.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
