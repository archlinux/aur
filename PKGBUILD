# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=pm2ctrl-git
_commit=5497e849b86bb0d7874b6e755948010f019d07d9
pkgver=r${_commit:0:7}
pkgrel=1
pkgdesc="A PM2 wrapper script (PM2 needs to be installed maually)"
arch=('x86_64')
url="https://code.weexnes.dev/pm2ctrl"
license=('GPL3')
makedepends=()
depends=()
source=("${pkgname}-${_commit}.tar.gz::https://code.weexnes.dev/~downloads/projects/41/archives?revision=${_commit}&format=tgz")
sha256sums=('SKIP')



package() {
  install -Dm755 "${srcdir}/pm2ctrl.sh" "${pkgdir}/usr/bin/pm2ctrl"
}
