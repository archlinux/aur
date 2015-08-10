# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=boot
pkgver=2.2.0
pkgrel=1
pkgdesc="A Clojure build framework and ad-hoc Clojure script evaluator"
arch=('any')
url="https://github.com/boot-clj/boot"
license=("EPL")
depends=('java-environment' 'bash')
source=("https://github.com/boot-clj/boot/releases/download/$pkgver/boot.sh")
sha1sums=('0137bd6204ef939b5d596c8569426105eb696249')

package() {
  cd ${srcdir}
  install -m 755 -D boot.sh ${pkgdir}/usr/bin/boot
}
