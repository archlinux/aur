# Maintainer: Nukleari <nukleari@pm.me>
pkgname=ms-edit-desktop
pkgver=1.0.0
pkgrel=2
pkgdesc="Desktop entry for Microsoft Edit"
url='https://github.com/microsoft/edit'
arch=('any')
license=('MIT')
depends=('ms-edit')

source=("https://raw.githubusercontent.com/microsoft/edit/refs/heads/main/assets/edit.svg" 'ms-edit.desktop')
sha256sums=('b123cd4c06771fe296b03ac3c4bf0f7926eceecdeff8cc7f17744fd760c2de8f'
            'b1639ff6f3d004a0fada68cd0f06b98ece4e6245cb5c708255ee4826028626ea')

package() {
  cd "$srcdir"
  install -Dm644 edit.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/ms-edit.svg"
  install -Dm644 ms-edit.desktop "$pkgdir/usr/share/applications/ms-edit.desktop"
}
