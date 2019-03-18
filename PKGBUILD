# Maintainer: sdvcrx <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.7.5
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
sha256sums_i686=('e122ead40f1e4afd18a358a383a242fdbff45b6c0c44182928f35ce20bf74569')
sha256sums_x86_64=('2df3bef019722bb2a4663252141cb0746f773287016427ae21f30553babadece')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

