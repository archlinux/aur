# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: T. Jameson Little <t.jameson.little@gmail.com>

pkgname=geckodriver-bin
pkgver=0.33.0
pkgrel=1
pkgdesc="WebDriver for Firefox"
arch=('i686' 'x86_64' 'aarch64')
url="https://firefox-source-docs.mozilla.org/testing/geckodriver/"
license=('MPL')
provides=("geckodriver=$pkgver")
conflicts=('geckodriver')
source_i686=("https://github.com/mozilla/geckodriver/releases/download/v${pkgver}/geckodriver-v${pkgver}-linux32.tar.gz"{,.asc})
source_x86_64=("https://github.com/mozilla/geckodriver/releases/download/v${pkgver}/geckodriver-v${pkgver}-linux64.tar.gz"{,.asc})
source_aarch64=("https://github.com/mozilla/geckodriver/releases/download/v${pkgver}/geckodriver-v${pkgver}-linux-aarch64.tar.gz"{,.asc})
sha256sums_i686=('71f4e7ef229ce7964afcee82750a910e4bdd3dd0ec1d4b155c62c77903439f91'
                 'SKIP')
sha256sums_x86_64=('5f5e89bb31fe5f55f963f56ef7e55a5c8e9dc415d94b1ddc539171a327b8e6c4'
                   'SKIP')
sha256sums_aarch64=('00325caac5cbd9a45b4c5d1733cfdbeb43d0629f6cc5f5be909f23109548f88f'
                    'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')  # Mozilla Software Releases <release@mozilla.com>


package() {
  install -Dm755 "$srcdir/geckodriver" -t "$pkgdir/usr/bin"
}
