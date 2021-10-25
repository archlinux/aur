# Maintainer: Homalozoa <xuhaiwang at xiaomi dot com>

pkgname=ade
pkgver=4.3.0
pkgrel=1
pkgdesc="ADE creates a Docker container from a base image and mounts additional read-only volumes."
arch=('i686' 'x86_64')
url="https://gitlab.com/ApexAI/ade-cli"
license=('Apache')
depends=('docker')
optdepends=('nvidia-container-toolkit')
source=("https://gitlab.com/ApexAI/ade-cli/-/jobs/1341322851/artifacts/raw/dist/ade+x86_64")
sha256sums=('723dc8b1f2f37a591195e846cd2a1b0e7713f63de1fcb72aa1d88a9ac34adb33')

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ade+x86_64 ${pkgdir}/usr/bin/ade
  chmod +x ${pkgdir}/usr/bin/ade
}
