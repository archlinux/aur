pkgname=bennu-bin
pkgver=0.3.0
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
source_x86_64=("https://github.com/nsjsv/Bennu/releases/download/v${pkgver}/bennu-v${pkgver}-x86_64.tar.gz")
sha256sums_x86_64=('2bfa0bf979a36902974a3dcd06b2b69878e54c2a6286bfb75f99c23fa24824e7')

package() {
    cp -a "${srcdir}/bennu-v${pkgver}-x86_64/usr" "${pkgdir}/"
}
