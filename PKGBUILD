# Maintainer: Jun Yang <harttleharttle@gmail.com>

pkgname=fsed
pkgver=latest
pkgrel=1
pkgdesc="Rename files in batch using sed syntax"
arch=('x86_64')
url="https://github.com/harttle/fsed"
license=('MIT')
depends=('sed' 'coreutils')
provides=("${pkgname}")
conflicts=("${pkgname}")
pkgbase=fsed

package() {
  mv "fsed" "${pkgdir}/usr/bin"
}

sha256sums=('SKIP') 