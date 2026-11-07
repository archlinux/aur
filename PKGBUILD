# Maintainer: Mahmoud Al Nagar <mnwhisperer@gmail.com>

pkgname=ezoo-download-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A fast, lightweight, open-source download manager built with Rust and Slint"
arch=('x86_64')
url="https://github.com/kerlif/ezoo-download"
license=('GPL3')
depends=('ffmpeg' 'zenity' 'gtk3')
provides=('ezoo-download')
conflicts=('ezoo-download')
source=("EzooDownload_${pkgver}_amd64.deb::https://github.com/kerlif/ezoo-download/releases/download/v${pkgver}/EzooDownload_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    tar xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
