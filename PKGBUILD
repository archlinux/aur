# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

pkgname='corepacker'
pkgver=0.0.0
pkgrel=3
pkgdesc='Remove npm, yarn and pnpm using corepack'
arch=('any')
url='https://github.com/nodejs/corepack/'
license=('')
source=("corepacker-enable.hook" "corepacker-disable.hook")
sha512sums=('4a85b4e08cd3fd607ddbd1e8bd2b668cd9b7f9aa3b505fc51f2c054c63cf900e0bc824d53adc743d0e002fe745a0b95e0f739654fd97978f42aef072942ce926'
            '5555ef13ec739b7f0766bb25687499c50bafcaf55f15a839e76d330af2966b6640ba30b22f0684c8a94f5e1b1bde62966fe5823506238ff76ccf5b2059b90061')
provides=("npm" "yarn" "pnpm")
conflicts=("npm" "yarn" "pnpm")
depends=("nodejs")

package() {
  install -D -m0644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook
}
