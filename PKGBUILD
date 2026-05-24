# Maintainer: Olivia Mackintosh <liv@base.nu>

pkgname=cartridge-sampler-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A versatile sampler/slicer built around four playback modes — from quick one-shots to fully sliced loops with MIDI export. Works in any modern DAW, with extra integration goodies for Reaper."
arch=(x86_64)
url="https://dsgdnb.com/plugins/cartridge"
license=()
groups=(vst3-plugins lv2-plugins)
makedepends=(git)
provides=(cartridge-sampler)
source=("Cartridge-v0.7.0-linux.zip::https://drive.usercontent.google.com/download?id=1vjEXgd1LSbT0q8yZcRh2VGB6OmNBu2M3&export=download&authuser=1")
sha256sums=('0ba19de19c68b708ce9e6313647c00229370d46c9dd338cd51b84562287de965')

package() {
  mkdir -p $pkgdir/usr/lib/{vst3,lv2}
  cp -r LV2/* $pkgdir/usr/lib/lv2/
  cp -r VST3/* $pkgdir/usr/lib/vst3/
}
