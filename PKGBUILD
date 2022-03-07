# Maintainer: panda2134 <me@panda2134.site>
pkgname=thu-isatap
pkgver=1.1.7
pkgrel=1
pkgdesc="Creating an ISATAP IPv6 tunnel to Tsinghua ISATAP Server"
url="https://github.com/panda2134/thu-isatap"
arch=('any')
license=('GPL')
depends=(iproute2 bash grep sed)
provides=(thu-isatap)
conflicts=(thu-isatap)
source=("https://github.com/panda2134/thu-isatap/raw/v$pkgver/thu-isatap"
        "https://github.com/panda2134/thu-isatap/raw/v$pkgver/thu-isatap.service")
package() {
  install -D -m755 "thu-isatap" "$pkgdir/usr/bin/thu-isatap"
  install -D -m644 "thu-isatap.service" "$pkgdir/usr/lib/systemd/system/thu-isatap.service"
}
