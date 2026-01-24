pkgname=ctotp-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal CLI wrapper for Ente Auth to copy 2FA codes directly from terminal"
arch=('any')
url="https://github.com/GibreelAbdullah/ctotp" # Replace with your repo
license=('MIT')
depends=('ente-cli' 'oath-toolkit' 'fzf' 'wl-clipboard' 'libnotify')
source=("git+https://github.com/GibreelAbdullah/ctotp.git")
md5sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}/ctotp" "${pkgdir}/usr/bin/ctotp"
}
