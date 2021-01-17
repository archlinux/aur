# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=circuitjs1-web-bin
pkgver=20201006
pkgrel=2
pkgdesc="Falstad circuit simulator (CircuitJS1) - webapp"
arch=('any')
url="https://www.falstad.com/circuit/"

# The File->About dialog in the app states that it's distributed under a GPL2
# or later license.
license=('GPL2')

depends=()
provides=(circuitjs1-web)
conflicts=(circuitjs1-web)
source=(https://www.falstad.com/circuit/offline/circuitjs1-linux64.tgz)

# The offline binary releases are unversioned.
md5sums=(SKIP)

package() {
  cd "${srcdir}"/circuitjs1
  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -r resources/app/war "${pkgdir}/usr/share/webapps/circuitjs1"
}

# vim:ts=2:sw=2:et:
