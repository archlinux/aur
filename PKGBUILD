pkgname=pw-lat
pkgver=0.1.0
pkgrel=1
pkgdesc="pw-lat is small rust program which allow to simple change pipewire-jack rate and quantum while apps are running"
arch=('x86_64')
url="https://github.com/MatiM72737/pw-lat"
license=('MIT')
depends=('pipewire' 'pipewire-jack')
source=("https://github.com/MatiM72737/pw-lat/releases/download/v${pkgver}/pw-lat-x86_64.tar.gz")
sha256sums=('d6d81cabdcd9163befc31c20175a7610ae83b87950f9d4b86315133d6827f143')

package() {
  install -Dm755 "pw-lat" "$pkgdir/usr/bin/pw-lat"
}
