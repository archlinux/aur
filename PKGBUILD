# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-bin
pkgver=2.30.4
arch=(aarch64 armv7h armv7l x86_64)
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices (gl version)'
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit' 'wpewebkit-git')
conflicts=('wpewebkit' 'wpewebkit-git')
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 openjpeg2 libseccomp bubblewrap xdg-dbus-proxy
         geoclue at-spi2-atk libwpe)
source_aarch64=('wpewebkit-bin-aarch64::https://webreflection.github.io/aur/wpewebkit-bin-aarch64-2.30.4.tar.gz')
source_armv7h=('wpewebkit-bin-armv7h::https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.30.4.tar.gz')
source_armv7l=('wpewebkit-bin-armv7l::https://webreflection.github.io/aur/wpewebkit-bin-armv7l-2.30.4.tar.gz')
source_x86_64=('wpewebkit-bin-x86::https://webreflection.github.io/aur/wpewebkit-bin-x86_64-2.30.4.tar.gz')

sha256sums_aarch64=('7705a6db0ef24393c0fd706bb0f9bc0d1de5435790f9e5675a300f6fe4d4cc07')
sha256sums_armv7l=('8ad8adbe75aa1d1d6890c38e9118234230bd18d466d852109a6a8592292766d9')
sha256sums_armv7h=('8ad8adbe75aa1d1d6890c38e9118234230bd18d466d852109a6a8592292766d9')
sha256sums_x86_64=('325f8f71bb3d08927684b1cb5bb71a22e601607a36556df71acb3c69badabf79')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

