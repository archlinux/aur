# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')

depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb' 'qt6-base' 'qt6-charts')
conflicts=('stacer' 'stacer-git')

options=('!strip')

source_x86_64=("https://github.com/QuentiumYT/Stacer/releases/download/v${pkgver}/stacer_${pkgver}-${pkgrel}_amd64.deb")
sha512sums_x86_64=('f083b8325d2a78fae31fce6ed5ce3e85a7aa8bcd7ad5519e14a1c8ac4576fe956629f68c8aee501448705b28b1bf39b81968c393b213cd598ce7740583d03e54')


package() {
    tar xpvf data.tar.zst -C "${pkgdir}"
}
