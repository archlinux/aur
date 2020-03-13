# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at pm dot me>
pkgname=pandemic2
pkgver=1
pkgrel=1
pkgdesc="Infect everyone in the world with your disease! Classic game played with flashplayerdebugger"
arch=('any')
url="http://www.pandemic2.org/"
license=('PROP')
depends=('flashplayer-standalone')
provides=("pandemic2")
md5sums=('265c1143e8d40cbdd86afad7045dc18f')
source=("${url}/pandemic2.swf")

prepare() {
        echo -e "#!/usr/bin/bash\nflashplayer /usr/share/pandemic2/pandemic2.swf" > pandemic2
}

package() {
  install -Dm755 "pandemic2" "${pkgdir}/usr/bin/pandemic2"
  install -Dm755 "pandemic2.swf" "${pkgdir}/usr/share/${pkgname}/pandemic2.swf"
}

# vim:set ts=2 sw=2 et:
