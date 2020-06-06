# Maintainer: Robert Cegliński <rob.ceglinski@gmail.com>

pkgname=firefox-h264ify
pkgver=1.1.0
pkgrel=1
pkgdesc='Makes YouTube stream H.264 videos instead of VP8/VP9 videos'
arch=('any')
url=https://github.com/erkserkserks/h264ify
license=('MIT')
source=("https://addons.mozilla.org/firefox/downloads/file/3398929/h264ify-${pkgver}-an+fx.xpi")
noextract=("${source##*/}")
sha256sums=('87bd3c4ab1a2359c01a1d854d7db8428b44316fef5b2ac09e228c5318c57a515')

package() {
  install -Dm644 "${source##*/}" "$pkgdir"/usr/lib/firefox/browser/extensions/jid1-TSgSxBhncsPBWQ@jetpack.xpi
}
