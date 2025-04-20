pkgbase=5db5-compressor
pkgname=( ${pkgbase}-{lv2,vst3}-bin )
pkgver=1.0.0
pkgrel=2
arch=('x86_64')
url="https://audioassault.mx/plugin/Compressor551"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
provides=('5db5-compressor')
source=('https://5db5public.s3.amazonaws.com/Compressor551Linux.zip')
sha256sums=('951123384a1816c09ec2686abc50f73a0dd3bbd8db7af1ae85ffa8aa3378561a')

package_5db5-compressor-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="British Style Compressor (LV2)"
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/Compressor551.lv2/Compressor551.so" "$pkgdir/usr/lib/lv2/Compressor551.lv2/Compressor551.so"
    install -Dm644 "$srcdir/Compressor551.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Compressor551.lv2/dsp.ttl"
    install -Dm644 "$srcdir/Compressor551.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Compressor551.lv2/manifest.ttl"
    install -Dm644 "$srcdir/Compressor551.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Compressor551.lv2/ui.ttl"
}

package_5db5-compressor-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="British Style Compressor (VST3)"
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/Compressor551.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/Compressor551.vst3/Contents/Resources/moduleinfo.json"
    install -Dm755 "$srcdir/Compressor551.vst3/Contents/x86_64-linux/Compressor551.so" "$pkgdir/usr/lib/vst3/Compressor551.vst3/Contents/x86_64-linux/Compressor551.so"
}
