# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=bottles-bin
pkgver=64.1
pkgrel=2
pkgdesc="Easily manage wine and proton prefixes (prebuilt)"
arch=('any')
url="https://usebottles.com"
license=('GPL-3.0-only')
depends=('gtk4' 'gtksourceview5' 'hicolor-icon-theme' 'icoextract'
         'libadwaita' 'libportal-gtk4' 'python' 'python-cairo'
         'python-certifi' 'python-chardet' 'python-charset-normalizer'
         'python-gobject' 'python-idna' 'python-markdown' 'python-orjson'
         'python-pefile' 'python-pycurl'
         'python-requests' 'python-urllib3' 'python-yaml' 'python-yara')
optdepends=('vkbasalt: post-processing layer that applies the configured effects'
            'vulkan-tools: vkcube test / Vulkan info'
            'xorg-xdpyinfo: display info detection'
            'imagemagick: icon/image conversion'
            'vmtouch: preload bottle files into memory'
            'mangohud: performance overlay'
            'gamemode: feral gamemode integration'
            'gamescope: gamescope session integration'
            'xterm: fallback terminal for "Run executable in terminal"')
provides=('bottles')
conflicts=('bottles')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.zst::https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('94dd4c5138ef491fed0502e87be2bebde6e7fe9d2881fc66285d12a0451ef0a3')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
