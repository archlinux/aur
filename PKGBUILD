# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: w1nst0n <w1nst0n at keemail dot me>
# Contributor: guglovich <guglovich164 at gmail dot com>

pkgname="uad-ng-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices (next generation)"
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL-3.0')
depends=('android-tools' 'fontconfig' 'vulkan-icd-loader')
optdepends=('android-tools: for ADB connections')
provides=('universal-android-debloater' 'uad-ng')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/uad-ng-linux"
        "uad-ng.png::$url/raw/v$pkgver/resources/assets/logo-light.png"
        "uad-ng.desktop")
sha256sums=('8a87865ca150749c5c80644d0fd0c32789407b1329fbb9ea7adc46d8cc3884de'
            'SKIP'
            'SKIP')

package(){
 install -D -m 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/uad-ng"
 install -D -m 644 "uad-ng.desktop" -t "$pkgdir/usr/share/applications"
 install -D -m 644 "uad-ng.png"     -t "$pkgdir/usr/share/pixmaps"
}
