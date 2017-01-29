# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=aptible-cli
pkgver=0.8.4
pkgrel=1
pkgdesc="The full stack of aptible-toolbelt"
arch=('x86_64')
url="https://www.aptible.com/support/toolbelt/"
license=('MIT')
groups=('aptible')
options=('!strip')
source=("https://omnibus-aptible-toolbelt.s3.amazonaws.com/aptible/omnibus-aptible-toolbelt/master/132/pkg/aptible-toolbelt_0.8.4%2B20170125114552%7Eubuntu.16.04-1_amd64.deb")
md5sums=('fa0dd1e6dd9a6907ec4b495a605a2d89')

package() {
    msg2 "Extracting data.tar.gz..."
    tar xf data.tar.gz -C "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/aptible-toolbelt/bin/aptible "$pkgdir/usr/bin/aptible"
}
