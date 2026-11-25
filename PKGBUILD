pkgname=bennu-bin
pkgver=0.4.8
pkgrel=1
pkgdesc='Bennu — Linux desktop file manager written in Rust and Iced'
arch=('x86_64')
url='https://github.com/nsjsv/Bennu'
license=('GPL-3.0-or-later')
depends=(
    'acl'
    'alsa-lib'
    'dav1d'
    'fontconfig'
    'glib2'
    'libjpeg-turbo'
    'libnotify'
    'libxkbcommon'
    'wayland'
    'wl-clipboard'
    'xdg-utils'
)
optdepends=(
    '7zip: zip, 7z and rar preview and extraction, plus zip and 7z creation'
    'ffmpeg: audio and video preview and metadata support'
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
source_x86_64=("https://github.com/nsjsv/Bennu/releases/download/v${pkgver}/bennu-${pkgver}-x86_64.tar.xz")
sha256sums_x86_64=('a657e20823a08b5e186d44a762031321536360cf977319df961049fee2bc3503')

package() {
    cp -a "${srcdir}/bennu-${pkgver}-x86_64/usr" "${pkgdir}/"
}
