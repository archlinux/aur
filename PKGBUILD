# Maintainer: CyrIng <xfreq[at]cyring[dot]fr>
# Contributor: CyrIng <xfreq[at]cyring[dot]fr>
pkgname=twm-xfreq
pkgver=0.08
pkgrel=2
pkgdesc="A customized Twm for XFreq"
arch=(any)
license=('GPL')
url="http://github.com/cyring/xdm-xfreq"
depends=('xdm-xfreq' 'xorg-twm')
optdepends=('xscreensaver')
backup=()
source=(twm-xfreq.desktop
	start-twm-xfreq)
md5sums=('SKIP'
	 'SKIP')

package() {
  install -Dm0644 ${srcdir}/twm-xfreq.desktop ${pkgdir}/usr/share/xsessions/twm-xfreq.desktop
  install -Dm755 ${srcdir}/start-twm-xfreq ${pkgdir}/usr/bin/start-twm-xfreq
}
