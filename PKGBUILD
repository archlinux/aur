# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=epoch-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('x86_64')
url="https://github.com/lf-lang/lingua-franca"
license=('BSD')
depends=('java-runtime=17')

source=('https://github.com/lf-lang/lingua-franca/releases/download/v0.2.0/epoch_ide_0.2.0-linux.gtk.x86_64.tar.gz')
sha512sums=('d8e43dde4d6334f8892c0a5ed6d18269b4b42bd7fa8074d8b811c2e912e367d6164f6b26b69ab9e64a2e29f6a10b5919e522a06be09552e05f74c68713315ab1')

package() {
  mkdir -p "${pkgdir}/opt/lf"
  cp -r "${srcdir}/epoch" "${pkgdir}/opt/lf"
}
