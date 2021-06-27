# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.3.2
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("$pkgname-$pkgver::https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('55c886d3ea674df62e0596f8ccba05cbabae24f5aa6805a626d274ed22fc91caa90b1a2c3f34ca7bd8590b95c57e273cfc0e4e260271961f50358158c411626d')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
