# Maintainer: Sasasu <sasasu [at] archlinuxcn.org>

pkgname=juicefs-cloud
pkgver=4.9.11
pkgrel=1
pkgdesc="A shared POSIX file system for the cloud"
arch=('i686' 'x86_64')
url="https://juicefs.com/"
license=('custom')
depends=('python')
source=("juicefs-$pkgver-$pkgrel::https://juicefs.com/static/juicefs")
sha512sums=('c4bfcb9c8e8a019b96ec34638e2180b1f87f87c448a6d7e1a91ee42dee32c0ffb3a038928a9d2671aa1c59f2a8217d29797182f3de51680845d12752eb14514e')

build() {
  cd "${srcdir}/"
}

package() {
  cd "${srcdir}/"
  install -Dm755 "${srcdir}/juicefs-$pkgver-$pkgrel" "${pkgdir}/usr/bin/juicefs"
  ln -s "/usr/bin/juicefs" "${pkgdir}/usr/bin/mount.juicefs"
}
