# Maintainer: Martin Rys <rys.pw/#contact_me>

# Latest build ver as per https://download.jitsi.org/jitsi-videobridge/linux/
buildver="1132"

pkgname=jitsi-videobridge
pkgver=0.0.${buildver}
pkgrel=1
epoch=
pkgdesc="Videobridge for Jitsi Meet"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-videobridge"
license=("Apache")
groups=()
depends=("jdk8-openjdk")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.jitsi.org/jitsi-videobridge/linux/jitsi-videobridge-linux-x64-${buildver}.zip")
noextract=()
sha256sums=("2157d3872747ddae2360f47588327dbd4ed48e93a5b7f21cfccdd67341516077")
validpgpkeys=()

package() {
  install -d "${pkgdir}/opt"
  unzip -o jitsi-videobridge-linux-x64-${buildver}.zip
  cp -R "${srcdir}/jitsi-videobridge-linux-x64-${buildver}/" "${pkgdir}/opt/${pkgname}"
}
