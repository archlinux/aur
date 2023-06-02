# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Contributor: Kenneth Flak <kennethflak@protonmail.com>

pkgname=touchosc-bin
pkgver=1.2.1.171
pkgrel=1
pkgdesc='Modular control surface'
arch=('x86_64' 'armv7l' 'aarch64')
url=http://hexler.net
license=(custom:TouchOSC)
source_x86_64=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-x64.deb")
source_armv7l=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-armhf.deb")
source_aarch64=("https://hexler.net/pub/touchosc/touchosc-$pkgver-linux-arm64.deb")
sha256sums_x86_64=('89169bd87f9362919c50107fc76fcce0dbaea562e3bede04bf231ce5c7d6c9ea')
sha256sums_armv7l=('92086868b437684232b5d9b19665573ee65607083f03763734bd964a61cac4c3')
sha256sums_aarch64=('9489be5fece7229f3471b55bf0a124799c223244eca9d44b01f23eddaf4181f6')

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
