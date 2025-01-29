# Maintainer: Tyler "Tyzoid" Dence <tyler@tyzoid.com>
pkgname=youtubeuploader-bin
pkgver=1.24.4
pkgrel=1
epoch=1
pkgdesc="CLI YouTube uploading utility - upload video files from local disk or from the web"
arch=("x86_64")
url="https://github.com/porjo/youtubeuploader"
license=('APACHE')
provides=('youtubeuploader')
conflicts=('youtubeuploader' 'youtubeuploader-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/porjo/youtubeuploader/releases/download/v$pkgver/youtubeuploader_${pkgver}_Linux_amd64.tar.gz")
sha256sums=("9dca6d3b8c7fe9020ac8ebf99cdb607a9ace7ebb458f7a6b213cb813bae9207d")

package() {
	install -Dm755 -T "$srcdir/youtubeuploader" "$pkgdir/usr/bin/youtubeuploader"
}
