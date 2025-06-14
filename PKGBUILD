# Maintainer: Nukleari <nukleari@pm.me>
pkgname=ms-edit-desktop
pkgver=1.0.0
pkgrel=3
pkgdesc="Desktop entry for Microsoft Edit"
url='https://github.com/microsoft/edit'
arch=('any')
license=('MIT')
depends=('ms-edit')

source=("https://raw.githubusercontent.com/microsoft/edit/c44eb4297f3d734e3e94c877d5676b3e553107d9/assets/edit.svg" 'ms-edit.desktop')
sha256sums=('e56f9fc9cebea8b147fb12bf0dfc65656a3c2c5b23c9f7e5b65534dec8d6e9d8'
            'afca7c2501eb7044a30babe097ecde3c045db1f3e57404cfbcd8aeef58a55ce4')

package() {
  cd "$srcdir"
  install -Dm644 edit.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ms-edit.svg"
  install -Dm644 ms-edit.desktop "$pkgdir/usr/share/applications/ms-edit.desktop"
}
