# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: w1nst0n <w1nst0n at keemail dot me>

pkgname="uad-ng-bin"
pkgver=1.0.2
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices (next generation)"
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL3')
depends=('android-tools' 'fontconfig' 'vulkan-icd-loader')
provides=('universal-android-debloater')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux"
        "uad-ng.png::$url/blob/main/resources/assets/logo.png?raw=true"
        "uad-ng.desktop")
b2sums=('04f7fcc4937d8eafe4cd216ba772b9e123612c8af6f1e8a61449eb1cd5ba5ac051303c7bc1c483fa2fe923f53ad34e621bc54c0a2edcaaf8e75c3f0bfa079d92'
        '8d1f5a4cf5f80f1d0366b0e8328458441554615b7171660bd8ca1e7cee76e10b38eeb1e4adac4ea5d2c3fbe7a9a9dcbf17450b9d02d96ab592b5f1bfbc7675d9'
        '4c9b2992778ba84b7085b1c26dd8d27b6238f482521c1b3f18c2b2cd0f77d5094c15a6d84a916ba00b51cd2fb102c25de2bb5f803ef092a2b600ef40a43d9a2e')

package(){
 install -D -m 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/uad-ng"
 install -D -m 644 "uad-ng.desktop" -t "$pkgdir/usr/share/applications"
 install -D -m 644 "uad-ng.png"     -t "$pkgdir/usr/share/pixmaps"
}
