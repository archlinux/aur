# Maintainer: Tyler "Tyzoid" Dence <tyler@tyzoid.com>
pkgname=youtubeuploader-bin
pkgver=21.05
pkgrel=1
pkgdesc="CLI YouTube uploading utility - upload video files from local disk or from the web"
arch=("x86_64")
url="https://github.com/porjo/youtubeuploader"
license=('APACHE')
provides=('youtubeuploader')
conflicts=('youtubeuploader' 'youtubeuploader-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/porjo/youtubeuploader/releases/download/$pkgver/youtubeuploader_linux_amd64.tar.gz")
sha256sums=("96b431b299c668fd887546a2fe8a393d33371a477cd2e7083a6a0f1bb1a66e13")

package() {
	install -Dm755 -T "$srcdir/youtubeuploader_linux_amd64" "$pkgdir/usr/bin/youtubeuploader"
}
