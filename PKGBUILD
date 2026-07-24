# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=chromium-widevine-helper-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="Extension + native helper that installs Google's Widevine CDM into Chromium-based browser profiles (prebuilt)"
arch=('any')
url="https://github.com/GloriousEggroll/chromium-widevine-helper"
license=('GPL-3.0-only')
depends=('python' 'procps-ng' 'ca-certificates')
provides=('chromium-widevine-helper')
conflicts=('chromium-widevine-helper')
backup=('etc/helium/native-messaging-hosts/org.chromium.widevine.json'
        'etc/net.imput.helium/native-messaging-hosts/org.chromium.widevine.json'
        'etc/chromium/native-messaging-hosts/org.chromium.widevine.json'
        'etc/chromium-browser/native-messaging-hosts/org.chromium.widevine.json'
        'etc/opt/chrome/native-messaging-hosts/org.chromium.widevine.json'
        'etc/opt/edge/native-messaging-hosts/org.chromium.widevine.json'
        'etc/brave/native-messaging-hosts/org.chromium.widevine.json'
        'etc/vivaldi/native-messaging-hosts/org.chromium.widevine.json'
        'etc/opera/native-messaging-hosts/org.chromium.widevine.json'
        'etc/thorium/native-messaging-hosts/org.chromium.widevine.json'
        'etc/iridium/native-messaging-hosts/org.chromium.widevine.json')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('efb70f082652176710b403a2629333220c1b8b96e3f27f398ba7efb496982829')

package() {
  cp -a "$srcdir/usr" "$srcdir/etc" "$pkgdir/"
}
