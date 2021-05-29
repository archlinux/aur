# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.3.1
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('bef026f26ef1680d1ceeabe0b2f0d3855d5978d7a14e6a8a99784efa5a44f412ef167071813150bcd4dd1a88563b1cd870f8A6D7308143BEC7DA8560556fd744')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-linux" "${pkgdir}/usr/bin/${pkgname}"
}
