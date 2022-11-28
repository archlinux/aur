# Maintainer: kumax <>
pkgname=biliup-app-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Bilibili uploader, supports Windows, Linux, macOS."
arch=("x86_64")
license=("unknown")
url="https://github.com/ForgQi/biliup-app"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("gtk3" "webkit2gtk")
source=("biliup-app_${pkgver}_amd64.deb::https://github.com/ForgQi/biliup-app/releases/download/app-v${pkgver}/biliup-app_${pkgver}_amd64.deb")
sha256sums=('0247d1df49412f487c02174d83978cd47f44284d66eab6168ec31e575033117c')

package() {
	tar xvf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}

