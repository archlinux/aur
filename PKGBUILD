# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=steam-native-runtime
pkgver=1.0.0.54
pkgrel=4
pkgdesc='Native replacement for the Steam runtime'
arch=('x86_64')
url='https://wiki.archlinux.org/index.php/Steam/Troubleshooting#Native_runtime'
license=('None')
replaces=('steam-libs')
depends=('lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-atk' 'lib32-cairo'
         'lib32-curl' 'lib32-dbus-glib' 'lib32-fontconfig' 'lib32-freetype2'
         'lib32-freeglut' 'lib32-gconf' 'lib32-gdk-pixbuf2' 'lib32-glew1.10'
         'lib32-glib2' 'lib32-glu' 'lib32-gtk2' 'lib32-libappindicator-gtk2'
         'lib32-libcaca' 'lib32-libcanberra' 'lib32-libcups'
         'lib32-libcurl-compat' 'lib32-libcurl-gnutls' 'lib32-dbus'
         'lib32-libdrm' 'lib32-libgcrypt15' 'lib32-libice' 'lib32-libjpeg6'
         'lib32-libnm-glib' 'lib32-libpng12' 'lib32-libpulse' 'lib32-librtmp0'
         'lib32-libsm' 'lib32-libtheora' 'lib32-libtiff4' 'lib32-libudev0-shim'
         'lib32-libusb' 'lib32-libva' 'lib32-libvdpau' 'lib32-libvorbis'
         'lib32-libvpx1.3' 'lib32-libwrap' 'lib32-libxcomposite'
         'lib32-libxcursor' 'lib32-libxft' 'lib32-libxi' 'lib32-libxinerama'
         'lib32-libxmu' 'lib32-libxrandr' 'lib32-libxrender' 'lib32-libxtst'
         'lib32-libxxf86vm' 'lib32-nspr' 'lib32-nss' 'lib32-openal'
         'lib32-openssl-1.0' 'lib32-pango' 'lib32-sdl' 'lib32-sdl2'
         'lib32-sdl2_image' 'lib32-sdl2_mixer' 'lib32-sdl2_ttf'
         'lib32-sdl_image' 'lib32-sdl_mixer' 'lib32-sdl_ttf')

package() {
  install -d "${pkgdir}"/usr/lib32/steam
  ln -sf /usr/lib32/libcurl.so.3 "${pkgdir}"/usr/lib32/steam/libcurl.so.3
  ln -sf /usr/lib32/libcurl.so.4.2.0 "${pkgdir}"/usr/lib32/steam/libcurl.so.4
  ln -sf /usr/lib32/libcurl.so.4.2.0 "${pkgdir}"/usr/lib32/steam/libcurl.so.4.2.0
}

# vim: ts=2 sw=2 et:

