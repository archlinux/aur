# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.5.1
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("$pkgname-$pkgver::https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('d4cac47799725c4d1e8ab2e5d0901cc0caba3b9d1bbcab5bf86b03a30066b6d51972c7758b28ecedc513af5e688cc2ed83a966d8d17679183aa425b2ce3ec5ba')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
