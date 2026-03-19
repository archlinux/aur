pkgname="trae-cn"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="trae-cn"
arch=("x86_64")
source=("Trae CN-linux-x64.rpm")
sha256sums=("SKIP")
options=('!strip' '!debug')
source=(https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.13343/linux/Trae%20CN-linux-x64.rpm)

package() {
  cd "$srcdir"
  cp -a --no-preserve=ownership usr "$pkgdir/"
}
