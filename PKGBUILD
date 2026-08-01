# Maintainer: Neowutran <aur at neowutran dot ovh>
pkgname="dnssec-without-root"
pkgver="2026.08.01"
pkgrel=1
pkgdesc="DNSSEC keys without the '.' root"
arch=('any')
url='https://sr.ht/~yukikoo/dane_without_root/'
license=(AGPL-3.0-or-later)
validpgpkeys=('FB798BFB115895C9C95900649C2B29DD4A62ED27')
source=("git+https://git.sr.ht/~yukikoo/dane_without_root#tag=dnssec-$pkgver")
sha256sums=('3a7e495920424c5d8d078f4e112328be187575df695d80bbb5118edfc30603aa')

package() {
  cp -R "${srcdir}/dane_without_root/dnssec_keys/usr/" "${pkgdir}"
}
