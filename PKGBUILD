# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tweet-tray-bin
pkgver=1.1.5
pkgrel=1
pkgdesc='Tweet quickly from the desktop without any distractions'
arch=('x86_64')
url="https://github.com/jonathontoon/tweet-tray"
license=('MIT')
provides=('tweet-tray')
depends=('gconf'
         'gtk2'
         'alsa-lib'
         'libxss'
         'libxtst'
         'nss')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/jonathontoon/tweet-tray/releases/download/v${pkgver}/tweet-tray-${pkgver}.deb"
        'LICENSE::https://github.com/jonathontoon/tweet-tray/raw/master/LICENSE.md')
sha256sums=('51a7903e11aba5860848a1b0e64e6746a0632235562d375ce402673624ff2ffe'
            'bd3d4086d1b3e914291e55349490a61a4903a2ba51dc8bbb5a70429015e33927')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=2 sw=2 et: