# Maintainer: MaxCrazy <alex02newton@gmail.com>

pkgname=shatv-bin
pkgver=0.1.0_alpha
pkgrel=1
_release_tag=v0.1.0-alpha
pkgdesc='Qt-based IPTV player with bundled sherpa-onnx speech recognition'
arch=('x86_64')
url='https://github.com/MaxCrazy1101/shatv'
license=('MIT')
depends=(
  'ffmpeg'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libarchive'
  'qt6-base'
  'qt6-declarative'
  'qt6-multimedia'
  'qt6-shadertools'
  'zlib'
)
provides=('shatv' 'shatv-asr')
conflicts=('shatv' 'shatv-git' 'shatv-asr' 'shatv-asr-bin')
options=('!strip')
source=("https://github.com/MaxCrazy1101/shatv/releases/download/${_release_tag}/shatv-arch-x86_64-asr.tar.zst")
sha256sums=('84eb1f2ff3ed6f0e89046f0eaa28db647a2edc4c62e8c4a22ff887eaf9f9b37a')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
