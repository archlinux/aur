# Maintainer edu4rdshl
_pkgname=simpleaur
pkgname=simpleaur-git
pkgver=57.14b708a
pkgrel=1
pkgdesc='simpleaur, a AUR helper that does not require extra dependences.'
arch=('any')
url="https://gitlab.com/edu4rdshl/simpleaur"
license=('GPL3')
makedepends=('git')
optdepends=('auracle: search for available updates and package names - recommended')
source=("git+https://gitlab.com/edu4rdshl/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_pkgname

  install -m 755 -D $_pkgname "$pkgdir/usr/bin/$_pkgname"
}

