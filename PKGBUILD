pkgname=fluxbox-style-numix
pkgver=20160415
pkgrel=1
pkgdesc="Numix style for Fluxbox"
url="https://github.com/corebob/fluxbox-style-numix"
license=('GPL3')
arch=('any')
source=("https://github.com/corebob/fluxbox-style-numix/archive/v0.1.zip")
md5sums=('3e9cb63be4310a404c6c386578c47759')

package() {
  mkdir -p "${pkgdir}/usr/share/fluxbox/styles/numix"
  cp -r ${srcdir}/fluxbox-style-numix-0.1/numix "${pkgdir}/usr/share/fluxbox/styles/"
}
