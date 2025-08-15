# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=pm2ctrl-git
_commit=410fa7c65de8d9854ee90781f1841b5af6de6d74
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
