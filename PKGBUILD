pkgname=finkyo-bin
pkgver=0.5.1.1
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('8bf7dea40d400ff8c0247beee65840f7664d26a8eed210b17a245901df7cbdf51ace02953d1302a0bd52063cfe22c46ba9052a24926cccd1333b76c86291e766')
sha512sums_aarch64=('3728e99a9777db27f3552cef1e90702226d7f9fb8456a6ab198a0b7b8a578089c2c387db9fe8c6fc131bf6b0b36defed35eb52b24bbd953ade09f76953c56c60')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
