# Maintainer: Francisco Giordano <frangio.1@gmail.com>
# Contributor: Tobias Frilling <tobias@frilling-online.de>
# Contributor: Martino Visintin <vise890@gmail.com>
pkgname=boot
pkgver=2.7.0
pkgrel=2
pkgdesc='A Clojure build framework and ad-hoc Clojure script evaluator'
arch=('any')
url='https://github.com/boot-clj/boot'
license=('EPL')
depends=('java-environment' 'bash')
install='boot.install'
source=('https://github.com/boot-clj/boot-bin/releases/download/2.5.2/boot.sh')
noextract=('boot.sh')
sha1sums=('d9cbefc6cbf043361a58b416e6d62fc80e5ead32')

package() {
  cd ${srcdir}
  install -m 755 -D boot.sh ${pkgdir}/usr/bin/boot
}
