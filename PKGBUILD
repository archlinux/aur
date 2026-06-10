pkgname=file-manager-bin
pkgver=0.0.5
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
sha256sums_x86_64=('33bd4c647272c892dc9c9f6eb6e59aa0f83c3a04d259e72d2ebd32d488a7bc86')

package() {
    cp -a "${srcdir}/file-manager-v${pkgver}-x86_64/usr" "${pkgdir}/"
}
