pkgname=pw-lat
pkgver=0.1.1
pkgrel=1
pkgdesc="pw-lat is small rust program which allow to simple change pipewire-jack rate and quantum while apps are running"
arch=('x86_64')
url="https://github.com/MatiM72737/pw-lat"
license=('MIT')
depends=('pipewire' 'pipewire-jack')
source=("https://github.com/MatiM72737/pw-lat/releases/download/v${pkgver}/pw-lat-x86_64.tar.gz")
sha256sums=('3248228f92bfe6d12c0e6aa38b613e08eed2c5758f8649a05dd2f01f5a640180')

package() {
  install -Dm755 "pw-lat" "$pkgdir/usr/bin/pw-lat"
}
