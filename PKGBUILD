# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=aptible-cli
pkgver=0.16.1
pkgrel=1
pkgdesc="The full stack of aptible-toolbelt"
arch=('x86_64')
url="https://www.aptible.com/support/toolbelt/"
license=('MIT')
groups=('aptible')
options=('!strip')
source=("https://omnibus-aptible-toolbelt.s3.amazonaws.com/aptible/omnibus-aptible-toolbelt/master/176/pkg/aptible-toolbelt_0.16.1%2B20180730142023%7Eubuntu.16.04-1_amd64.deb")
md5sums=('b0c49ca9deda9a6ccf9899e9b1256c39')

package() {
    msg2 "Extracting data.tar.gz..."
    tar xf data.tar.gz -C "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/aptible-toolbelt/bin/aptible "$pkgdir/usr/bin/aptible"
}
