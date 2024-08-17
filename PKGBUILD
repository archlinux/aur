pkgname=finkyo-bin
pkgver=0.3.9
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('89f72af9e2b7c3f243b1b97c5ab3f4e2dbd6324b391b28b3163d4a0f854e206fb40b18fa4316a8098fa56eb1bd718897f3f978c1faa1987709fc73436b2d74f7')
sha512sums_aarch64=('89f72af9e2b7c3f243b1b97c5ab3f4e2dbd6324b391b28b3163d4a0f854e206fb40b18fa4316a8098fa56eb1bd718897f3f978c1faa1987709fc73436b2d74f7')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver "$pkgdir"/usr/bin/finkyo
}
