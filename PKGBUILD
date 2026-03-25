# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=socialstreamninja-bin
pkgver=0.3.98
pkgrel=1
pkgdesc="A complete chat ecosystem across social media platforms"
arch=('x86_64')
url="https://github.com/steveseguin/social_stream"
license=('GPL-3.0')
options=('!strip') # needed to avoid stripping the AppImage
source=("https://github.com/steveseguin/social_stream/releases/download/${pkgver}/socialstreamninja_linux_v${pkgver}_x86_64.AppImage")
sha256sums=("915688eeb11cdeea266f1b2a53c6044f36ecb822cd8461746f5819bd41e9de1a")

package() {
	install -Dm755 "socialstreamninja_linux_v${pkgver}_x86_64.AppImage" "${pkgdir}/usr/bin/socialstreamninja"
}
