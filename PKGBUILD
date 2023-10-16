# Maintainer: Gustavo Alvarez <s1lpkn07@gmail.com>

pkgname=mplayer2-build-git
pkgver=2.0.728.g2c378c71a
pkgrel=2
pkgdesc="A movie player for linux (uses statically linked libav). (GIT version)"
arch=('x86_64')
depends=(
  'gcc-libs' # libgcc_s.so
  'glibc' # libc.so libm.so
  'alsa-lib' 'libasound.so'
  'a52dec' # liba52.so
  'directfb' # libdirectfb-1.7.so
  'enca' # libenca.so 
  'faad2' 'libfaad.so'
  'fribidi' 'libfribidi.so'
  'fontconfig' 'libfontconfig.so'
  'freetype2' 'libfreetype.so'
  'giflib' 'libgif.so'
  'harfbuzz' 'libharfbuzz.so'
  'jack2' 'libjack.so'
  'lcms2' 'liblcms2.so'
  'libbluray' 'libbluray.so'
  'libbs2b' 'libbs2b.so'
  'libcaca' # libcaca.so
  'libcdio' # libcdio.so
  'libcdio-paranoia' # libcdio_cdda libcdio_paranoia.so
  'libdca' # libdca.so
  'libglvnd' 'libGL.so'
  'libmng' # libmng.so
  'libdv' # libdv.so
  'libdvdnav' 'libdvdnav.so'
  'libdvdcss' 'libdvdread.so'
  'libmad' # libmad.so
  'libquvi' # libquvi-0.9-0.9.4.so
  'libtheora' # libtheoradec.so
  'libvorbis' 'libvorbis.so'
  'libogg' 'libogg.so'
  'libvdpau' 'libvdpau.so'
  'libxv' # libXv.so
  'libx11' # libX11.so
  'libxext' # libXext.so
  'libxinerama' # libXinerama.so
  'libxxf86vm' # libXxf86vm.so
  'libxss' # libXss.so
  'lirc-utils' # liblirc_client.so
  'libjpeg-turbo' 'libjpeg.so'
  'libpng' 'libpng16.so'
  'libpulse' 'libpulse.so'
  'mpg123' 'libmpg123.so'
  'nut-multimedia-git' # libnut.so
  'rsound' # librsound.so
  'sdl12-compat' # libSDL-1.2.so
  'smbclient' # libsmbclient.so
  'speex' 'libspeex.so'
  'portaudio' 'libportaudio.so'
  'ncurses' 'libncursesw.so'
  'ttf-font'
  'xvidcore' 'libxvidcore.so'
  'bzip2' 'libbz2.so'
  'zlib' 'libz.so'
  'hicolor-icon-theme'
)
license=('GPL')
url="http://www.mplayer2.org/"
makedepends=(
  'git'
  'live-media'
  'mesa'
  'python'
  'python-docutils'
  'vstream-client'
  'yasm'
)
backup=(
  'etc/mplayer/codecs.conf'
  'etc/mplayer/input.conf'
)
provides=('mplayer' 'mplayer2')
conflicts=('mplayer' 'mplayer2')
replaces=('mplayer' 'mplayer2')
options=('!emptydirs' '!lto')
source=(
  'mplayer2-2.0.tar.xz::https://www.dropbox.com/s/8vv627lsfh4l9sn/mplayer2-2.0.tar.xz?dl=0'
  'git+https://repo.or.cz/mplayer2-build.git'
  'git+https://repo.or.cz/mplayer2.git'
  'libav::git+https://repo.or.cz/FFMpeg-mirror/mplayer-patches.git'
  'git+https://github.com/libass/libass.git'
  'use-pkg-config-for-dvdnav_dvdread.patch'
  'switch_title-switch-to-next-title-if-no-parameter-passed.patch'
  'stream_dvdnav.diff'
  'libquvi-0.9.patch'
  'samba-4.0.patch'
  'vo_gl_locale_fix.patch'
  'mplayer.svg::https://upload.wikimedia.org/wikipedia/commons/8/81/MPlayer.svg'
  'patch-libmpcodecs-vd_theora.patch::https://svnweb.freebsd.org/ports/branches/2017Q1/multimedia/mplayer2/files/patch-libmpcodecs-vd_theora.c?view=co'
  'patch-libmpdemux-demux_ogg.patch::https://svnweb.freebsd.org/ports/branches/2017Q1/multimedia/mplayer2/files/patch-libmpdemux-demux_ogg.c?view=co'
  'patch-libvo_vo_giflib.patch::https://svnweb.freebsd.org/ports/branches/2017Q1/multimedia/mplayer2/files/patch-libvo_vo_gif89a.c?view=co'
  'patch-libmpdemux-demux_gif.patch::https://svnweb.freebsd.org/ports/branches/2017Q1/multimedia/mplayer2/files/patch-libmpdemux-demux_gif.c?view=co'
  'binutils_fix.patch::https://git.videolan.org/?p=ffmpeg.git;a=patch;h=effadce6c756247ea8bae32dc13bb3e6f464f0eb'
)
sha256sums=(
  'f1d17397bbdfcff2220d8b4bc17e7de5b78488736e21dca2df0d8a3216c85910'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'c26893e024d8146be5a94704e0d461547e6e0dff8a28ca53403e3d094e53a222'
  '3a3831b0fe08e43263a685e342b53dc1c644ce24efc61765226f217f1ada7490'
  '239dc3a71091bd6bbcad66fbcddc2d53a41477e6b989acd202f9ed6af7fd0fd6'
  'b20562a1d485a61dbb6411305841ac113311a7021a70f8e13ad118af0cfe4193'
  'a420455ed4a791ef8514cc88b7f67130a279580447c9178b3066c0826ddc1519'
  '8cf89faaa442dafa3430a604050e29b20435c7402a29a13d0a385c38f1556c7e'
  '2ad29de9705910a24865c7f36768ff11e0e4d3f1c4e4f96c3c6d6fffda30c340'
  '4117a80e11039d63c93a537901feaa952c275b85a5f5fc84ac56f38d820a25e1'
  '74894f00d3f9ff20d0721b4a1d04dd9313167c884a983d19dba9c2aa1c237254'
  '070b10bad1aa84ed78e15f7500788a7ab536c955c60cbbd330ec19dd86743439'
  '9f98ba01f9450c68c2638f2597158b5eda579d90d6673914c741f1e7dcf52260'
  'a50d7da9870a3fd801ad3a4d13d5c9b260acb094cf8bfa4afd95a54741173a7f'
)
noextract=('mplayer2-2.0.tar.xz')

pkgver() {
  cd mplayer2
  echo "$(git describe --always | tr - . | tr -d v)"
}

prepare() {
  cd mplayer2-build
  git config submodule.mplayer.url "${srcdir}/mplayer2"
  git config submodule.libass.url "${srcdir}/libass"
  git config submodule.libav.url "${srcdir}/libav"
  ./init


  # Install language sources to "i18n"
  (rm -fr mplayer/po
  mkdir -p mplayer/po
  cd mplayer
  bsdtar --strip-components=1 -xf "${srcdir}/mplayer2-2.0.tar.xz" mplayer2-2.0/po
  )

  cd mplayer

  # Fix .desktop
  sed -e 's|gmplayer|mplayer|' -e 's|GTK;||' -i etc/mplayer.desktop
  echo 'NoDisplay=true' >> etc/mplayer.desktop

  # Patch to use pkg-config method to get libdvdread/libdvdnav libs/headers info instead dvdnav-config/dvdread-config
  patch -p1 -i "${srcdir}/use-pkg-config-for-dvdnav_dvdread.patch"
  patch -p1 -i "${srcdir}/switch_title-switch-to-next-title-if-no-parameter-passed.patch"

  # Fix build with libdvdnav-git
  patch -p1 -i "${srcdir}/stream_dvdnav.diff"

  # Fix build with giflib 5.1.x
  patch -p0 -i "${srcdir}/patch-libvo_vo_giflib.patch"
  patch -p0 -i "${srcdir}/patch-libmpdemux-demux_gif.patch"

  # Use libquvi 0.9x series
  patch -p1 -i "${srcdir}/libquvi-0.9.patch"

  # Fix samba includes
  patch -p1 -i "${srcdir}/samba-4.0.patch"

  # Fix brawbraw (?)
  patch -p0 -i "${srcdir}/vo_gl_locale_fix.patch"

  # Fix vd_theora
  patch -p0 -i "${srcdir}/patch-libmpcodecs-vd_theora.patch"
  patch -p0 -i "${srcdir}/patch-libmpdemux-demux_ogg.patch"

  # fix libav with actual binutils
  patch -d ../libav -p1 -i "${srcdir}/binutils_fix.patch"

  # Make Mplayer2 build flags
  _mplayer_flags=(
    '--confdir=/etc/mplayer'
    '--enable-translation'
    '--language=all'
    '--prefix=/usr'
    '--enable-joystick'
    '--enable-gif'
    )
  _libav_flags=(
    '--disable-demuxer=hls'
    '--disable-protocol=concat,hls'
    )

  for i in ${_mplayer_flags[@]}; do echo "${i}" >> ../mplayer_options; done
  for i in ${_libav_flags[@]}; do echo "${i}" >> ../libav_options; done

}

build() {
  (cd mplayer2-build/mplayer; sh version.sh)
  LDFLAGS+=" -ltheoradec" \
  LC_ALL=C make -C mplayer2-build

}

package() {
  cd mplayer2-build
  make DESTDIR="${pkgdir}" install
  install -Dm644 mplayer/etc/{codecs,input,example}.conf "${pkgdir}/etc/mplayer/"
  install -Dm644 mplayer/etc/mplayer.desktop "${pkgdir}/usr/share/applications/mplayer.desktop"
  install -Dm644 "${srcdir}/mplayer.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mplayer.svg"
}
