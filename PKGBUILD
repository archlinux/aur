# Maintainer: Amir M. Joshaghani <amjoshaghani@gmail.com>
pkgname='pfshare'
pkgver='0.0.2'
pkgrel='1'
pkgdesc='Graphical User Interface for the PFShare project.'
arch=("x86_64")
source=("https://github.com/AMJoshaghani/pfshare-app/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=("1c9ee686141b2cd9d2049cd32a916251e24b7c986209b952d3e4b0789e21a8057895c19e2d759263b376c6f9ec2923ee8eb3f57af2377772785a0aa52b8a2549")

package(){
	bsdtar -C "${pkgdir}" -xJf "${pkgname}-${pkgver}.tar.xz"
}