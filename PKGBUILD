pkgname=file-manager-bin
pkgver=0.0.8
pkgrel=1
pkgdesc='Linux desktop file manager written in Rust and Iced'
arch=('x86_64')
url='https://github.com/nsjsv/File_Manager'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'fontconfig' 'libxkbcommon' 'wayland')
optdepends=(
    'ffmpeg: video preview and metadata support'
    'ffmpegthumbnailer: video thumbnail generation'
    'p7zip: 7z and rar archive preview support'
)
provides=('file-manager')
conflicts=('file-manager')
source_x86_64=("https://github.com/nsjsv/File_Manager/releases/download/v${pkgver}/file-manager-v${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('324e75e7b2cf7e5350273ccd595a9a5f2e82e8da7230b1266139154ebcb715d0')

package() {
    cp -a "${srcdir}/file-manager-v${pkgver}-x86_64/usr" "${pkgdir}/"
}
