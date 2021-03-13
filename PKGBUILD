# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.2.1
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('ac846a428e923bfb602381a1fc059b511efcb59717a575f6d03c69698dfd44bbf812a93fa87783f891f6a195e908b05989b5fd6838d95792d247794bd67cfe97')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-linux" "${pkgdir}/usr/bin/${pkgname}"
}
