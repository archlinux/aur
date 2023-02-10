# Maintainer: plokid <910576949@qq.com>
# 灵感来自https://blog.ruo-chen.wang/2021/08/bwrap-wps.html

pkgname=wps-office-bwrap
pkgver=1.0
pkgrel=1
pkgdesc="use bubblewrap sandbox to stop wpscloudsvr"
arch=('any')
url="https://blog.ruo-chen.wang/2021/08/bwrap-wps.html"
license=('custom')
depends=('wps-office' 'bubblewrap')
source=("wps-office-bwrap.desktop"
        "wps-bwrap")
sha256sums=('9bb5195bcbcf72621e5a1a7aeeb8a3c989378c54ad59617f6d068477114596d3'
            '6f449ba7f78365f81d6d8dd1f4624deb4c799e965773e75cd805ed37a31f6166')

package() {
  install -Dm664 $srcdir/wps-office-bwrap.desktop $pkgdir/usr/share/applications/wps-office-bwrap.desktop
  install -Dm775 $srcdir/wps-bwrap $pkgdir/usr/bin/wps-bwrap
}
