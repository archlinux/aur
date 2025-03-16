# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Contributor: Kenneth Flak <kennethflak@protonmail.com>

pkgname=touchosc-bin
pkgver=1.3.9.226
pkgrel=1
pkgdesc='Modular control surface'
arch=('x86_64' 'armv7l' 'aarch64')
url=http://hexler.net
license=(custom:TouchOSC)
source_x86_64=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-x64.deb")
source_armv7l=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-armhf.deb")
source_aarch64=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-arm64.deb")
sha256sums_x86_64=('9b2c9bed58b1120fbdf6be47e86d0646eb26f2e941c36975fef829148fbcbc04')
sha256sums_armv7l=('d3317e3e7e188f7bc219430d639f9363789402ee3237f7692fddbaa198d67e84')
sha256sums_aarch64=('2cc4ce6a1980eb5b92320b34c0134ccc38d3ed25942f905de6bd5f81c483599a')

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
