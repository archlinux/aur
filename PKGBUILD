# Maintainer: aNNiMON <annimon119 at gmail dot com>
_pkgauthor=aNNiMON
_pkgname=effy
pkgname=effy-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A small and friendly terminal FFmpeg helper that simplifies common tasks"
url="https://projects.annimon.com/projects/effy/"
license=('MIT')
depends=('ffmpeg' 'gcc-libs' 'glibc')
arch=('x86_64' 'aarch64')
options=('!debug')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64-linux.tar.gz::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64-linux.tar.gz::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
b2sums=('2c213e2079debd90949345ff3586aa6e52ed8379bbe643beadf5b82cd4db08ab602c11acff786f783fac1dcf9fce1a5d61905e19a3fbb202457410d03f2ce772')
b2sums_x86_64=('0d5391b6871433816dec85718c315ada82c5f07c331a51fdc097c69ba7f8439429a6b5ebb161fc6488108f28018f0c5e44c54f77d89691d2c87199c3a1c6c04d')
b2sums_aarch64=( '45190f0d0fdc03601c05fa9267f0f57c0a0188e76ffedee000a09fd5bd0a9026799a66f4853a9bb0d26908186092e2cd164da681032aecd074d97f4f9aef7210')

package() {
  install -Dm755 -t "$pkgdir/usr/bin/" "$_pkgname"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
