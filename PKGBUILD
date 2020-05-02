pkgname=poshinit
pkgver=2.0
pkgrel=1
pkgdesc="Set up a reusable shell environment for Bash/Zsh across BSD/Linux/Cygwin"
arch=(x86_64)
license=(GPL)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bourne-again/${pkgname}/archive/${pkgver}.tar.gz")

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1
}
md5sums=('2be4cdc7ae71dc0f2c2096d4f133766b')
