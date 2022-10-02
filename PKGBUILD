# Maintainer: kumax <>
pkgname=biliup-app-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Bilibili uploader, supports Windows, Linux, macOS."
arch=("x86_64")
url="https://github.com/ForgQi/biliup-app"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("gtk3" "webkit2gtk")
source=("biliup-app_${pkgver}_amd64.deb::https://github.com/ForgQi/biliup-app/releases/download/app-v${pkgver}/biliup-app_${pkgver}_amd64.deb")
sha256sums=('05f8d092738caea32cb428b56a74aaa022a8f6f0abdbe1a69b0992174882f144')

package() {
	tar xvf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
