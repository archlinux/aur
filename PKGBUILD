# Maintainer: Alexandre Bancel <gimmeapill at gmail dot com>
# Contributor: Oliver Friedrich <olifriedrich at gmail dot com>

pkgname='sword-text-web'
pkgver=426.0
pkgrel=1
pkgdesc="The World English Bible is an update of the American Standard Version of 1901, which is in the Public Domain. It has been edited to conform to the Greek Majority Text New Testament"
arch=('x86_64')
license=('public-domain')
url="https://packages.debian.org/bookworm/sword-text-web"
depends=('sword')
optdepends=('bibletime')
source=("http://ftp.de.debian.org/debian/pool/main/s/sword-text-web/sword-text-web_426.0-1_all.deb")
sha256sums=('930b23670b352f0829a306501de4bebb5e654a2df02cde2cbe86b802177868e1')

package (){
    bsdtar -xf data.tar.xz
    cp -RPp $(pwd)/usr ../pkg/${pkgname}/usr
}
