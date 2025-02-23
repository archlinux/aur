# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2df-res
pkgver=0.667
pkgrel=8
pkgdesc="Resources for Doom 2D: Forever"
arch=(any)
url="https://doom2d.org/"
license=('unknow')
group=(doom2df-full)
conflicts=(doom2df-git doom2df-bin-git)
source=(
  'https://deadsoftware.ru/files/terminalhash/doom2df-packages/d2df-res.zip'
  'https://deadsoftware.ru/files/terminalhash/doom2df-packages/instruments.tar.xz'
)
md5sums=(
  '8ad6ee1e2edd2cbaa3094048c7bf7c1d'
  '583c086205aec0d0257fdcb8c2f3c817'
)

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/usr/share/doom2df
  cp -r data maps wads instruments timidity.cfg "${pkgdir}"/usr/share/doom2df/
}
