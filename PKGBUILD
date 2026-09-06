pkgname=file-manager-bin
pkgver=0.2.8
pkgrel=1
pkgdesc='Linux desktop file manager written in Rust and Iced'
arch=('x86_64')
url='https://github.com/nsjsv/File_Manager'
license=('GPL-3.0-or-later')
depends=(
    'acl'
    'alsa-lib'
    'dav1d'
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
    'libreoffice: Office document preview (provided by libreoffice-fresh or libreoffice-still)'
    'libsecret: saved network passwords'
    'poppler: PDF and Office document preview'
    'udisks2: storage device discovery and management'
)
provides=('file-manager')
conflicts=('file-manager')
source_x86_64=("https://github.com/nsjsv/File_Manager/releases/download/v${pkgver}/file-manager-v${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('aa2efb807b87e52956377fe7dc0411ae15e4982ed871b33848c39ca1d00b9a93')

package() {
    cp -a "${srcdir}/file-manager-v${pkgver}-x86_64/usr" "${pkgdir}/"
}
