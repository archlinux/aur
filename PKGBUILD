# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Leandro Kollenberger <lkollenberger at frba.utn.edu.ar>

pkgname=nmap-vulners
pkgver=1.2
pkgrel=1
pkgdesc="NSE script based on Vulners.com API"
arch=(any)
depends=(nmap)
url=https://github.com/vulnersCom/nmap-vulners
source=($url/archive/v$pkgver-release.tar.gz)
sha512sums=('ee999423dd6463469e9e83b3d46d901468767236352d0517df9f7cfab9b18e9b4f83718b859da6ec82d2f55956e666ff4569733adb74112a5fab5aeae33859c5')

package() {
  install -Dm 644 nmap-vulners-$pkgver-release/vulners.nse \
    -t "$pkgdir"/usr/share/nmap/scripts
}
