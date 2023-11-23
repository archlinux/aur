# Maintainer: jinzhongjia <mail@nvimer.org>
_version=17.0.9
_patch=b1087.7
_pkgname=jbr_jcef-${_version}-linux-x64-${_patch}
pkgname=jbr17-imfix
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="jetbrains runtime environment with imfix patch"
arch=(x86_64)
url="https://github.com/AlanSune/JetBrainsRuntime-for-Linux-x64"
license=('GPL')
source=("https://github.com/AlanSune/JetBrainsRuntime-for-Linux-x64/releases/download/jbr-release-${_version}${_patch}/$_pkgname.tar.gz")
sha256sums=('947372efd90474c9891619ecd3038bdd72842c6b11129ccae507b8c390153a77')

package() {
  cd "${_pkgname}"

  install -d "${pkgdir}"/usr/lib/jvm/jbr17-imfix

  cp -r ./* "${pkgdir}"/usr/lib/jvm/jbr17-imfix
}
