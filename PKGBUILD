pkgname=nodejs-graphite-cli
_pkgname=${pkgname#nodejs-}
pkgver=0.20.19
pkgrel=1
pkgdesc="graphite.dev terminal client"
arch=('any')
url="https://github.com/withgraphite/graphite-cli"
license=('AGPL-3.0')
depends=('nodejs')
makedepends=('npm')
options=(!strip)

package() {
  npm \
    install \
    --user root \
    --global    \
    --prefix "${pkgdir}/usr" \
    --cache  "${srcdir}/npm-cache" \
    "@withgraphite/${_pkgname}@${pkgver}"
}
