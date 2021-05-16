# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instaaur
pkgver=2021.05.16
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
sha256sums=('a750cd78b8e787cf37dc0ada683770c8d29503f78d20c0065c2d27fab6c5ad60')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 instaaur "${pkgdir}/usr/bin/instaaur"
  install -D -m644 instaaur.8 "${pkgdir}/usr/share/man/man8/instaaur.8"
  install -D -m644 instaaur.completion "${pkgdir}/etc/bash_completion.d/instaaur"
}
