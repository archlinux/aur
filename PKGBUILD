# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synshell-core-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell: synwm compositor, shell, login screen, on-screen keyboard, screenshots and screen sharing, settings, file manager, terminal, software center'
depends=('mesa' 'libinput' 'seatd' 'systemd-libs' 'libxkbcommon' 'libdrm' 'pixman' 'vulkan-icd-loader' 'fontconfig' 'freetype2' 'ttf-font' 'breeze-icons' 'breeze-cursors' 'hicolor-icon-theme' 'dbus' 'pam' 'alsa-lib' 'ffmpeg' 'sqlite' 'libarchive' 'xdg-desktop-portal' 'pipewire' 'libpipewire' 'polkit')
optdepends=('xorg-xwayland: X11 applications'
            'wireplumber: volume control (wpctl)'
            'sound-theme-freedesktop: freedesktop sound theme (event fallback)'
            'brightnessctl: brightness'
            'networkmanager: network applet'
            'iwd: Wi-Fi (or networkmanager)'
            'bluez: Bluetooth'
            'playerctl: media keys'
            'wl-clipboard: screenshots and paths to the clipboard'
            'xdg-desktop-portal-kde: fallback file chooser portal'
            'shared-mime-info: file types in the file manager'
            'ffmpegthumbnailer: video thumbnails in the file manager'
            'libheif: HEIC/HEIF/AVIF in the image viewer and thumbnails'
            'imagemagick: rare image formats (JPEG XL, RAW…) in the image viewer'
            'archlinux-appstream-data: categories, icons and screenshots in the software center'
            'geoclue: location for applications (Maps, compass)'
            'base-devel: building AUR packages in the software center'
            'pacman-contrib: update checks without root (checkupdates)'
            'udisks2: USB drives and disks in the file manager'
            'gvfs-mtp: Android phones in the file manager (MTP)'
            'gvfs-gphoto2: cameras in the file manager (PTP)'
            'gvfs-afc: iPhone in the file manager'
            'gvfs-smb: Windows and Samba shares in the file manager'
            'git: git status in the file manager'
            'fuse3: archives as folders; files of linked devices'
            'intel-media-driver: hardware video on Intel'
            'libva-mesa-driver: hardware video on AMD'
            'nvidia-utils: NVIDIA driver (NVENC, neural networks on the GPU)')
provides=('synshell-core' 'syndesktop')
conflicts=('synshell-core' 'synshell-core-git' 'syndesktop')
replaces=('syndesktop')
install=synshell-core.install
options=('!strip' '!debug')
noextract=('synshell-core-0.2.0-x86_64.tar.zst' 'synshell-core-0.2.0-aarch64.tar.zst')
source_x86_64=("synshell-core-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-core-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('9bc81537e32d3d201a929a6b4ed79576097d7be666366fced16ebccb7596fb96')
source_aarch64=("synshell-core-0.2.0-aarch64.tar.zst::https://github.com/VitaminDB/synshell/releases/download/v$pkgver/synshell-core-0.2.0-aarch64.tar.zst")
sha256sums_aarch64=('d426bc963576083dbb7b09ba43814785b78d5fb92fe1e29380dafac08a01ecc2')

package() {
    bsdtar -xpf "$srcdir/synshell-core-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
