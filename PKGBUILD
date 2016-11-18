# Maintainer: ThePilot <afuturepilotis at gmail dot com>
pkgname=rave-x-colors
pkgver=2.1
pkgrel=4
pkgdesc="A punchy, elegant icon theme in 12 awesome colors"
arch=('any')
url="http://www.ravefinity.com/p/rave-x-icon-theme.html"
license=('CCPL:by-sa' 'GPL2')
options=('!strip')
_debpkg=rave-x-colors-icons_2.1-trusty-Noobslab.com_all.deb
source=("${_debpkg}::https://drive.google.com/uc?export=download&id=0B7iDWdwgu9QAQmxySUdpT3FIbmM")
sha256sums=('e313361039d22b8c917f6bf650fed5446597430a4e25599b0c55d46117285761')

prepare() {
  tar -xf data.tar.xz
}

package() {
 install -d "$pkgdir"/usr/share/icons
 cp -r usr/share/icons/* "$pkgdir"/usr/share/icons
}
