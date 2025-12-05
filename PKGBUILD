# Maintainer: Rubonnek <wilson.e.alvarez@rubonnek.com>
pkgname=socialstreamninja-bin
pkgver=0.3.62
pkgrel=2
pkgdesc="A complete chat ecosystem across social media platforms"
arch=('x86_64')
url="https://github.com/steveseguin/social_stream"
license=('GPL-3.0')
options=('!strip') # needed to avoid stripping the AppImage
source=("socialstreamninja::https://github.com/steveseguin/social_stream/releases/download/${pkgver}/socialstreamninja_linux_v0.3.69_x86_64.AppImage")
sha256sums=("abbe4210bbabea39043620bb83cd3cbb2bd000202150c5105bd9b6420d4b877e")

package() {
	install -Dm 755 -t "${pkgdir}/usr/bin" "${srcdir}/socialstreamninja"
}
