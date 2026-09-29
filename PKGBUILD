pkgname=legio-launcher-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Legio desktop game launcher'
arch=('x86_64')
url='https://github.com/fraa2a/Legio'
license=('custom')
depends=('fuse2')
provides=('legio-launcher')
conflicts=('legio-launcher')
options=('!strip')
source=('Legio.AppImage::https://github.com/fraa2a/Legio/releases/download/v0.1.1/Legio.Launcher_0.1.1_amd64.AppImage' 'icon.png' 'legio-launcher' 'legio-launcher.desktop' 'LICENSE')
sha256sums=('947ca2f3ced9a52a0414fa2ca0f16b0a92f6c10159c4dbfc3858fa69c8cca52b' '2f4e1613a3a9e1bebab3986aeba7b9f780a1dc6a0feff0248a22ef4d905db9e4' '09ee16ce55c31ebbfec8e7753564a7d342944b0c68a999355ec65029710d2871' '500c2c273a237f45cc453f43495258eaefc8769d2b6670a70d581bab18c1d47c' 'b86297b73f6613f615f32cd23c31ace1b23d409b2007c9930f2f252dccc97a5b')

package() {
  install -Dm755 "$srcdir/Legio.AppImage" "$pkgdir/opt/legio-launcher/Legio.AppImage"
  install -Dm755 "$srcdir/legio-launcher" "$pkgdir/usr/bin/legio-launcher"
  install -Dm644 "$srcdir/legio-launcher.desktop" "$pkgdir/usr/share/applications/legio-launcher.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/legio-launcher.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
