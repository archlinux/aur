# Maintainer: panda2134 <me@panda2134.site>
pkgname=thu-isatap
pkgver=1.1.6
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
sha256sums=('755bf6b06077bd3cfed4495b8b1dd7cb05a92d35d1144f0b089d8ae621b0d03d'
            '27b275120f8a17da9e458e1cf624406c260ce37af77b943fc9a55874e21c738b')
package() {
  install -D -m755 "thu-isatap" "$pkgdir/usr/bin/thu-isatap"
  install -D -m644 "thu-isatap.service" "$pkgdir/usr/lib/systemd/system/thu-isatap.service"
}
