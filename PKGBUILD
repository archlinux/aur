# Maintainer: Marcel Campello Ferreira <tucho@prafrentex.com.br>
pkgname=customizepkg
pkgver=0.0.1
pkgrel=1
pkgdesc="A new attempt at evolving customizepkg."
arch=(any)
url=https://github.com/tucho/customizepkg
license=(none)
depends=(bash)
provides=(customizepkg)
conflicts=(customizepkg-git customizepkg-patching custpmizepkg-scripting)
backup=(etc/customizepkg.d/)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(313be366a0fa6c20de5618f3c3896608891ff2e382ffff06ea8ff7cf9a98bab6)

package() {
  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/customizepkg ${pkgdir}/usr/bin/customizepkg
  mkdir -p ${pkgdir}/etc/customizepkg.d/
}
