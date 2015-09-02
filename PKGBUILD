# Maintainer: Aaron France <aaron.l.france@gmail.com>

pkgname=django-lint
pkgrel=1
pkgver=1
pkgdesc="A static analysis tool for Django projects."
license=('GPLv3')
arch=('any')
url="https://github.com/lamby/django-lint"
provides=("django-lint")
source=('git://github.com/lamby/django-lint.git')
makedepdends=('git')
md5sums=('SKIP')
_gitname=django-lint

build() {
    return 0
}

package() {
  cd $_gitname
  python2 ./setup.py install --root=$pkgdir || return 1
}