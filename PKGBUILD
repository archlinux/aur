pkgname=file-manager-bin
pkgver=0.1.0
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
    'systemd: user service supervision for indexed search'
)
provides=('file-manager')
conflicts=('file-manager')
source_x86_64=("https://github.com/nsjsv/File_Manager/releases/download/v${pkgver}/file-manager-v${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('4713bf291fd8716a39930d990bd431cd30127f0c2ee593da679f21f043156f64')

package() {
    cp -a "${srcdir}/file-manager-v${pkgver}-x86_64/usr" "${pkgdir}/"
}
