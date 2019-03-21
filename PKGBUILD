# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgname=wpewebkit-gl-aarch64
pkgver=2.22.5
pkgrel=2
pkgdesc='Web content engine library optimized for embedded devices (gl version)'
arch=(aarch64)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
provides=('wpewebkit')
conflicts=('wpewebkit')
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 'libwpe>=1.0.0')
source=('https://webreflection.github.io/aur/wpewebkit-gl-aarch64-2.22.5.tar.gz')
md5sums=('36a40c4e34c1f495de80870f1075a93e')
sha1sums=('9e41fd0ac0f626f4943b21088a06aecff6ae0d4e')
sha256sums=('10ede81a1b18d32f95907fb1920bf8aca72d40fca653986362c12b45acfde791')
sha512sums=('896caeb7af81a74829eec0c182d4fdfe4d2975fd42c492fe386cc0e915e38068685be818eea474d56d5bb5c29ee934eedd96394a008863df060caf19b6bcea2b')


package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}

