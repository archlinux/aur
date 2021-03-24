# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Original submitter's Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname="jiq-bin"
pkgver=0.7.1
pkgrel=2
pkgdesc='Interactive JSON query tool using jq expressions'
arch=('x86_64')
url='https://github.com/fiatjaf/jiq'
license=('MIT')
depends=('jq')
provides=("jiq")
conflicts=("jiq")

source=("jiq-${pkgver}-readme::https://github.com/fiatjaf/jiq/raw/${pkgver}/README.md"
        "jiq-${pkgver}-license::https://github.com/fiatjaf/jiq/raw/${pkgver}/LICENSE")
source_x86_64=("jiq-${pkgver}-x86_64::https://github.com/fiatjaf/jiq/releases/download/${pkgver}/jiq_linux_amd64")

b2sums=('1db52e38549bf2e38dcfe7df9d564cb3ce5be56ee6af6c1bdb5e27c50887e786ed484ac7b572bf90c0d9ddf7967ba2497de825cf5c8d9a00ded3ec738cb75f41'
        'bc715507c1551ee3bf11013fe54c2ddb9e218092852401ce858b6d50b014e67463bcd7ede03c8332375254a9864ef3bb9005f90adad19083caa949e1935ffbe4')
b2sums_x86_64=('3c18f7e2081de45fc5b7cfc350da274b1e27ce4607c1923b8abf6a4ed4aa831167076ad23f338f24efaa6e72526dc39b009d67ca7df5e4a4bfd62fc3477249a3')

package() {
  install -Dvm755 "jiq-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/jiq"
  install -Dvm644 "jiq-${pkgver}-readme" "${pkgdir}/usr/share/doc/jiq/README.md"
  install -Dvm644 "jiq-${pkgver}-license" "${pkgdir}/usr/share/licenses/jiq/LICENSE"
}

# vim: ts=2 sw=2 et:
