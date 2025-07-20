# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# vim:set ts=2 sw=2 et:

pkgname=airwindows-consolidated-bin
pkgver=2025.07.19.6d00a9d
_airwin="2025-07-19-6d00a9d"
pkgrel=1
pkgdesc="The entirety of the Airwindows collection as LV2, VST3, and CLAP."
arch=('x86_64')
url="https://www.airwindows.com/consolidated/"
license=('GPL3')
groups=(clap-plugins lv2-plugins pro-audio vst3-plugins)
conflicts=(airwindows-consolidated-git)
source=("AirwindowsConsolidated-${_airwin}-Linux.zip::https://github.com/baconpaul/airwin2rack/releases/download/DAWPlugin/AirwindowsConsolidated-${_airwin}-Linux.zip")
sha256sums=('0a12e14b2285b7b485e1f2394fa1028f56a8a3b260f39820f81aaa86172949c6')

package() {
  mkdir -p "$pkgdir/usr/lib/clap" "$pkgdir/usr/lib/lv2" "$pkgdir/usr/lib/vst3"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.clap" "$pkgdir/usr/lib/clap/"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.lv2" "$pkgdir/usr/lib/lv2/"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.vst3" "$pkgdir/usr/lib/vst3/"
}

