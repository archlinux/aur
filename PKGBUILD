# Maintainer: Dmali <dmali@vk.com>

pkgname=klaus-bin
pkgver=1.0
_releasedate=2023-05-18
pkgrel=1
pkgdesc="Best Arch Manager"
arch=('x86_64')
url="https://github.com/dmaliog/kLausqt/"
license=('GPL 2.0')
groups=()
depends=('qt5-webengine' 'qt5-base' 'qt5-declarative' 'qt5-multimedia' 'qt5-webchannel'
         'qt5-location' 'libglvnd' 'gcc-libs' 'glibc' 'icu' 'nss' 'nspr' 'zlib' 'libevent'
         'libjpeg-turbo' 'opus' 'ffmpeg' 'libvpx' 'libx11' 'libxcomposite' 'libxdamage'
         'libxext' 'libxfixes' 'libxrender' 'libxrandr' 'libxtst' 'glib2' 'libpng' 'libwebp'
         'freetype2' 'expat' 'fontconfig' 'harfbuzz' 're2' 'libxcb' 'libxkbcommon'
         'dbus' 'pciutils' 'alsa-lib' 'snappy' 'libxml2' 'libxslt' 'minizip' 'lcms2' 'libpulse'
         'md4c' 'krb5' 'openssl' 'systemd-libs' 'double-conversion' 'pcre2' 'zstd' 'xz'
         'dav1d' 'librsvg' 'cairo' 'aom' 'gsm' 'libjxl' 'lame' 'openjpeg2' 'rav1e' 'speex'
         'svt-av1' 'libtheora' 'libvorbis' 'x264' 'x265' 'xvidcore' 'libva' 'libmfx' 'bzip2'
         'libmodplug' 'libopenmpt' 'libbluray' 'gmp' 'gnutls' 'srt' 'libssh' 'libvdpau' 'libdrm'
         'intel-oneapi-compiler-shared-runtime' 'util-linux-libs' 'libffi' 'brotli' 'graphite'
         'libxau' 'libxdmcp' 'libpulse' 'e2fsprogs' 'keyutils' 'libcap' 'libgcrypt' 'lz4' 'libsoxr'
         'gdk-pixbuf2' 'pango' 'pixman' 'highway' 'libogg' 'mpg123' 'libp11-kit' 'libidn2'
         'libunistring' 'libtasn1' 'nettle' 'intel-oneapi-compiler-shared-runtime-libs'
         'libsndfile' 'libasyncns' 'libgpg-error' 'gcc-libs' 'libtiff' 'fribidi' 'libthai' 'flac'
         'libdatrie')

source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/klaus-${pkgver}-${_releasedate}-linux64.zip"
)

sha256sums=(
	'SKIP'
)

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

    install -Dm755 ./klaus/klauspro ${pkgdir}/usr/bin/klauspro

	install -Dt ${pkgdir}/usr/share/applications/ -m644 ./klaus/klaus.desktop
	install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./klaus/klaus.png
}
