# Maintainer: jinzhongjia <mail@nvimer.org>
_pkgname=jbr_jcef-17.0.8.1-linux-x64-b1059.3
pkgname=jbr17-imfix
pkgver=17.0.8.1b1059.3
pkgrel=1
pkgdesc="jetbrains runtime environment with imfix patch"
arch=(x86_64)
url="https://github.com/AlanSune/JetBrainsRuntime-for-Linux-x64"
license=('GPL')
source=("https://github.com/AlanSune/JetBrainsRuntime-for-Linux-x64/releases/download/jbr-release-17.0.8.1b1059.3/jbr_jcef-17.0.8.1-linux-x64-b1059.3.tar.gz")
sha256sums=('36f54fb0de35e9a0386daf9e254b1a40b06dec4db8c32457894cace563aa866b')

package() {
  cd "$_pkgname"

  install -d "$pkgdir"/usr/lib/jvm/jbr17-imfix

  cp -r ./* "$pkgdir"/usr/lib/jvm/jbr17-imfix
}
