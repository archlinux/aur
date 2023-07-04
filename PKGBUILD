# Maintainer: Sasasu <sasasu [at] archlinuxcn.org>

pkgname=juicefs
pkgver=4.3.8
pkgrel=1
pkgdesc="A shared POSIX file system for the cloud"
arch=('i686' 'x86_64')
url="https://juicefs.com/"
license=('custom')
depends=('python')
source=("juicefs-$pkgver-$pkgrel::https://juicefs.com/static/juicefs")
sha512sums=('7662f1b95c0a88e9ac93bcaffa06b49898f67172bc52d2ac0fb187158e8934ef39e703825850f4e3ba27e4caf40f4e2f7639db144356da3e64c18e5f5f2f37e6')

build() {
  cd "${srcdir}/"
}

package() {
  cd "${srcdir}/"
  install -Dm755 "${srcdir}/juicefs-$pkgver-$pkgrel" "${pkgdir}/usr/bin/juicefs"
  ln -s "/usr/bin/juicefs" "${pkgdir}/usr/bin/mount.juicefs"
}
