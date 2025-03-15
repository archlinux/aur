pkgname=farsidic
pkgver=1.0
pkgdesc="A simple farsi dictionary"
url="https://github.com/mohammadrostamiorg/farsidic"
arch=('any')
license=('GPL-3')
maintainer="Mohammad Rosstami <mohammad.jayant@gmail.com>"
source=("script.sh" "https://raw.githubusercontent.com/MohammadRostamiorg/farsidic/refs/heads/master/index.json")
depends=('bash' 'coreutils' 'jq')
pkgrel=1
sha256sums=("SKIP" "SKIP")
package() {
  install -Dm755 script.sh "${pkgdir}/usr/bin/farsidic"
  install -Dm644 index.json "${pkgdir}/etc/farsidic/index.json"
}
