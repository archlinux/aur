# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=circuitjs1-electron
pkgver=20210116
pkgrel=1
pkgdesc="Electron app for Falstad circuit simulator (CircuitJS1)"
arch=('any')
license=('MIT')
depends=(circuitjs1-web electron)
source=(circuitjs1-electron)
sha512sums=('df3e8e56330bafafcec822152f69ef2fb7633c2ae9ee910daf14458fd6c7074de0cde1352e2c5df864496499a7c25d0931d8283f03ac9623ca64375858663cc5')

package() {
  cd "${srcdir}"
  install -D -m 755 -t "${pkgdir}/usr/bin" circuitjs1-electron
}

# vim:ts=2:sw=2:et:
