# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-bin
pkgver=2.30.1
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
source_aarch64=("${pkgname}-aarch64::https://webreflection.github.io/aur/${pkgname}-aarch64-${pkgver}.tar.gz")
source_armv7h=("${pkgname}-armv7h::https://webreflection.github.io/aur/${pkgname}-armv7l-${pkgver}.tar.gz")
source_armv7l=("${pkgname}-armv7l::https://webreflection.github.io/aur/${pkgname}-armv7l-${pkgver}.tar.gz")
source_x86_64=("${pkgname}-x86::https://webreflection.github.io/aur/${pkgname}-x86_64-${pkgver}.tar.gz")
sha256sums_aarch64=('82a1004f60bf4a7701eade34abbf7494fd4a3623bd81f1becd22a9350e98ef7b')
sha256sums_armv7h=('800a4833ec2acb86a2d44b6491953395aa6c836ef3ff2db4bcb40fbac887925a')
sha256sums_armv7l=('800a4833ec2acb86a2d44b6491953395aa6c836ef3ff2db4bcb40fbac887925a')
sha256sums_x86_64=('6e1b1bcfb47d3af8a0aeb05b31881741ac1ee98046ff00cd2fd51b458bdd0291')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
