# Maintainer: Neowutran <aur at neowutran dot ovh>
pkgname="dnssec-without-root"
pkgver="2026.10.09"
pkgrel=1
pkgdesc="DNSSEC keys without the '.' root"
arch=('any')
url='https://sr.ht/~yukikoo/dane_without_root/'
license=(AGPL-3.0-or-later)
validpgpkeys=('FB798BFB115895C9C95900649C2B29DD4A62ED27')
source=("git+https://git.sr.ht/~yukikoo/dane_without_root#tag=dnssec-${pkgver}?signed")
sha256sums=('d1b613c1a92c84e6ce1b5954914338adf37fa1b8c4a0387cf10245994dc37ba0')

package() {
  cp -R "${srcdir}/dane_without_root/dnssec_keys/usr/" "${pkgdir}"
}
