# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=chiaki-ng-bin
pkgver=1.10.0
pkgrel=1
pkgdesc="Free and Open Source PlayStation Remote Play client (prebuilt)"
arch=('x86_64')
url="https://streetpea.github.io/chiaki-ng/"
license=('LicenseRef-AGPL-3.0-only-OpenSSL')
depends=('curl' 'ffmpeg' 'fftw' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'hidapi' 'json-c' 'libidn2' 'libplacebo' 'libpsl' 'libssh2'
         'miniupnpc' 'openssl' 'opus' 'qt6-base' 'qt6-declarative' 'qt6-svg'
         'qt6-webengine' 'sdl2' 'speexdsp' 'zlib')
optdepends=('intel-media-driver: vaapi backend for Intel GPUs [>= Broadwell]'
            'libva-intel-driver: vaapi backend for Intel GPUs [<= Haswell]'
            'libva-mesa-driver: vaapi backend for AMD GPUs')
provides=('chiaki-ng' 'chiaki')
conflicts=('chiaki-ng' 'chiaki')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('76c55be0342c651a65ffe5df5ed14930d43b844590cac9f4ea67d23e80557599')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
