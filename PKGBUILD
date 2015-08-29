#Maintainer:xgdgsc

pkgname="tunet"
pkgver="2015"
pkgrel=1
pkgdesc="Tsinghua University network authentication client for Linux."
arch=("i686" "x86_64")
url="http://net.tsinghua.edu.cn"
license=('Unknown')
source=("http://net.tsinghua.edu.cn/files/Tunet2015_linux.rar" "TUNet.desktop" "logo.png")
md5sums=("c4c286c59a3baf453cc08c3654511ceb" "195dd8feecedd85aaef8e7b4a1c2884a" "e4c03714b61b1d3906865c08672348d9")
install='tunet.install'
# makedepends=('unrar')
# depends=('glib2')

package() {
  cd "${srcdir}"
  tar -xzvf Tunet2015.$CARCH.tgz
  mkdir -p "${pkgdir}/opt/TUNet"
  mkdir -p "${pkgdir}/usr/share/applications/"
  cp logo.png "${pkgdir}/opt/TUNet/"
  cp bin/Tunet2015* "${pkgdir}/opt/TUNet/"
  cp "${srcdir}/TUNet.desktop" "${pkgdir}/usr/share/applications/"
}
