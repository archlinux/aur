# Maintainer: SummerBreeze630 <xzwf2003@163.com>

pkgname=bili23-downloader
pkgver=2.14.0
pkgrel=1
pkgdesc="Bili23 Downloader"
arch=('x86_64')
url="https://bili23.scott-sloan.cn/"
license=('MIT')
depends=('libtiff5' 'ffmpeg')
provides=()
options=('!strip')
_git_url="https://github.com/ScottSloan/Bili23-Downloader"
source=("${_git_url}/releases/download/v${pkgver}/Bili23-Downloader_${pkgver//_/-}_linux_amd64.deb"
	"https://raw.githubusercontent.com/ScottSloan/Bili23-Downloader/main/LICENSE"

)
sha256sums=('3760ffd0985d6d06a280215af67905495e050cf0331d856be3b04ab62ed85e0f'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
	tar -axvf data.tar.zst -C ${pkgdir}

	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
