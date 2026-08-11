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
sha256sums=('7d570a62521ccb9161dfb1a5d390a093f11df5ac8dd6da70eb5d22374e234c9e')

package() {
  cp -R "${srcdir}/dane_without_root/dnssec_keys/usr/" "${pkgdir}"
}
