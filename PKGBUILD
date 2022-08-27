# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=nodejs-surge
_pkgname=${pkgname#nodejs-}
_gh_user=sintaxi
pkgver=0.23.1
pkgrel=1
pkgdesc='CLI for the surge.sh CDN'
arch=('any')
url="https://github.com/${_gh_user}/${_pkgname}"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
options=(!strip)

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
