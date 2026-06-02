pkgname=npm-jail-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Run npm commands inside a bubblewrap sandbox'
arch=('x86_64' 'aarch64')
url='https://github.com/suethttps/npm-jail'
license=('GPL-3.0-only')
depends=('bubblewrap')
provides=('npm-jail')
conflicts=('npm-jail')

source_x86_64=("https://github.com/suethttps/npm-jail/releases/download/v0.1.3/npm-jail_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/suethttps/npm-jail/releases/download/v0.1.3/npm-jail_Linux_aarch64.tar.gz")
sha256sums_x86_64=('681080ee769681a2d86a68e3740192288f77e40b1553dedf75e9c429326bdaab')
sha256sums_aarch64=('ea4a31ffb173c2b73a197a7ddd351e4fbb865346739e57e72ee3ff4ab10454ec')

package() {
  install -Dm755 npm-jail "${pkgdir}/usr/bin/npm-jail"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/npm-jail/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/npm-jail/LICENSE"
}
