# Maintainer: Eric Zhao <21zhaoe@protonmail.com>
pkgbase=ttf-assurbanipal
pkgname=ttf-assurbanipal
pkgver=20210910
pkgrel=1
pkgdesc='Neo-Assyrian cuneiform font'
provides=(ttf-assurbanipal)
arch=(any)
url='https://www.hethport.uni-wuerzburg.de/cuneifont/'
license=('CC-BY-SA-4.0')
source=(https://www.hethport.uni-wuerzburg.de/cuneifont/download/Assurbanipal.ttf)
sha256sums=('92d605a8fd2b6be31ddad63d32eb5e3fd1aa3a2b0138fab4bb5f6c10bbda5df6')

package_ttf-assurbanipal() {
  install -Dm644 Assurbanipal.ttf -t "$pkgdir"/usr/share/fonts/TTF/
}
