# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("$pkgname-$pkgver::https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('dfd02fdf2f3ce00af5e69214e91f3b2433e9f9f3594d8b7655f770f94e632e43bfe8745fb6e88cb07679af22a5eb86f0532c8605344f44b09c6879f7d79cf68e')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
