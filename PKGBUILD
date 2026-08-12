# Maintainer: taxin <taxin404@duck.com>

pkgname=uad-ng
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices (next generation)"
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL3')
depends=('android-tools' 'fontconfig' 'vulkan-icd-loader')
provides=('universal-android-debloater' 'uad-ng')
conflicts=('universal-android-debloater' 'universal-android-debloater-bin' 'universal-android-debloater-git')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux"
        "uad-ng.png::$url/raw/main/resources/assets/logo-light.png"
        "uad-ng.desktop")
sha256sums=('bae9ca2a31730dcf6c47d16915a23972690938213fb1705caaebd6d9d8794a34'
            'SKIP'
            'SKIP')

package(){
    install -D -m 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/uad-ng"
    install -D -m 644 "uad-ng.desktop" -t "$pkgdir/usr/share/applications"
    install -D -m 644 "uad-ng.png"     -t "$pkgdir/usr/share/pixmaps"
}
