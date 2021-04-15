# Maintainer: Logan Koester <logan@logankoester.com>
pkgname=smaug
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to manage your DragonRuby Game Toolkit projects"
arch=('x86_64')
url="https://smaug.dev/"
license=('AGPL3')
depends=(gcc-libs openssl zlib)
optdepends=()
source=("https://github.com/ereborstudios/smaug/releases/download/v${pkgver}/smaug-linux")
noextract=()
sha512sums=('bc192356db079ca77937e58c6048ed491e1e844ef40a8306cd9658ea9a0d77d25faf0a21d41bd2776c59edd1a584e91976fd47267d59f3169d946c43be4e3ad4')

package() {
  cd $srcdir
  install -Dm755 "${pkgname}-linux" "${pkgdir}/usr/bin/${pkgname}"
}
