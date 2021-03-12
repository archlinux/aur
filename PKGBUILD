# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.2.0
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('c564f9cab51740e9acb26c57c48ca31e2a662f993bd63d2f5662173c13ddd554a1e84bd57f8af71db6e44d518e2d1f79ee65ea56ae6273bfb8907449c3fa9a9a')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-linux" "${pkgdir}/usr/bin/${pkgname}"
}
