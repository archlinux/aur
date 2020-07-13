# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=liar
pkgver=0.1
pkgrel=1
pkgdesc='Linux Installer for Archives (liar) is an easy to use command to install, list and remove software packaged as an archive on Linux systems'
arch=('any')
url='https://framagit.org/grumpyf0x48/liar'
license=('GPL3')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::https://framagit.org/grumpyf0x48/liar/-/archive/${pkgver}/liar-${pkgver}.tar.gz")
sha256sums=('befe9358b85512723bf68befbc2443b068ba43c4c1af09c25a9ac4f277e04535')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 liar-completion -t "${pkgdir}/etc/bash_completion.d"
  install -Dm755 liar -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et: