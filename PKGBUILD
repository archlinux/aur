# Maintainer: Nukleari <nukleari@pm.me>
pkgname=ms-edit-desktop
pkgver=1.0.0
pkgrel=5
pkgdesc="Desktop entry for Microsoft Edit"
url='https://github.com/microsoft/edit'
arch=('any')
license=('MIT')
depends=('msedit')

source=("https://raw.githubusercontent.com/microsoft/edit/c44eb4297f3d734e3e94c877d5676b3e553107d9/assets/edit.svg" 'msedit.desktop')
sha256sums=('e56f9fc9cebea8b147fb12bf0dfc65656a3c2c5b23c9f7e5b65534dec8d6e9d8'
            '2660d6be7e5963ea8a0250c3157826c5a6136a4100d16c124b6155f8d4251fbc')

package() {
  cd "$srcdir"
  install -Dm644 edit.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/msedit.svg"
  install -Dm644 msedit.desktop "$pkgdir/usr/share/applications/msedit.desktop"
}
