# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=socialstreamninja-bin
pkgver=0.3.82
pkgrel=2
pkgdesc="A complete chat ecosystem across social media platforms"
arch=('x86_64')
url="https://github.com/steveseguin/social_stream"
license=('GPL-3.0')
options=('!strip') # needed to avoid stripping the AppImage
source=("https://github.com/steveseguin/social_stream/releases/download/${pkgver}/socialstreamninja_linux_v${pkgver}_x86_64.AppImage")
sha256sums=("410cd540d22569ead8fbc42ae97c5a4aea289cfc3b9f99b64fb3ed89e22d09e0")

package() {
	install -Dm755 "socialstreamninja_linux_v${pkgver}_x86_64.AppImage" "${pkgdir}/usr/bin/socialstreamninja"
}
