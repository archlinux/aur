# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-surge
_pkgname=${pkgname#nodejs-}
_gh_user=sintaxi
pkgver=0.20.1
pkgrel=1
pkgdesc='CLI for the surge.sh CDN'
arch=('i686' 'x86_64')
url="https://github.com/${_gh_user}/${_pkgname}"
license=('ISC')
depends=('nodejs')
makedepends=('npm')

package() {
  npm \
    install \
    --user root \
    --global \
    --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/npm-cache" \
    "${_pkgname}@${pkgver}"
}

# vim:set ts=2 sw=2 et:
