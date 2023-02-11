# Maintainer: plokid <910576949@qq.com>
# 灵感来自https://blog.ruo-chen.wang/2021/08/bwrap-wps.html

pkgname=wps-office-bwrap
pkgver=1.0
pkgrel=2
pkgdesc="use bubblewrap sandbox to stop wpscloudsvr"
arch=('any')
url="https://blog.ruo-chen.wang/2021/08/bwrap-wps.html"
license=('custom')
depends=('wps-office' 'bubblewrap')
source=("wps-office-bwrap.desktop"
        "wps-bwrap")
sha256sums=('9bb5195bcbcf72621e5a1a7aeeb8a3c989378c54ad59617f6d068477114596d3'
            '370e2eaaaeb1abf3ffa103bf3b607f6d125cba1a749e2208b3a4584acdcf00c1')

package() {
  install -Dm664 $srcdir/wps-office-bwrap.desktop $pkgdir/usr/share/applications/wps-office-bwrap.desktop
  install -Dm775 $srcdir/wps-bwrap $pkgdir/usr/bin/wps-bwrap
}
