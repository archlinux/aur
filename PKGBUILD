# Maintainer: dag.robole at gmail dot com

pkgname=fluxbox-style-hellbent
pkgver=20151105
pkgrel=1
pkgdesc="Hellbent style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-hellbent"
license=('CCPL')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-hellbent/releases/download/v1.0/fluxbox-style-hellbent.zip")
md5sums=('31f824635b3b3fcba03479923d1006b2')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/hellbent/"
  cp -r ${srcdir}/fluxbox-style-hellbent-master/* "${pkgdir}/usr/share/fluxbox/styles/"
}
