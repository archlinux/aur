# Maintainer:tmdp6k <mc469617638@outlook.com>
pkgname=hmcl-ce-bin
pkgver=26.8.2
_pkgver=26.8-release.2
pkgrel=1
pkgdesc='Community Edition of Hello Minecraft! Launcher.社区驱动、跨平台且可扩展的 Minecraft 启动器。实例、模组、整合包与账户，在一个干净的工作台里各就各位。'
options=('!strip' '!debug' '!emptydirs')
arch=('x86_64' 'aarch64')
url='https://github.com/HMCL-Community/HMCL-CE'
license=('GPL-3.0 License')
depends=(java-runtime-common java-environment-common jdk25-openjdk)
source_x86_64=(https://github.com/HMCL-Community/HMCL-CE/releases/download/v26.8-release.2/HMCL-CE-${_pkgver}.deb)
source_aarch64=(https://github.com/HMCL-Community/HMCL-CE/releases/download/v26.8-release.2/HMCL-CE-${_pkgver}.deb)
sha256sums_x86_64=('47da036354264f81b844b0e292b03c7dd6236ed52cff6c40af4bdb8d0185a570')
sha256sums_aarch64=('47da036354264f81b844b0e292b03c7dd6236ed52cff6c40af4bdb8d0185a570')
package() {
 cd "$srcdir"
 ar x "HMCL-CE-${_pkgver}.deb"
 bsdtar -xf data.tar.gz -C "${pkgdir}/"
 echo "Can you give a star for me?Thank You"
 echo "[SHOUT]YOU NEED USE JAVA21+ to RUN THIS CE VERSION"
}
