# Maintainer: jinzhongjia <mail@nvimer.org>
_version=17.0.8.1
_patch=b1080.1
_pkgname=jbr_jcef-${_version}-linux-x64-${_patch}
pkgname=jbr17-imfix
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="jetbrains runtime environment with imfix patch"
arch=(x86_64)
url="https://github.com/AlanSune/JetBrainsRuntime-for-Linux-x64"
license=('GPL')
source=("https://github.com/AlanSune/JetBrainsRuntime-for-Linux-x64/releases/download/jbr-release-${_version}${_patch}/$_pkgname.tar.gz")
sha256sums=('4409917fd1df80d0dcc157ad4e1bef8e45807d761bcdb2b2fd5a106600df8b08')

package() {
  cd "${_pkgname}"

  install -d "${pkgdir}"/usr/lib/jvm/jbr17-imfix

  cp -r ./* "${pkgdir}"/usr/lib/jvm/jbr17-imfix
}
