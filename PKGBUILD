pkgname=finkyo-bin
pkgver=0.3.7.3
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('f131e162047b7cc8ffee421b3ae9acbb3fc419082e0123379265ff3a8a89dd4e60575964ce7fa24fcb0ae6f7342b74eb564e22478088c814250b25a42cca27de')
sha512sums_aarch64=('a4574ae4887da5c962a617a455a9a69ab27b248b572f60219d7ccf00ebbf78088ed99801463ebf6c72713be95e0608f706e561071b11048630b69aac7c193942')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver "$pkgdir"/usr/bin/finkyo
}
