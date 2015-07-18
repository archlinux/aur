# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=boot
pkgver=2.0.0.1
pkgrel=1
pkgdesc="A Clojure build framework and ad-hoc Clojure script evaluator"
arch=('any')
url="https://github.com/boot-clj/boot"
license=("EPL")
depends=('java-environment' 'bash')
source=("https://github.com/boot-clj/boot/releases/download/2.0.0/boot.sh")
sha1sums=('e493aa8350bfe2aba48749774b7d6bfcc02bcf3a')

package() {
  cd ${srcdir}
  install -m 755 -D boot.sh ${pkgdir}/usr/bin/boot
}
