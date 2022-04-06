# Maintainer: purpleleaf <max@ganoia.eu>
pkgname=zzzfm-common-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="ZzzFM is a multi-panel tabbed file and desktop manager for Linux. This package contains files used by both the GTK+2 (zzzfm) and GTK+3 (zzzfm-gtk3) versions."
url="https://gitlab.com/skidoo/zzzfm"
arch=(x86_64)
source=("https://gitlab.com/antix-contribs/zzzfm/-/raw/contribs/deb-packages/zzzfm-common_1.0.7-6~contribs2_all.deb")
license=('GPL3')
sha256sums=('923d17cf15e7f0ffd06a98ab5ad92789ea9c36191b49312b9964710ec8eb68ca')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}
