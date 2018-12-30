# Maintainer: Sasasu <sasasu [at] archlinuxcn.org>

pkgname=juicefs
pkgver=4.3.3
pkgrel=1
pkgdesc="A shared POSIX file system for the cloud"
arch=('i686' 'x86_64')
url="https://juicefs.com/"
license=('custom')
depends=('python')
source=("juicefs-$pkgver-$pkgrel::https://juicefs.com/static/juicefs")
sha512sums=('44d093f9e757d06d37dcf41f62b242214436285fbc74ab18f6a9e99701090959295484ace8d227f04afcd1470587d2f2a426a31ec7d424dbaa88f47396a85e9f')

build() {
  cd "${srcdir}/"
}

package() {
  cd "${srcdir}/"
  install -Dm755 "${srcdir}/juicefs-$pkgver-$pkgrel" "${pkgdir}/usr/bin/juicefs"
  ln -s "./juicefs" "${pkgdir}/usr/bin/mount.juicefs"
}
