pkgbase=aa-snapshot-maker
pkgname=( ${pkgbase}-standalone-bin )
pkgver=1.0.2
pkgrel=1
arch=('x86_64')
url="https://audioassault.mx/products/snapshot-maker"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
source=('AA Snapshot Maker.desktop'
        ${pkgbase}.png
        'https://audioassaultdownloads.s3.amazonaws.com/AmpLocker/AmpLocker109/SnapshotMakerLinux.zip')
sha256sums=('b8dcdabd714eaed0b4d06861c5dc6245529ca5e8ef90b46a927878494be17cd6'
            '2ccb54d693ba09c2f86750891f2d1ea090f74fe282c3268617d1519b58f79ad5'
            '0d1c33c678fd8c34c50d84d6f499d0ea00712fddab7d417ee841e9dff2aef0f8')

package_aa-snapshot-maker-standalone-bin() {
    ## Install Standalone Binary
    pkgdesc="Audio Assault amp modeller preset maker (Standalone)"
    groups=('pro-audio')
    install -Dm755 "$srcdir/Snapshot Maker" "$pkgdir/usr/bin/AA Snapshot Maker Standalone"
    install -Dm644 "$srcdir/AA Snapshot Maker.desktop" "$pkgdir/usr/share/applications/AA Snapshot Maker.desktop"
    install -Dm644 "$srcdir/aa-snapshot-maker.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/aa-snapshot-maker.png"
}
