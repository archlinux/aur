# Maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-chart"
pkgver="2.0.FK22M"
pkgrel=1
pkgdesc="Bitscope chart software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

_DSOPKG="http://www.bitscope.com/download/files/bitscope-chart_${pkgver}"
source_x86_64=("${_DSOPKG}_amd64.deb")
source_i686=("${_DSOPKG}_i386.deb")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
md5sums_i686=('027f2bf7334f820fe0da09087ef4030c')
md5sums_x86_64=('e6bfad01a858aa305795afacac0c5c32')
