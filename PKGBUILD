# Maintainer: Tobias Frilling <tobias@frilling-online.de>
# Contributor: Martino Visintin <vise890@gmail.com>
pkgname=boot
pkgver=2.5.3
pkgrel=1
pkgdesc="A Clojure build framework and ad-hoc Clojure script evaluator"
arch=('any')
url="https://github.com/boot-clj/boot"
license=("EPL")
depends=('java-environment' 'bash')
source=("https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh")
sha1sums=('d9cbefc6cbf043361a58b416e6d62fc80e5ead32')

package() {
  cd ${srcdir}
  install -m 755 -D boot.sh ${pkgdir}/usr/bin/boot
}
