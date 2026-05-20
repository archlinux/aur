# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=socialstreamninja-bin
pkgver=0.3.113
pkgrel=1
pkgdesc="A complete chat ecosystem across social media platforms"
arch=('x86_64')
url="https://github.com/steveseguin/social_stream"
license=('GPL-3.0')
options=('!strip') # needed to avoid stripping the AppImage
source=("https://github.com/steveseguin/social_stream/releases/download/v${pkgver}/socialstreamninja_linux_v${pkgver}_x86_64.AppImage")
sha256sums=("28afe38913bb22ce1ba3be6c23ec61d05f2af1693c7e3b09f0cf705d62b870c6")

package() {
	install -Dm755 "socialstreamninja_linux_v${pkgver}_x86_64.AppImage" "${pkgdir}/usr/bin/socialstreamninja"
}
