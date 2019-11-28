# Maintainer: Alex Zaslavsky <alex@wall-dev.org>

pkgname=gebaar-libinput-fork
pkgver=0.1.3
pkgrel=1
pkgdesc='A Super Simple WM Independent Touchpad Gesture Daemon for libinput. Forked version with new features'
arch=('x86_64')
url="https://github.com/Osleg/$pkgname"
license=('GPL3')
depends=('libinput')
conflicts=('gebaar')
provides=('gebaar')
source=('https://github.com/osleg/gebaar-libinput-fork/releases/download/v0.1.4/gebaard'
  'https://raw.githubusercontent.com/osleg/gebaar-libinput-fork/master/LICENSE'
  'https://raw.githubusercontent.com/osleg/gebaar-libinput-fork/master/README.md')
md5sums=('74efb11da5bb1714e114e6305d999186'
  'SKIP'
  'SKIP')


package() {
  install -Dm755 gebaard "$pkgdir/usr/bin/gebaard"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
