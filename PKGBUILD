pkgname=npm-jail-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Run npm commands inside a bubblewrap sandbox'
arch=('x86_64' 'aarch64')
url='https://github.com/suethttps/npm-jail'
license=('GPL-3.0-only')
depends=('bubblewrap')
provides=('npm-jail')
conflicts=('npm-jail')

source_x86_64=("https://github.com/suethttps/npm-jail/releases/download/v0.1.4/npm-jail_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/suethttps/npm-jail/releases/download/v0.1.4/npm-jail_Linux_aarch64.tar.gz")
sha256sums_x86_64=('521aa8d124b5a0e6145982006b10b954a0e716212e042fc7a90126c5d4c2e608')
sha256sums_aarch64=('45a696425abd2807a76de17004507aec329d81a38e0108b9aba0192d6f293eda')

package() {
  install -Dm755 npm-jail "${pkgdir}/usr/bin/npm-jail"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/npm-jail/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/npm-jail/LICENSE"
}
