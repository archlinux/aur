# Maintainer: Neowutran <aur at neowutran dot ovh>
pkgname="dnssec_without_root"
pkgver="2026.08.12"
pkgrel=1
pkgdesc="DNSSEC keys without the '.' root"
arch=('any')
url='https://sr.ht/~yukikoo/dane_without_root/'
license=(AGPL-3.0-or-later)
validpgpkeys=('FB798BFB115895C9C95900649C2B29DD4A62ED27')
source=("git+https://git.sr.ht/~yukikoo/dane_without_root#tag=dnssec-${pkgver}?signed")
sha256sums=('c3a3dc02344712cd4791494c75350da600bec970b06d9ce4077d3dca2e4e3339')

package() {
  cp -R "${srcdir}/dane_without_root/dnssec_keys/usr/" "${pkgdir}"
}
