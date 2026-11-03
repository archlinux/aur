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
sha256sums=('5a2a79bf95cfc9c2e3cf377f2c85cec614cf27bb1af9e57d8ab70e7551c5c666')

package() {
  cp -R "${srcdir}/dane_without_root/dnssec_keys/usr/" "${pkgdir}"
}
