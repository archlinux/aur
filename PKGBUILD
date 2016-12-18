# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.6.2
pkgrel=1
pkgdesc="Json incremental digger"
url="https://github.com/simeji/jid"
arch=("x86_64")
license=("MIT")
provides=()
conflicts=()
depends=("glibc")
source=("https://github.com/simeji/jid/releases/download/${pkgver}/${_pkgname}_linux_amd64.zip")
sha256sums=('17bf8657edd74e570286018d86a4a8835ced0e9ea1ea79b5284f9caa9355275f')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/${_pkgname}_linux_amd64" "$pkgdir/usr/bin/${_pkgname}"
}

