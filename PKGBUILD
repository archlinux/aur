# Maintainer edu4rdshl

_pkgname=simpleaur
pkgname=simpleaur-git
pkgver=34.d438f7e
pkgrel=1
pkgdesc="simpleaur, a AUR helper that does not require extra dependences."
arch=('any')
url="https://gitlab.com/edu4rdshl/simpleaur"
license=('GPL3')

depends=(
         'git'
        )
optdepends=(
'cower: search for available updates (simplecheck) and package search (simpleaur) - recommended'
            )

source=('git+https://gitlab.com/edu4rdshl/simpleaur.git')
sha256sums=('SKIP')

package() {
  cd "$_pkgname"
  install -m 755 -D "$_pkgname" "$pkgdir/usr/bin/${_pkgname}"
  install -m 755 -D "simplecheck" "$pkgdir/usr/bin/simplecheck"
  install -m 755 -D "simplesearch" "$pkgdir/usr/bin/simplesearch"
}
