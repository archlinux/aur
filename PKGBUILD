# Maintainer: Lionel Miller <delonorm at gmail dot com>
# Maintainer: Marat Talipov <t-marat.yandex.ru>

pkgname=kontur-plugin
pkgver=4.0.4.202
pkgrel=2
pkgdesc="Kontur.Plugin is an extension for web browsers that allows users to perform cryptographic operations in SKB Kontur services."
arch=('x86_64')
_filename="kontur.plugin_amd64.deb"
license=('proprietary')
depends=(
    'gtk3'
    'cryptopro-csp-k1'
)
url="https://help.kontur.ru/plugin/"
source=("https://help.kontur.ru/plugin/dist/$_filename")
sha256sums=('f24a12551b00b63af4f267ff6b94f761a711509c49cfa187022356cdc76d61d8')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir/"
    rm -r "$pkgdir/usr/lib64/"  # /usr/lib64 is a symlink to /usr/lib
}