# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Contributor: Kenneth Flak <kennethflak@protonmail.com>

pkgname=touchosc-bin
pkgver=1.3.4.209
pkgrel=1
pkgdesc='Modular control surface'
arch=('x86_64' 'armv7l' 'aarch64')
url=http://hexler.net
license=(custom:TouchOSC)
source_x86_64=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-x64.deb")
source_armv7l=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-armhf.deb")
source_aarch64=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-arm64.deb")
sha256sums_x86_64=('73c84f6c9a38314a92d04bf94332ee8c9241de1a8ddca32c2d574a6fa30a36db')
sha256sums_armv7l=('b9bfaa716ae9bfe2e25db12ae9841ccc93751387368bf66d29b8797b63ccb87d')
sha256sums_aarch64=('740c99ff1e99518b2dfb71f3f112f8f855b5a1e6feeb9d999dda6aa742671a0b')

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
