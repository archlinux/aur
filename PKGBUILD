pkgname=finkyo-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('02fdfc75d5b8e5675f8e87b513218a0c361b07a075ecc808c38b9523b8a3cbbf6385e2c0b116f1d90dea8140245cee8e594891f63589bf544c1ff312d326225f')
sha512sums_aarch64=('83b6d2ec04c90a6b1d1a5cb62811d2a795c78daf80de59557cbef7efb36937deefc2c51dae821f56f6ffdd28ebd35b9576a74800d1263960713c8251671ad29f')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
