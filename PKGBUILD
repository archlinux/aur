# Maintainer: Tobias Frilling <tobias@frilling-online.de>
# Contributor: Martino Visintin <vise890@gmail.com>
pkgname=boot
pkgver=2.5.2
pkgrel=1
pkgdesc="A Clojure build framework and ad-hoc Clojure script evaluator"
arch=('any')
url="https://github.com/boot-clj/boot"
license=("EPL")
depends=('java-environment' 'bash')
source=("https://github.com/boot-clj/boot-bin/releases/download/2.4.2/boot.sh")
sha1sums=('e195caef87883c215e6bbfef5e6e6bd0adc9fbb8')


package() {
  cd ${srcdir}
  install -m 755 -D boot.sh ${pkgdir}/usr/bin/boot
}
