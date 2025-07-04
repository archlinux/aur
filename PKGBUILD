pkgname=finkyo-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="file server"
arch=('x86_64' 'aarch64')
url="https://github.com/quantulr/finkyo"
license=('MIT')
source_x86_64=(finkyo-$pkgver-x86_64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-amd64)
source_aarch64=(finkyo-$pkgver-aarch64::https://github.com/quantulr/finkyo/releases/download/v${pkgver}/finkyo-linux-aarch64)
sha512sums_x86_64=('6fed01fde2f182c7fc3d41e31182d26670d6d7293dc64f74596456fd3b8e41f0eab98be75d470136774bbf906428ebb188faf58507c861e0b9ee06228d22edc9')
sha512sums_aarch64=('001a102c68bb7728eb1f47fada580a6350eeec41076ade3c82c837f5be9d0344a99ff2b9d46e64ad4277626c874a98970cae7762a9e6bdba79e05b376dee4b8d')

package() {
  cd "$srcdir/"

  install -Dm755 finkyo-$pkgver-$CARCH "$pkgdir"/usr/bin/finkyo
}
