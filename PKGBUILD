# Maintainer: Warinyourself <warinyourself | gmail>

pkgname=lightdm-webkit-theme-osmos
pkgver=2.0.1
pkgrel=1
pkgdesc="A beautiful, customizable webkit theme for lightdm."
arch=('any')
url="https://github.com/Warinyourself/$pkgname"
license=('GPL3')
depends=('lightdm' 'lightdm-webkit2-greeter>=2.2.3')
install='lightdm-webkit-theme-osmos.install'
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('bee569d2a813723654798b0c6c384e95')

package() {
  install -dm 755 "$pkgdir"/usr/share/lightdm-webkit/themes/osmos
  cp -r --no-preserve=ownership * "$pkgdir"/usr/share/lightdm-webkit/themes/osmos/
}
