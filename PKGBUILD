# Maintainer: SummerBreeze630 <xzwf2003@163.com>

pkgname=bili23-downloader
pkgver=2.00.1
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
sha256sums=('bf854abbaa9af9909f1b44c24be249318d2771a025b2009ceb56dc5af6086788'
            'fb83d13261630aae26b4c7a9ab6366d8de205a7715995670d3a4285ae0550764')

package() {
	tar -axvf data.tar.zst -C ${pkgdir}

	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
