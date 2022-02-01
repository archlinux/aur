# Maintainer: midvalley <aur@minskio.co.uk>
# -*- mode: sh -*-

pkgname='media-sort-bin'
_pkgname=${pkgname%%-bin}
pkgver=2.6.2
pkgrel=1
pkgdesc='Automatically organise your movies and tv series (pre-compiled)'
arch=('x86_64')
url='https://github.com/jpillora/media-sort'
license=('MIT') # https://github.com/jpillora/media-sort/blob/master/LICENSE
options=('!strip' '!emptydirs')
provides=('media-sort')
conflicts=('media-sort')
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.gz")
sha256sums=('f7422e394d776e36c56983633ebb7ec878332cbc8b93645f4eb36e96dc0d6720')

package() {
  install -Dm755 "${_pkgname}_${pkgver}_linux_amd64" "$pkgdir/usr/bin/media-sort"
}

# eof
