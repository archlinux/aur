# Maintainer: siers <wimuan@gmail.com>
pkgname=chromium-libnotify-notifications
pkgver=latest
pkgrel=1
pkgdesc="Causes the Chromium web browser to automatically install and update the libnotify-notifications."
arch=(any)
url="https://chrome.google.com/webstore/detail/libnotify-notifications-i/epckjefillidgmfmclhcbaembhpdeijg"
license=('MIT')
depends=('chromium')
options=()
source=()
md5sums=()
package() {
    cd "$srcdir/"
    name=epckjefillidgmfmclhcbaembhpdeijg
    echo '{ "external_update_url": "https://clients2.google.com/service/update2/crx" }' \
        > $name.json

    install -D -m 644 $name.json "$pkgdir/usr/lib/chromium/extensions/$name.json"
}
