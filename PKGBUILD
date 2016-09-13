pkgname=firacode-fonts
pkgver=1.201
pkgrel=1
pkgdesc="Monospaced font with programming ligatures"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("https://github.com/tonsky/FiraCode/releases/download/$pkgver/FiraCode_$pkgver.zip")
install=$pkgname.install
md5sums=('632adc945ab5fff15ea164455508ac72')

package() {
  install -Dm644 $srcdir/ttf/FiraCode-Bold.ttf "$pkgdir"/usr/share/fonts/firacode/FiraCode-Bold.ttf
  install -Dm644 $srcdir/ttf/FiraCode-Light.ttf "$pkgdir"/usr/share/fonts/firacode/FiraCode-Light.ttf
  install -Dm644 $srcdir/ttf/FiraCode-Medium.ttf "$pkgdir"/usr/share/fonts/firacode/FiraCode-Medium.ttf
  install -Dm644 $srcdir/ttf/FiraCode-Regular.ttf "$pkgdir"/usr/share/fonts/firacode/FiraCode-Regular.ttf
  install -Dm644 $srcdir/ttf/FiraCode-Retina.ttf "$pkgdir"/usr/share/fonts/firacode/FiraCode-Retina.ttf
}
