# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: w1nst0n <w1nst0n at keemail dot me>

pkgname="uad-ng-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices (next generation)"
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL3')
depends=('android-tools' 'fontconfig' 'vulkan-icd-loader')
provides=('universal-android-debloater')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/uad-ng-noselfupdate-linux"
        "uad-ng.png::$url/blob/main/resources/assets/logo-light.png?raw=true"
        "uad-ng.desktop")
b2sums=('24718a19d4375967b6932b0086461498cd41a93088782444d13e65cc4a0402e70ce64306dd21b14986f99b2809a94025cd93acd32f1288a6b77b9c5e9fa593cd'
        'f9640fd91892224bccc16ce48dae13d383fd79a9dd5ed6056d81553321d8327923b95b850d208c7c89dd3a7eba2b37bd91ffe99c5fe8fb1b5b7b01dcc3277fa0'
        '4c9b2992778ba84b7085b1c26dd8d27b6238f482521c1b3f18c2b2cd0f77d5094c15a6d84a916ba00b51cd2fb102c25de2bb5f803ef092a2b600ef40a43d9a2e')

package(){
 install -D -m 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/uad-ng"
 install -D -m 644 "uad-ng.desktop" -t "$pkgdir/usr/share/applications"
 install -D -m 644 "uad-ng.png"     -t "$pkgdir/usr/share/pixmaps"
}
