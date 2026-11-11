# Maintainer: Neowutran <aur at neowutran dot ovh>
pkgname="dnssec-without-root"
pkgver="2026.11.11"
pkgrel=1
pkgdesc="DNSSEC keys without the '.' root"
arch=('any')
url='https://sr.ht/~yukikoo/dane_without_root/'
license=(AGPL-3.0-or-later)
validpgpkeys=('FB798BFB115895C9C95900649C2B29DD4A62ED27')
source=("git+https://git.sr.ht/~yukikoo/dane_without_root#tag=dnssec-${pkgver}?signed")
sha256sums=('7fa5e141b616992f43c4908d9b357e56091b665cf6b8ebbac406b6648fc591a5')

package() {
  cp -R "${srcdir}/dane_without_root/dnssec_keys/usr/" "${pkgdir}"
}
