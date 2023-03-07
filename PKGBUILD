# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2df-res
pkgver=0.667
pkgrel=1
pkgdesc="Resources for Doom 2D: Forever"
arch=(any)
url="https://doom2d.org/"
license=('unknow')
group=(doom2df-full)
conflicts=(doom2df-git doom2df-bin-git)
source=(
  'https://deadsoftware.ru/files/terminalhash/doom2df-packages/d2df-res.zip'
)
md5sums=(
  '72fda0a8517f79a04a33a1ee43853f55'
)

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/usr/share/doom2df
  cp -r data maps wads "${pkgdir}"/usr/share/doom2df/
}
