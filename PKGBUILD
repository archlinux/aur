# Maintainer: kumax <>
pkgname=biliup-app-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Bilibili uploader, supports Windows, Linux, macOS."
arch=("x86_64")
url="https://github.com/ForgQi/biliup-app"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("gtk3" "webkit2gtk")
source=("biliup-app_${pkgver}_amd64.deb::https://github.com/ForgQi/biliup-app/releases/download/app-v${pkgver}/biliup-app_${pkgver}_amd64.deb")
sha256sums=('a1b6d4629999eb15a4635630da1361dfb7be4d6dd226477d004f7179dfaf1339')

package() {
	tar xvf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
