# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=ocm-bin
pkgver=1.0.8
pkgrel=2
pkgdesc="CLI for the Red Hat OpenShift Cluster Manager"
arch=("x86_64")
url="https://github.com/openshift-online/ocm-cli"
license=("Apache-2.0")
provides=("ocm")
conflicts=("ocm")
source=("https://github.com/openshift-online/ocm-cli/releases/download/v$pkgver/ocm-linux-amd64")
b2sums=('9943822a61e310faeeb15c633eb920f2dd4f80596f9f1ceb4444cdd856f01d255dcecfa89f2e2519eafbaf9ffc55a8b5199e738a40ce3eed328747ddcbe7ee2f')

package() {
    install -Dm755 "ocm-linux-amd64" "${pkgdir}/usr/bin/ocm"
}
