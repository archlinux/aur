# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-x86_64
pkgver=2.30.1
arch=(x86_64)
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
source=('https://webreflection.github.io/aur/wpewebkit-gl-x86_64-2.30.1.tar.gz')
md5sums=('6a2daadedbd2f6c558c57238701b51c5')
sha1sums=('5875343c9c53a0acd1092630ef4a6f322190899a')
sha256sums=('d084c32a49d7c03851aefea93098e38491edc0887fb39f60da78920636569327')
sha512sums=('f90e64e5dbcb6f0d291fd57227b9ec80e7c8b532f9af49199b2f1d760c874fa0d161940968c5f1ff812f10ca9c47f75a9db0e1d871504cafcc2a56d667e68581')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
