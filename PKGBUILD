# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=pup-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Parsing HTML at the command line"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ericchiang/pup"
license=('MIT')
provides=('pup')
conflicts=('pup')
source=("https://raw.githubusercontent.com/ericchiang/pup/v$pkgver/LICENSE"
	"https://raw.githubusercontent.com/ericchiang/pup/v$pkgver/README.md")
source_i686=("pup_i686.zip::https://github.com/ericchiang/pup/releases/download/v$pkgver/pup_v${pkgver}_linux_386.zip")
source_x86_64=("pup_x86_64.zip::https://github.com/ericchiang/pup/releases/download/v$pkgver/pup_v${pkgver}_linux_amd64.zip")
source_arm=("pup_arm.zip::https://github.com/ericchiang/pup/releases/download/v$pkgver/pup_v${pkgver}_linux_arm.zip")
source_armv6h=("pup_armv6h.zip::https://github.com/ericchiang/pup/releases/download/v$pkgver/pup_v${pkgver}_linux_arm.zip")
source_armv7h=("pup_armv7h.zip::https://github.com/ericchiang/pup/releases/download/v$pkgver/pup_v${pkgver}_linux_arm.zip")
source_aarch64=("pup_aarch64.zip::https://github.com/ericchiang/pup/releases/download/v$pkgver/pup_v${pkgver}_linux_arm64.zip")
md5sums=('a98550ce25e61b1d40f1670e9857c6ff'
         '433d27029de6bf91620c4e67f3f1ac6f')
md5sums_i686=('ea17c052261cf6d075e56d427baf8a91')
md5sums_x86_64=('f008b357bc126fc018a9af5c2faa9c18')
md5sums_arm=('ebb328b175d53a02529cc67d1a121ed3')
md5sums_armv6h=('ebb328b175d53a02529cc67d1a121ed3')
md5sums_armv7h=('ebb328b175d53a02529cc67d1a121ed3')
md5sums_aarch64=('71cb57f6bfb111a8a28fa52633d10b90')

package() {
  install -D -m755 pup "$pkgdir/usr/bin/pup"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
