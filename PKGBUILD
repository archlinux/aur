# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.2.3
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('49ca4f56c2a460837ad93116273e19cd020eb9a266c5cf650c68b45564f0a5676d8435d86454959896eb10562544ae9bab3dbb3e5e7b47b9039a76c1c1812de8')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-linux" "${pkgdir}/usr/bin/${pkgname}"
}
