# Maintainer: Jeandre Le Roux <theblazehen@gmail.com>

options=(!strip)
pkgname=arweave-deploy-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Arweave-deploy binary with bundled nodejs"
url="https://github.com/ArweaveTeam/arweave-deploy"
source=("https://github.com/ArweaveTeam/arweave-deploy/raw/v1.9.0/dist/linux/arweave")
md5sums=('1089ad4117f571176cd9bcb433f84b55')
arch=("x86_64")


package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod a+x arweave
  cp arweave "${pkgdir}/usr/bin"
}

