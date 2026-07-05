# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=socialstreamninja-bin
pkgver=0.3.128
pkgrel=1
pkgdesc="A complete chat ecosystem across social media platforms"
arch=('x86_64')
url="https://github.com/steveseguin/social_stream"
license=('GPL-3.0')
options=('!strip') # needed to avoid stripping the AppImage
source=("https://github.com/steveseguin/social_stream/releases/download/v${pkgver}/socialstreamninja_linux_v${pkgver}_x86_64.AppImage")
sha256sums=("20a8d23f3629ed44f51155e92634b9fade5617bc1a7941ee12fbacde3778b49a")

package() {
	install -Dm755 "socialstreamninja_linux_v${pkgver}_x86_64.AppImage" "${pkgdir}/usr/bin/socialstreamninja"
}
