# Maintainer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=warmroast
pkgver=1.0.0
_buildnum=4523
_filename="warmroast-${pkgver}-SNAPSHOT.jar"
pkgrel=1
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
  'd504fc1e7c109b54709e3496fb6e936fbeca9217395f83a694fc675822d6f387266dbcbd35528aead54c4bb050bf652279dc58150738093a980afeacb501cadb'
)

package() {
  install -m644 -D "${srcdir}/${_filename}" "${pkgdir}/usr/share/java/warmroast/warmroast.jar"
  install -m755 -D "${srcdir}/warmroast" "${pkgdir}/usr/bin/warmroast"
}