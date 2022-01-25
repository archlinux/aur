# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("$pkgname-$pkgver::https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('0087b15c12f6f4e8f50dc5e11f3dd35ed5f724320f5d4ec402344a7514167b71745b21c627f8971c1068dd654027321cc98f77f5a6b84f816b59d05cc2f545c8')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
