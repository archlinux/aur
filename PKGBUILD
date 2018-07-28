# Maintainer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=warmroast
pkgver=1.0.0
_buildnum=4523
_filename="warmroast-${pkgver}-SNAPSHOT.jar"
pkgrel=2
pkgdesc="An easy-to-use CPU sampling tool for JVM applications, but particularly suited for Minecraft servers/clients."
arch=('any')
url="https://github.com/sk89q/WarmRoast"
license=('GPL')
depends=('java-environment')
source=(
  "http://builds.enginehub.org/job/warmroast/${_buildnum}/download/${_filename}"
  'warmroast'
)
sha512sums=(
  'e458dbb46eff8dcafdeb417fc5681c376947937eb4cf40019903d14088a56195359f00b0e881aacef7e8ad4060cdaad42a70e839376507f6dbd8b3f939b912aa'
  '8d221ed2a6014b70c17a0428869c45a022e0ea15697c9866b7ecaa6014300a5c1ba437011dcb5b09efa941b9261a4e1ab45c71e1d6e289a9b2b514f057c17068'
)

package() {
  install -m644 -D "${srcdir}/${_filename}" "${pkgdir}/usr/share/java/warmroast/warmroast.jar"
  install -m755 -D "${srcdir}/warmroast" "${pkgdir}/usr/bin/warmroast"
}