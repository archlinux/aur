# Maintainer: Ash <xash at riseup d0t net>
pkgname=delta-patcher
pkgver=3.1.6
pkgrel=1
pkgdesc="GUI software that is able to create and apply xdelta patches"
arch=('x86_64')
url="https://github.com/marco-calautti/DeltaPatcher"
license=('GPL-2.0')
depends=('gtk3')
source=("linuxGTK3_bin_x86_64_v$pkgver.zip::https://github.com/marco-calautti/DeltaPatcher/releases/download/v$pkgver/linuxGTK3_bin_x86_64.zip"
        "https://raw.githubusercontent.com/marco-calautti/DeltaPatcher/master/graphics/icon16.png"
        "https://raw.githubusercontent.com/marco-calautti/DeltaPatcher/master/graphics/icon24.png"
        "https://raw.githubusercontent.com/marco-calautti/DeltaPatcher/master/graphics/icon32.png"
        "https://raw.githubusercontent.com/marco-calautti/DeltaPatcher/master/graphics/icon48.png"
        "https://raw.githubusercontent.com/marco-calautti/DeltaPatcher/master/graphics/icon64.png"
        "https://raw.githubusercontent.com/marco-calautti/DeltaPatcher/master/graphics/icon128.png"
        "https://raw.githubusercontent.com/marco-calautti/DeltaPatcher/master/graphics/icon256.png"
        "delta-patcher.desktop"
        "LICENSE")
sha256sums=('89819df1526ba1d5db9cf70eccda7b963a9a8015d215f23b892f087e569a46dc'
            '52336a292752264741255a26964bcd002a5ef460e4ee5fad3bd11cf632fbb136'
            '5fe02b046878de637d94b0716597cae5ade2eb1791046c41eac5929bf45816bf'
            '511526e33c7242fb264456ca98d6eb166dbc059c8379d71be10f571bf6a9cb9e'
            '17657d944472226d2276597918777af1aa1f8d6f6ac655f4bdcc891eee81042b'
            '97ab3b4a37bdb6de59e5206085cdf6ed505aa45b4c6def30358164171f110b0b'
            'a98c5074f3bf3d8f8ac5050e69557ecb025408190106e9a5a61e37e96a2a6cb5'
            'd00effcde838ae7c72dd2ac799cfca83c94222ef85251950486c1b8f647b6ab3'
            '7a56a58b74ff45e63ae345d9af875ab1cd5ca74430a4f69837ba19cda41916ca'
            '4ad8bba835ec58ad6c0cb3a446d10dd8ab44c3fb9812bb628e1b9b3d7e8d5019')

package() {
    cd "$srcdir"

    install -Dm755 DeltaPatcher "$pkgdir/usr/bin/delta-patcher"
    install -Dm644 delta-patcher.desktop "$pkgdir/usr/share/applications/delta-patcher.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 icon16.png  "$pkgdir/usr/share/icons/hicolor/16x16/apps/delta-patcher.png"
    install -Dm644 icon24.png  "$pkgdir/usr/share/icons/hicolor/24x24/apps/delta-patcher.png"
    install -Dm644 icon32.png  "$pkgdir/usr/share/icons/hicolor/32x32/apps/delta-patcher.png"
    install -Dm644 icon48.png  "$pkgdir/usr/share/icons/hicolor/48x48/apps/delta-patcher.png"
    install -Dm644 icon64.png  "$pkgdir/usr/share/icons/hicolor/64x64/apps/delta-patcher.png"
    install -Dm644 icon128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/delta-patcher.png"
    install -Dm644 icon256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/delta-patcher.png"
}
