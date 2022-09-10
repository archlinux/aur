# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Contributor: Kenneth Flak <kennethflak@protonmail.com>

pkgname=touchosc-bin
pkgver=1.1.5.145
pkgrel=1
pkgdesc='Modular control surface'
arch=('x86_64' 'armv7l' 'aarch64')
url=http://hexler.net
license=(custom:TouchOSC)
source_x86_64=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-$arch.deb")
source_armv7l=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-armhf.deb")
source_aarch64=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-arm64.deb")
sha256sums_x86_64=('2ecad1e3a12973cc7429373695b54dd6b6dbe4a6576131bca32809d419ac082f')
sha256sums_armv7l=('c27b3485bfb9b3b7046d5fb872b516449d72537a65d4dd0d27419698ce14be8b')
sha256sums_aarch64=('dea6ebf5dbde783a8ff69b19372379db407626e1bf47dcafa585fd09da91ed32')

package() {

    cd "$srcdir"

    tar xzf data.tar.gz

    sed -i 's:opt/touchosc:usr/bin:g' usr/share/applications/touchosc.desktop

    install -Dm755 $srcdir/opt/touchosc/TouchOSC $pkgdir/usr/bin/TouchOSC
    install -Dm644 $srcdir/usr/share/applications/touchosc.desktop -t $pkgdir/usr/share/applications

    install -Dm644 $srcdir/usr/share/icons/hicolor/16x16/apps/touchosc.png -t $pkgdir/usr/share/icons/hicolor/16x16/apps
    install -Dm644 $srcdir/usr/share/icons/hicolor/16x16/mimetypes/application-x-touchosc-layout.png -t $pkgdir/usr/share/icons/hicolor/16x16/mimetypes
    install -Dm644 $srcdir/usr/share/icons/hicolor/16x16/mimetypes/application-x-touchosc-classic-layout.png -t $pkgdir/usr/share/icons/hicolor/16x16/mimetypes

    install -Dm644 $srcdir/usr/share/icons/hicolor/32x32/apps/touchosc.png -t $pkgdir/usr/share/icons/hicolor/32x32/apps
    install -Dm644 $srcdir/usr/share/icons/hicolor/32x32/mimetypes/application-x-touchosc-layout.png -t $pkgdir/usr/share/icons/hicolor/32x32/mimetypes
    install -Dm644 $srcdir/usr/share/icons/hicolor/32x32/mimetypes/application-x-touchosc-classic-layout.png -t $pkgdir/usr/share/icons/hicolor/32x32/mimetypes

    install -Dm644 $srcdir/usr/share/icons/hicolor/48x48/apps/touchosc.png -t $pkgdir/usr/share/icons/hicolor/48x48/apps
    install -Dm644 $srcdir/usr/share/icons/hicolor/48x48/mimetypes/application-x-touchosc-layout.png -t $pkgdir/usr/share/icons/hicolor/48x48/mimetypes
    install -Dm644 $srcdir/usr/share/icons/hicolor/48x48/mimetypes/application-x-touchosc-classic-layout.png -t $pkgdir/usr/share/icons/hicolor/48x48/mimetypes

    install -Dm644 $srcdir/usr/share/icons/hicolor/128x128/apps/touchosc.png -t $pkgdir/usr/share/icons/hicolor/128x128/apps
    install -Dm644 $srcdir/usr/share/icons/hicolor/128x128/mimetypes/application-x-touchosc-layout.png -t $pkgdir/usr/share/icons/hicolor/128x128/mimetypes
    install -Dm644 $srcdir/usr/share/icons/hicolor/128x128/mimetypes/application-x-touchosc-classic-layout.png -t $pkgdir/usr/share/icons/hicolor/128x128/mimetypes

    install -Dm644 $srcdir/usr/share/icons/hicolor/256x256/apps/touchosc.png -t $pkgdir/usr/share/icons/hicolor/256x256/apps
    install -Dm644 $srcdir/usr/share/icons/hicolor/256x256/mimetypes/application-x-touchosc-layout.png -t $pkgdir/usr/share/icons/hicolor/256x256/mimetypes
    install -Dm644 $srcdir/usr/share/icons/hicolor/256x256/mimetypes/application-x-touchosc-classic-layout.png -t $pkgdir/usr/share/icons/hicolor/256x256/mimetypes

    install -Dm644 $srcdir/usr/share/mime/packages/touchosc.xml -t $pkgdir/usr/share/mime/packages


}
