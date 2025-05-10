# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=ocm-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="CLI for the Red Hat OpenShift Cluster Manager"
arch=("any")
url="https://github.com/openshift-online/ocm-cli"
license=("Apache-2.0")
provides=("ocm")
conflicts=("ocm")
source=("https://github.com/openshift-online/ocm-cli/releases/download/v$pkgver/ocm-linux-amd64")
b2sums=('3a09b33fd495cd7ad81e3b399d5f75864f98c4b0a203ea3ada5c3fc66d94bebe672cc99d3751290dc28729ec6d411bb6044bdd15e523d49b606c02e4fecb1d11')

package() {
    install -Dm755 "ocm-linux-amd64" "${pkgdir}/usr/bin/ocm"
}
