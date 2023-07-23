# Maintainer: Erica Marigold <hi@devcomp.xyz>
pkgname=lune
pkgver=0.7.5
pkgrel=1
pkgdesc="PRECOMPILED - A standalone Luau script runtime"
arch=('x86_64' 'aarch64')
url="https://github.com/filiptibell/lune"
license=('MPL')
provides=('lune')
conflicts=('lune-git')
source_x86_64=("https://github.com/filiptibell/lune/releases/download/v$pkgver/lune-$pkgver-linux-x86_64.zip")
source_aarch64=("https://github.com/filiptibell/lune/releases/download/v$pkgver/lune-$pkgver-linux-aarch64.zip")
sha256sums_x86_64=('eaec8e6361c8f9b4e63f756cc9b83a94bbbba28b060e5338a144e499aae2881c')
sha256sums_aarch64=('dad5292299db3359c8676c8e294cb9b30105ad1a47f9d96ee99fa34f2684f4fd')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mv "$srcdir/lune" "$pkgdir/usr/bin"
}
