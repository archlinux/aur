pkgname=finkyo-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('e8cf77dc740fad2d4ca96345c18c36b5c1b9e15369289a86f0c94fc3342594fd232fdf304073c2ec899a0244b7b043548d9e5a81fee16ae17c355f2a01e4b7ae')
sha512sums_aarch64=('b39e575801cebdf989867f35aa87e789be9f033d24332afa5c174aabd59903f801fd2831489f0cc370794e23fbbb367be26ef1e8c1d42269f72da599c448f9c6')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
