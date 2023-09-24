# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2df-res
pkgver=0.667
pkgrel=7
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
  'a6d2a935c3ff4fbb59a7040c95f02abb'
  '583c086205aec0d0257fdcb8c2f3c817'
)

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/usr/share/doom2df
  cp -r data maps wads instruments timidity.cfg "${pkgdir}"/usr/share/doom2df/
}
