# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=socialstreamninja-bin
pkgver=0.4.40
pkgrel=1
pkgdesc="A complete chat ecosystem across social media platforms"
arch=('x86_64')
url="https://github.com/steveseguin/social_stream"
license=('GPL-3.0')
options=('!strip') # needed to avoid stripping the AppImage
source=("https://github.com/steveseguin/social_stream/releases/download/v${pkgver}/socialstreamninja_linux_v${pkgver}_x86_64.AppImage")
sha256sums=("4211ab5058bf948754683dbfb1bb388c465aa62ce51dd809b140f578683ddedd")

package() {
	install -Dm755 "socialstreamninja_linux_v${pkgver}_x86_64.AppImage" "${pkgdir}/usr/bin/socialstreamninja"
}
