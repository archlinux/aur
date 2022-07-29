# Maintainer: kumax <>
pkgname=biliup-app-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="Bilibili uploader, supports Windows, Linux, macOS."
arch=("x86_64")
url="https://github.com/ForgQi/biliup-app"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("gtk3" "webkit2gtk")
source=("biliup-app_${pkgver}_amd64.deb::https://github.com/ForgQi/biliup-app/releases/download/app-v${pkgver}/biliup-app_${pkgver}_amd64.deb")
sha256sums=('d0dd6c8f6f14a311a309e7ed4288280d85a4e9a7877e267ad043da7e8704e044')

package() {
	tar xvf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
