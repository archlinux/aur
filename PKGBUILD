# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: T. Jameson Little <t.jameson.little@gmail.com>

pkgname=geckodriver-bin
pkgver=0.32.2
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
sha256sums_i686=('adc594696c6364d6068a27ba74c22650f3fa1f02cfb824123b439f17443d5577'
                 'SKIP')
sha256sums_x86_64=('1eab226bf009599f5aa1d77d9ed4c374e10a03fd848b500be1b32cefd2cbec64'
                   'SKIP')
sha256sums_aarch64=('abe7aa14104eacd451d06993c024b4cdb32bbded476230ae7e1c349b93b5601c'
                    'SKIP')
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353')  # Mozilla Software Releases <release@mozilla.com>


package() {
  install -Dm755 "$srcdir/geckodriver" -t "$pkgdir/usr/bin"
}
