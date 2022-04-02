# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=rg2sc
pkgver=2.1
pkgrel=1
pkgdesc='Converts ReplayGain ID3 tags to Apple Sound Check tags'
url='https://github.com/rwinkhart/rg2sc'
arch=('any')
license=('GPL2')
depends=(python python-mutagen)

source=("https://github.com/rwinkhart/rg2sc/releases/download/v$pkgver/rg2sc-$pkgver.tar.xz")
sha512sums=('92aaf35901c63be4adb24cf787c99cb541e53c5a4013635d7ba3c4d92cc8f0012772cf6916b14575266ad1769739c69abdd445416958ed2f38e503954886a1b0')

package() {

    tar xf rg2sc-"$pkgver".tar.xz -C "${pkgdir}"

}

