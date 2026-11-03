# Maintainer: Neowutran <aur at neowutran dot ovh>
pkgname="dnssec-without-root"
pkgver="2026.11.03"
pkgrel=1
pkgdesc="DNSSEC keys without the '.' root"
arch=('any')
url='https://sr.ht/~yukikoo/dane_without_root/'
license=(AGPL-3.0-or-later)
validpgpkeys=('FB798BFB115895C9C95900649C2B29DD4A62ED27')
source=("git+https://git.sr.ht/~yukikoo/dane_without_root#tag=dnssec-${pkgver}?signed")
sha256sums=('8a8264a8636e8e2a3117d39b6af73f36611555ce215fa48aa9e5b1656b782077')

package() {
  cp -R "${srcdir}/dane_without_root/dnssec_keys/usr/" "${pkgdir}"
}
