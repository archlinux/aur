# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbasename=sdl
pkgname=lib32-$_pkgbasename
pkgver=1.2.15
pkgrel=8
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (32-bit)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('LGPL')
depends=('lib32-libxext' 'lib32-libxrender' 'lib32-libx11' $_pkgbasename)
makedepends=('lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' 'lib32-glu' gcc-multilib)
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver')
options=('staticlibs')
source=(https://www.libsdl.org/release/SDL-${pkgver}.tar.gz{,.sig}
        SDL-1.2.10-GrabNotViewable.patch
        SDL-1.2.15-SDL_EnableUNICODE_drops_keyboard_events.patch
        SDL-1.2.15-const_XData32.patch
        SDL-1.2.15-ignore_insane_joystick_axis.patch
        SDL-1.2.15-no-default-backing-store.patch
        SDL-1.2.15-x11-Bypass-SetGammaRamp-when-changing-gamma.patch
        sdl-1.2.14-fix-mouse-clicking.patch
        sdl-1.2.14-disable-mmx.patch
        libsdl-1.2.15-resizing.patch
        X11_KeyToUnicode.patch
        SDL-1.2.15-CVE-2019-13616-validate_image_size_when_loading_BMP_files.patch
        SDL-1.2.15-CVE-2019-7572-Fix-a-buffer-overread-in-IMA_ADPCM_nib.patch
        SDL-1.2.15-CVE-2019-7572-Fix-a-buffer-overwrite-in-IMA_ADPCM_de.patch
        SDL-1.2.15-CVE-2019-7573-CVE-2019-7576-Fix-buffer-overreads-in-.patch
        SDL-1.2.15-CVE-2019-7574-Fix-a-buffer-overread-in-IMA_ADPCM_dec.patch
        SDL-1.2.15-CVE-2019-7575-Fix-a-buffer-overwrite-in-MS_ADPCM_dec.patch
        SDL-1.2.15-CVE-2019-7577-Fix-a-buffer-overread-in-MS_ADPCM_deco.patch
        SDL-1.2.15-CVE-2019-7577-Fix-a-buffer-overread-in-MS_ADPCM_nibb.patch
        SDL-1.2.15-CVE-2019-7578-Fix-a-buffer-overread-in-InitIMA_ADPCM.patch
        SDL-1.2.15-CVE-2019-7635-Reject-BMP-images-with-pixel-colors-ou.patch
        SDL-1.2.15-CVE-2019-7637-Fix-in-integer-overflow-in-SDL_Calcula.patch
        SDL-1.2.15-CVE-2019-7638-CVE-2019-7636-Refuse-loading-BMP-image.patch
        SDL-1.2.15-Reject-2-3-5-6-7-bpp-BMP-images.patch)
sha256sums=('d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00'
            'SKIP'
            'ea2042b8a45a083b1447d5c56e52b23b79f2ddb0d717ec7b287b34ef71bd2d1a'
            '292046466d52a2ebe995a0121404864e4ee0de2b6024203acb95bbd600844da0'
            'bab60b515a74b71650ee71d5a0075c77046a7bad48b061673c3798dbdd35446d'
            '7586d6124d5452ad721ca6aa10eae09946d94854748e22f9c9c6fdca3d0aeb12'
            '3941c44a5580df95c6868936cfc57ba3e7b6952fb8a3eb14f963d54d9d8ca8a4'
            'd296af5bb0d9856d049b4e5adb9dd995d2a1e51d76a6adf63457e65101a50620'
            '8d178f13eb707e81f5f9d86bf7b609ae8f0bac937fb4a37ebcbf4bbc9b89e21b'
            '17bb880dd2cb4922d4e3771d146660b9da8be8f1629a5cdaae7523d4a9d2bd7c'
            '5160fb1c07b04480d98d45b89a0aa6e577f2ac4c3bace0c80b251e6aca1fb4a1'
            'b1ad9c60829b166e6b647006d6549ea657155e755cf574fcfc4b91b658654769'
            '95ddeff25c9f5ea4f828c90073852218a3c8ecfcd4da4f3a7f6ea54e3e5c2086'
            '3f05fcccfa7f3474572955d0cbcfc931da57e3da450fc5c5803c837c38fd6e17'
            'a9bd66c75e443f7875d044518b5960386c549aa1c0592364aee1240a6e0867a5'
            'f4cd391a5df211a5d3558f5ec03b9f413533398f44feca86a30a8acc90e63402'
            '0293e56873929d817950e272ebfd6735c8d5b896d0a59b2d7be09107dac7e85b'
            'be4cadd1b028e8b14ee4e4413aeffd98ff2ad1e66a7c75c8bdb04bfd08b9372a'
            '335b5b1c44229ac90318dae36a98731332f417c2d71d449385e6ab013f25efdb'
            '0371bcdba4e89055be62a76421052d7bd5fbf40c0f0e3d9c29fc5d21686f5afd'
            '0f3691d6fc7381a4dd23216041b341102aa858b105534541dfa2843b0eccace6'
            '358028a9d6523377c1757a58faed741e10a0a9863f9df33f21cd32668d257fed'
            '3624f0dbe8d9bd3d553a25806237edcae5fafe714e5c4da3c5e3b281a3fbc8ae'
            '7db8112826318de5705b54cf493060cec34e2822df2b1cd9f55891672beed64d'
            'da87eb71c7af042bc8379f9f7cd63e57d99429774bb43524dde103718b99c533')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga <slouken@libsdl.org>

prepare() {
  cd SDL-$pkgver
  patch -Np1 -i ../SDL-1.2.10-GrabNotViewable.patch
  patch -Np1 -i ../SDL-1.2.15-SDL_EnableUNICODE_drops_keyboard_events.patch
  patch -Np1 -i ../SDL-1.2.15-const_XData32.patch
  patch -Np1 -i ../SDL-1.2.15-ignore_insane_joystick_axis.patch
  patch -Np1 -i ../SDL-1.2.15-no-default-backing-store.patch

  # https://bugs.freedesktop.org/show_bug.cgi?id=27222
  patch -Np1 -i ../SDL-1.2.15-x11-Bypass-SetGammaRamp-when-changing-gamma.patch

  patch -Np1 -i ../sdl-1.2.14-fix-mouse-clicking.patch
  patch -Np1 -i ../sdl-1.2.14-disable-mmx.patch
  patch -Np1 -i ../libsdl-1.2.15-resizing.patch
  patch -Np1 -i ../X11_KeyToUnicode.patch

  # bunch of CVE fixes from Fedora - Thanks!
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7577-Fix-a-buffer-overread-in-MS_ADPCM_deco.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7575-Fix-a-buffer-overwrite-in-MS_ADPCM_dec.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7574-Fix-a-buffer-overread-in-IMA_ADPCM_dec.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7572-Fix-a-buffer-overread-in-IMA_ADPCM_nib.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7572-Fix-a-buffer-overwrite-in-IMA_ADPCM_de.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7573-CVE-2019-7576-Fix-buffer-overreads-in-.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7578-Fix-a-buffer-overread-in-InitIMA_ADPCM.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7638-CVE-2019-7636-Refuse-loading-BMP-image.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7637-Fix-in-integer-overflow-in-SDL_Calcula.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7635-Reject-BMP-images-with-pixel-colors-ou.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-13616-validate_image_size_when_loading_BMP_files.patch
  patch -Np1 -i ../SDL-1.2.15-CVE-2019-7577-Fix-a-buffer-overread-in-MS_ADPCM_nibb.patch
  patch -Np1 -i ../SDL-1.2.15-Reject-2-3-5-6-7-bpp-BMP-images.patch
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd SDL-$pkgver
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd SDL-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/{include,share}

  cd "$pkgdir/usr/bin"
  mv sdl-config sdl-config-32
}
