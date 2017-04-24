# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=aptible-cli
pkgver=0.8.6
pkgrel=1
pkgdesc="The full stack of aptible-toolbelt"
arch=('x86_64')
url="https://www.aptible.com/support/toolbelt/"
license=('MIT')
groups=('aptible')
options=('!strip')
source=("https://omnibus-aptible-toolbelt.s3.amazonaws.com/aptible/omnibus-aptible-toolbelt/master/136/pkg/aptible-toolbelt_0.8.6%2B20170421092843~ubuntu.16.04-1_amd64.deb")
md5sums=('1cbc1bb590a15aafbf39cd761c80460b')

package() {
    msg2 "Extracting data.tar.gz..."
    tar xf data.tar.gz -C "$pkgdir/"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/aptible-toolbelt/bin/aptible "$pkgdir/usr/bin/aptible"
}
