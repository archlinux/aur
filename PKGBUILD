# Maintainer: Martin Rys <rys.pw/#contact_me>

buildver="1132"

pkgname=jitsi-videobridge
pkgver=0.0.${buildver}
pkgrel=1
pkgdesc="Videobridge for Jitsi Meet"
arch=("any")
url="https://github.com/jitsi/jitsi-videobridge"
license=("Apache")
depends=("jdk8-openjdk")
replaces=()
optdepends=()
source=("https://download.jitsi.org/jitsi-videobridge/linux/jitsi-videobridge-linux-x64-${buildver}.zip")
backup=()
sha256sums=("2157d3872747ddae2360f47588327dbd4ed48e93a5b7f21cfccdd67341516077")


package() {
  install -d "${pkgdir}/opt"
  unzip -o jitsi-videobridge-linux-x64-${buildver}.zip
  cp -R "${srcdir}/jitsi-videobridge-linux-x64-${buildver}/" "${pkgdir}/opt/${pkgname}"
#  chown -R http:http /opt/jitsi-videobridge
}
