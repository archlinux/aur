# Maintainer Harvies <delverjw@gmail.com>
pkgname=feishu
pkgver=4.8.0_24
pkgrel=1
pkgdesc="Empowering teams by messenger, Meetings, calendar, docs, and emails. It's all in one place."
arch=('x86_64')
url="https://www.feishu.cn"
license=('unknown')
depends=('nss' 'libx11' 'libxcb' 'libxext' 'wget' 'xdg-utils')
makedepends=()
optdepends=()
source=('https://sf3-cn.feishucdn.com/obj/suite-public-file-cn/b4f6bd/bytedance-feishu-beta_4.8.0-24_amd64.deb')
sha256sums=('0a7acca5f0af6cc23e770aaeb917ac1e9c8f534d14426953b2ae5bf0d61c27ec')

package() {
  cd ${pkgdir}
  tar xvf ${srcdir}/data.tar.xz
}
