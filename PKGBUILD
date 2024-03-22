# Maintainer: tytan652 <tytan652[at]tytanium[dot]xyz>

pkgname=vlc-luajit
_vlcver=3.0.20
# optional fixup version including hyphen
_vlcfixupver=
pkgver=${_vlcver}${_vlcfixupver//-/.r}
pkgrel=8
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player built with luajit for OBS Studio compatibility'
url='https://www.videolan.org/vlc/'
arch=('x86_64' 'aarch64')
license=(
  'GPL-2.0-or-later'
  'LGPL-2.1-or-later'
)
# To manage dependency rebuild easily, this will prevent you to rebuild VLC on non-updated system
_aomver=3
_abseilcppver=20240116
_dav1dver=1.3.0
_flacver=1.4.0
_libdc1394ver=2.2.7
_libmicrodnsver=0.2
_libupnpver=1.14
_libvpxver=1.14
_livemedia=2023.01.19
_mpg123ver=1.32.2
_protobufver=25
_taglibver=2
_srtver=1.5
_x264ver=0.164
_x265ver=3.5
depends=(
  'a52dec'
  "abseil-cpp>=$_abseilcppver"
  'aribb24'
  'bash'
  'cairo'
  'dbus'
  'faad2'
  "ffmpeg>=6"
  'fontconfig'
  'freetype2'
  'fribidi'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gnutls'
  'harfbuzz'
  'hicolor-icon-theme'
  'libarchive'
  'libdca'
  'libdvbpsi'
  'libglvnd'
  'libidn'
  'libmad'
  'libmatroska'
  'libmpcdec'
  'libmpeg2'
  'libproxy'
  'libsecret'
  'libtar'
  "libupnp>=$_libupnpver"
  # 'libva' Non-functional in VLC 3 if FFmpeg 5 or later, only VLC 4 supports it
  'libx11'
  'libxcb'
  'libxinerama'
  'libxml2'
  'libxpm'
  'luajit'
  'qt5-base'
  'qt5-svg'
  'qt5-x11extras'
  "taglib>=$_taglibver"
  'wayland'
  'xcb-util-keysyms'
  'zlib'
)
makedepends=(
  'aalib'
  'alsa-lib'
  "aom>=$_aomver"
  'aribb25'
  'avahi'
  'chromaprint'
  "dav1d>=$_dav1dver"
  "flac>=$_flacver"
  'fluidsynth'
  'gst-plugins-base-libs'
  'gtk3'
  'jack'
  'libass'
  'libavc1394'
  'libbluray'
  'libcaca'
  "libdc1394>=$_libdc1394ver"
  'libdvdcss'
  'libdvdnav'
  'libdvdread'
  'libgme'
  'libgoom2'
  'libjpeg-turbo'
  'libkate'
  "libmicrodns>=$_libmicrodnsver"
  'libmodplug'
  'libmtp'
  'libnotify'
  'libnfs'
  'libogg'
  'libpng'
  'libpulse'
  'librsvg'
  'libsamplerate'
  'libshout'
  'libsoxr'
  'libssh2'
  'libtheora'
  'libtiger'
  'libvorbis'
  "libvpx>=$_libvpxver"
  'lirc'
  "live-media>=$_livemedia"
  'mesa'
  "mpg123>=$_mpg123ver"
  'opus'
  'pcsclite'
  'projectm'
  "protobuf>=$_protobufver"
  'sdl_image'
  'smbclient'
  'speex'
  "srt>=$_srtver"
  'systemd-libs'
  'twolame'
  'vcdimager'
  'wayland-protocols'
  "x264>=$_x264ver"
  "x265>=$_x265ver"
  'xosd'
  'zvbi'
  'lua51'
)
optdepends=(
  'aalib: ASCII art video output'
  'alsa-lib: ALSA audio output'
  "aom>=$_aomver: AOM AV1 codec"
  'aribb25: aribcam support'
  'avahi: service discovery using bonjour protocol'
  'chromaprint: Chromaprint audio fingerprinter'
  "dav1d>=$_dav1dver: dav1d AV1 decoder"
  "flac>=$_flacver: Free Lossless Audio Codec plugin"
  'fluidsynth: FluidSynth based MIDI playback plugin'
  'gnu-free-fonts: subtitle font'
  'gst-plugins-base-libs: for libgst plugins'
  'gstreamer: for libgst plugins'
  'gtk3: notification plugin'
  'jack: jack audio server'
  'kwallet: kwallet keystore'
  'libass: Subtitle support'
  'libavc1394: devices using the 1394ta AV/C'
  'libbluray: Blu-Ray video input'
  'libcaca: colored ASCII art video output'
  'libcdio: audio CD playback'
  "libdc1394>=$_libdc1394ver: IEEE 1394 access plugin"
  'libdvdcss: decoding encrypted DVDs'
  'libdvdnav: DVD with navigation input module'
  'libdvdread: DVD input module'
  'libgme: Game Music Emu plugin'
  'libgoom2: Goom visualization'
  'libjpeg-turbo: JPEG support'
  'libkate: Kate codec'
  'libmodplug: MOD output plugin'
  "libmicrodns>=$_libmicrodnsver: mDNS services discovery (chromecast etc)"
  'libmtp: MTP devices discovery'
  'libnfs: NFS access'
  'libnotify: notification plugin'
  'libogg: Ogg and OggSpots codec'
  'libpng: PNG support'
  'libpulse: PulseAudio audio output'
  'libraw1394: IEEE 1394 access plugin'
  'librsvg: SVG plugin'
  'libsamplerate: audio Resampler'
  'libshout: shoutcast/icecast output plugin'
  'libsoxr: SoX audio Resampler'
  'libssh2: sftp access'
  'libtheora: theora codec'
  'libtiger: Tiger rendering for Kate streams'
  #'libva-intel-driver: video backend intel'
  'libvorbis: Vorbis decoder/encoder'
  "libvpx>=$_libvpxver: VP8 and VP9 codec"
  'lirc: lirc control'
  'live-media: streaming over RTSP'
  'lua51-socket: http interface'
  "mpg123>=$_mpg123ver: mpg123 codec"
  'ncurses: ncurses interface'
  'opus: opus codec'
  'pcsclite: aribcam support'
  'projectm: ProjectM visualisation'
  "protobuf>=$_protobufver: chromecast streaming"
  'sdl12-compat: SDL image support'
  'sdl_image: SDL image support'
  'smbclient: SMB access plugin'
  'speex: Speex codec'
  'speexdsp: Speex codec'
  "srt>=$_srtver: SRT input/output plugin"
  'systemd-libs: udev services discovery'
  'ttf-dejavu: subtitle font'
  'twolame: TwoLAME mpeg2 encoder plugin'
  'vcdimager: navigate VCD with libvcdinfo'
  "x264>=$_x264ver: H264 encoding"
  "x265>=$_x265ver: HEVC/H.265 encoder"
  'zvbi: VBI/Teletext/webcam/v4l2 capture/decoding'
)
_name=vlc
conflicts=("${_name}" 'vlc-dev' 'vlc-plugin' 'vlc-stable-git')
provides=("${_name}=${pkgver}")
options=('!emptydirs')
source=(https://download.videolan.org/${_name}/${_vlcver}/${_name}-${_vlcver}${_vlcfixupver}.tar.xz
        'update-vlc-plugin-cache.hook'
        'taglib-2.patch')
sha512sums=('02e58fb52dd75bf483ac4b298aecf86463b13d4782173d164adba6e4552d9262ff5e2ee1cbe1bce2c8a809801b79f328c6a8c475d34ae62aefaea02ae5ade406'
            'b247510ffeadfd439a5dadd170c91900b6cdb05b5ca00d38b1a17c720ffe5a9f75a32e0cb1af5ebefdf1c23c5acc53513ed983a736e8fa30dd8fad237ef49dd3'
            'ea0d1e1dfed16dac8f9027eb55d987dee59630568b9744ceb42bfa134ea9295252d83574f3d793a76a5be3b02661c1731ed366003b6b55b2d7f02fde70586ff3')

prepare() {
  cd ${_name}-${_vlcver}
  sed -e 's:truetype/ttf-dejavu:TTF:g' -i modules/visualization/projectm.cpp
  sed -e 's|-Werror-implicit-function-declaration||g' -i configure
  sed 's|whoami|echo builduser|g' -i configure
  sed 's|hostname -f|echo arch|g' -i configure
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # Fix to build against libcaca 0.99.beta20 (kept as comment)
  #sed -i 's/cucul_/caca_/g' modules/video_output/caca.c
  #sed -i 's/CUCUL_COLOR/CACA/g' modules/video_output/caca.c

  autoreconf -vf
}

if [[ $CARCH == 'x86_64' ]]; then
  GLES=--disable-gles2
elif [[ $CARCH == 'i686' ]]; then
  GLES=--disable-gles2
elif [[ $CARCH == 'aarch64' ]]; then
  GLES=--enable-gles2
fi

build() {
  cd ${_name}-${_vlcver}

  export CFLAGS+=" -I/usr/include/samba-4.0"
  export CPPFLAGS+=" -I/usr/include/samba-4.0 -ffat-lto-objects"
  export CXXFLAGS+=" -std=c++17"
  # OBS Studio use luajit which is a drop-in for lua5.1
  # So lets build VLC with luajit and luac5.1 rather than lua5.2 and luac5.2
  # Which will make OBS not crash when loading a VLC (Video) Source
  export LUAC=/usr/bin/luac5.1
  export LUA_LIBS="$(pkg-config --libs luajit)"
  export LUA_CFLAGS="$(pkg-config --cflags luajit)"
  export RCC=/usr/bin/rcc-qt5

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-kde-solid=/usr/share/solid/actions/ \
    --disable-rpath \
    --enable-nls \
    --enable-archive \
    --enable-live555 \
    --enable-dc1394 \
    --enable-dv1394 \
    --enable-dvdread \
    --enable-dvdnav \
    --enable-bluray \
    --disable-opencv \
    --enable-smbclient \
    --enable-sftp \
    --enable-nfs \
    --enable-realrtsp \
    --enable-dvbpsi \
    --enable-gme \
    --enable-ogg \
    --enable-shout \
    --enable-matroska \
    --enable-mod \
    --enable-mpc \
    --enable-mad \
    --enable-mpg123 \
    --enable-gst-decode \
    --enable-avcodec \
    --disable-libva \
    --enable-avformat \
    --enable-postproc \
    --enable-faad \
    --enable-vpx \
    --enable-twolame \
    --disable-fdkaac \
    --enable-a52 \
    --enable-dca \
    --enable-flac \
    --enable-fluidsynth \
    --enable-libmpeg2 \
    --enable-vorbis \
    --enable-speex \
    --enable-opus \
    --enable-oggspots \
    --disable-schroedinger \
    --enable-png \
    --enable-jpeg \
    --enable-x264 \
    --enable-x265 \
    --enable-zvbi \
    --enable-libass \
    --enable-kate \
    --enable-tiger \
    --enable-vdpau \
    --enable-wayland \
    --enable-sdl-image \
    --enable-freetype \
    --enable-fribidi \
    --enable-harfbuzz \
    --enable-fontconfig \
    --enable-svg \
    --enable-svgdec \
    --enable-aa \
    --enable-caca \
    --enable-pulse \
    --enable-alsa \
    --enable-jack \
    --enable-samplerate \
    --enable-soxr \
    --enable-chromaprint \
    --enable-chromecast \
    --enable-qt \
    --enable-skins2 \
    --enable-libtar \
    --enable-ncurses \
    --enable-lirc \
    --enable-goom \
    --enable-projectm \
    --enable-avahi \
    --enable-mtp \
    --enable-upnp \
    --enable-microdns \
    --enable-libxml2 \
    --disable-libgcrypt \
    --enable-gnutls \
    --enable-taglib \
    --enable-secret \
    --enable-kwallet \
    --disable-update-check \
    --enable-notify \
    --disable-libplacebo \
    --enable-vlc \
    --enable-aribsub \
    --enable-aribcam \
    --enable-aom \
    --enable-srt \
    --enable-dav1d \
    --disable-decklink \
    $GLES

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_name}-${_vlcver}

  make DESTDIR="${pkgdir}" install

  for res in 16 32 48 128 256; do
    install -Dm 644 "${srcdir}/vlc-${_vlcver}/share/icons/${res}x${res}/vlc.png" \
                     "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/vlc.png"
  done
  install -Dm 644 "${srcdir}/update-vlc-plugin-cache.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
}
