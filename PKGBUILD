pkgname=npm-jail-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Run npm commands inside a bubblewrap sandbox'
arch=('x86_64' 'aarch64')
url='https://github.com/suethttps/npm-jail'
license=('GPL-3.0-only')
depends=('bubblewrap')
provides=('npm-jail')
conflicts=('npm-jail')

source_x86_64=("https://github.com/suethttps/npm-jail/releases/download/v0.1.2/npm-jail_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/suethttps/npm-jail/releases/download/v0.1.2/npm-jail_Linux_aarch64.tar.gz")
sha256sums_x86_64=('ccac633d2a32fc56e73b5137964d203c42bac6a5fcac1f67e1c3708209bfb9a5')
sha256sums_aarch64=('d011f827ed1ed9686e6c0648c6ece9830c36e7de343e28675fc202e1d4a26ebe')

package() {
  install -Dm755 npm-jail "${pkgdir}/usr/bin/npm-jail"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/npm-jail/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/npm-jail/LICENSE"
}
