# Maintainer: Warinyourself <warinyourself@gmail.com>

pkgname=lightdm-webkit-theme-osmos
pkgver=2.0.3
pkgrel=1
pkgdesc="Lightdm greeter theme based on GLSL."
arch=('any')
url="https://github.com/Warinyourself/$pkgname"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.3')
install='lightdm-webkit-theme-osmos.install'
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('786b4e5aac5a7584b94fd970f844590c')

package() {
  install -dm 755 "$pkgdir"/usr/share/lightdm-webkit/themes/osmos
  cp -r --no-preserve=ownership * "$pkgdir"/usr/share/lightdm-webkit/themes/osmos/
}
