# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instaaur
pkgver=2021.05.10
pkgrel=1
pkgdesc="A bach AUR wrapper"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
depends=('pacman' 'jshon' 'tar')
optdepends=('git: AUR4 git support')
provides=($pkgname)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('54a53d2eccf44934ce304a8660cc4aca1e5e77625780628e667c77844f9209a1')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 instaaur "${pkgdir}/usr/bin/instaaur"
  install -D -m644 instaaur.8 "${pkgdir}/usr/share/man/man8/instaaur.8"
  install -D -m644 instaaur.completion "${pkgdir}/etc/bash_completion.d/instaaur"
}
