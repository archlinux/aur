# Maintainer: Francisco Giordano <frangio.1@gmail.com>
# Contributor: Tobias Frilling <tobias@frilling-online.de>
# Contributor: Martino Visintin <vise890@gmail.com>
# Contributor: Marcel Campello <tucho@prafrentex.com.br>

# NOTE: This package only installs the boot executable found in
# https://github.com/boot-clj/boot-bin. The installation and updating of the
# boot framework itself is handled internally by this program. Because of this,
# the package version number corresponds to the executable.

pkgname=boot
pkgver=2.7.2
pkgrel=1
pkgdesc='A Clojure build framework and ad-hoc Clojure script evaluator'
arch=('any')
url='http://boot-clj.com'
license=('EPL')
depends=('java-environment' 'bash')
install='boot.install'
source=("https://github.com/boot-clj/boot-bin/releases/download/${pkgver}/boot.sh")
sha1sums=('f717ef381f2863a4cad47bf0dcc61e923b3d2afb')
noextract=('boot.sh')

package() {
  cd ${srcdir}
  install -m 755 -D boot.sh ${pkgdir}/usr/bin/boot
}
