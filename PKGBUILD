# Maintainer: sdvcrx <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.7.6
pkgrel=1
pkgdesc="Json incremental digger"
url="https://github.com/simeji/jid"
arch=("i686" "x86_64")
license=("MIT")
provides=("jid")
conflicts=("jid" "jid-git")
depends=("glibc")
source_i686=("https://github.com/simeji/jid/releases/download/v${pkgver}/${_pkgname}_linux_386.zip")
source_x86_64=("https://github.com/simeji/jid/releases/download/v${pkgver}/${_pkgname}_linux_amd64.zip")
sha256sums_i686=('e23f72e688d5808400d12d4050b6dfd2cf1ef31e8c53727cd05eb29e1313e033')
sha256sums_x86_64=('b5706cda44bc76c5db8a1e7956d25ef2e25bf618a7b03e1d98e8f4fc2e2f393a')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

