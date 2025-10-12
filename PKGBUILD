# Maintainer: Eric Zhao <21zhaoe@protonmail.com>
pkgbase=ttf-persepolis
pkgname=ttf-persepolis
pkgver=20210910
pkgrel=1
pkgdesc='Old Persian cuneiform font'
provides=(ttf-persepolis)
arch=(any)
url='https://www.hethport.uni-wuerzburg.de/cuneifont/'
license=('CC-BY-SA-4.0')
source=(https://www.hethport.uni-wuerzburg.de/cuneifont/download/OldPersian.zip)
sha256sums=('77f61d2089d860a1df8ec05ac6fa744ac276f264720779927a2daa09c5901c9c')

package_ttf-persepolis() {
  install -Dm644 Persepolis.ttf -t "$pkgdir"/usr/share/fonts/TTF/
}
