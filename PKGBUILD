# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# vim:set ts=2 sw=2 et:

pkgname=airwindows-consolidated-bin
pkgver=0.2.0
pkgrel=1
_airwin="2025-07-13-dc94a5b"
epoch=
pkgdesc="The entirety of the Airwindows collection, as LV2 and VST3."
arch=('x86_64')
url="https://www.airwindows.com/consolidated/"
license=('GPL3')
groups=(clap-plugins lv2-plugins pro-audio vst3-plugins)
depends=()
checkdepends=()
optdepends=()
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
replaces=()
backup=()
options=()
install=
changelog=
source=("AirwindowsConsolidated-${_airwin}-Linux.zip::https://github.com/baconpaul/airwin2rack/releases/download/DAWPlugin/AirwindowsConsolidated-${_airwin}-Linux.zip")
sha256sums=('2fb4e1a1d25d6ea2d5ef428a4211744f56cbb71af282ac90d18b22a0326a84eb')

package() {
  mkdir -p "$pkgdir/usr/lib/clap" "$pkgdir/usr/lib/lv2" "$pkgdir/usr/lib/vst3"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.clap" "$pkgdir/usr/lib/clap/"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.lv2" "$pkgdir/usr/lib/lv2/"
  cp -r "${srcdir}/awcons-products/Airwindows Consolidated.vst3" "$pkgdir/usr/lib/vst3/"
}

