# Maintainers:
# Jonas Gierer <jonas@gierer.xyz>
# Ujjwal Sharma <ryzokuken@disroot.org>
# Elias Blume <mail at elias-blu.me>
pkgname=mdloader-bin
pkgver=1.0.7
pkgrel=1
pkgdesc="Massdrop Firmware Loader"
arch=('x86_64')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
makedepends=('unzip')
license=('GPL')
url="https://github.com/Massdrop/mdloader"
source=("${pkgname%-bin}-$pkgver.zip::https://github.com/Massdrop/mdloader/releases/download/${pkgver}/mdloader-Linux.zip")
md5sums=('267bbe9d4ce7641bbcc46812e3830010')

prepare() {
  # unzip
  unzip ${pkgname%-bin}-$pkgver.zip

}

package() {
  install -m0755 ${pkgname%-bin} -D $pkgdir/usr/bin/${pkgname%-bin}
}
