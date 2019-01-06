# Maintainer: sdvcrx <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.7.3
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
sha256sums_i686=('e5cbf764753ed1b84217241887a59a6a9bd104acdfdaca1cc9c71ff03f1ecf16')
sha256sums_x86_64=('8345855bbf1d99f0164964075be396bda58b96a5e27720a9a044ade45626c646')

package() {
  cd "${srcdir}"

  install -Dm755 "${srcdir}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}

