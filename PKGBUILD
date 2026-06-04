pkgname=npm-jail-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Run npm commands inside a bubblewrap sandbox'
arch=('x86_64' 'aarch64')
url='https://github.com/suethttps/npm-jail'
license=('GPL-3.0-only')
depends=('bubblewrap')
provides=('npm-jail')
conflicts=('npm-jail')

source_x86_64=("https://github.com/suethttps/npm-jail/releases/download/v0.1.5/npm-jail_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/suethttps/npm-jail/releases/download/v0.1.5/npm-jail_Linux_aarch64.tar.gz")
sha256sums_x86_64=('a9499129fa68eb4644273d161034b94a480a6543ce902f62d52060970f720d90')
sha256sums_aarch64=('6aaa1e378edc2e3e6b646568df58cdac4e8e165f13fc778075c9ef66210b97ad')

package() {
  install -Dm755 npm-jail "${pkgdir}/usr/bin/npm-jail"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/npm-jail/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/npm-jail/LICENSE"
}
