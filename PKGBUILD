pkgname="pegasus-harvester"
pkgver="2.3.21"
pkgrel="1"
pkgdesc="Pegasus Harvester by Nanometrics."
arch=('x86_64')
options=('!debug')

source=("pegasus-harvester_2.3.21_amd64.deb")

sha256sums=("f88253eb40209e5442b65e3224a2903ac1f7d66c842fe6c15bdde552d264c99f")

package() {
    bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
}
