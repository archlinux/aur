# Maintainer: panda2134 <me@panda2134.site>
pkgname=thu-isatap
pkgver=1.0.0
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
sha256sums=('6d5f1f30c4ef97bf5964135f3e0dd4b61364cd45113f20eb44373f71a5b56226'
            '2be56263c9893bb109dabea296f0493ab3082c0e82b098127fd62f1daeabb26a')

package() {
  install -D -m755 "thu-isatap" "$pkgdir/usr/bin/thu-isatap"
  install -D -m644 "thu-isatap.service" "$pkgdir/usr/lib/systemd/system/thu-isatap.service"
}
