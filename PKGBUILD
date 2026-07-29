pkgname=file-manager-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Linux desktop file manager written in Rust and Iced'
arch=('x86_64')
url='https://github.com/nsjsv/File_Manager'
license=('GPL-3.0-or-later')
depends=(
    'acl'
    'alsa-lib'
    'fontconfig'
    'glib2'
    'libnotify'
    'libxkbcommon'
    'wayland'
    'wl-clipboard'
    'xdg-utils'
)
optdepends=(
    '7zip: 7z and rar preview and extraction, plus 7z creation'
    'ffmpeg: video preview and metadata support'
    'ffmpegthumbnailer: video thumbnail generation'
    'gvfs: SFTP and WebDAV network locations'
    'gvfs-afc: Apple/AFC portable device support'
    'gvfs-gphoto2: digital camera/GPhoto support'
    'gvfs-mtp: Android and media-player MTP support'
    'gvfs-smb: SMB network locations'
    'libsecret: saved network passwords'
    'udisks2: storage device discovery and management'
)
provides=('file-manager')
conflicts=('file-manager')
source_x86_64=("https://github.com/nsjsv/File_Manager/releases/download/v${pkgver}/file-manager-v${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('1d65cbb0720f3c1b09468bc205b078867398ef7af696f927263f656165088f29')

package() {
    cp -a "${srcdir}/file-manager-v${pkgver}-x86_64/usr" "${pkgdir}/"
}
