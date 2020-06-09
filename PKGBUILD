# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-aarch64
pkgver=2.28.2
arch=(aarch64)
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-aarch64-2.28.2.tar.gz')
md5sums=('9fa91dba3ac5d6de5d370ef302d26f2f')
sha1sums=('cc9f3bce54998d7a77001b3a35b60d324262dfee')
sha256sums=('29e48899f1bf32c0461a84a8564e41284b99793fe6f572db834aec0789558f50')
sha512sums=('a790ffc096a24e3c826469c998fff1f743786a151fb6f0ad84fc283a5f14df2f199f9c4cc8fe3e77169b5430b5ce44124b00804b36deb0525095e65983576481')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
