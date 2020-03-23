# Maintainer: Carlos Marchal <marchal.carlos at pm dot me>
pkgname='firejail-pacman-hook'
pkgver=1
pkgrel=2
pkgdesc='Updates firejail symbolic links on pacman operations'
arch=('any')
license=('Unlicense')
install='firejail-pacman-hook.install'
source=('firejail.hook')
sha256sums=('42939e3f287d6ae3de20a73dcf29f785a132020111ff302f4fb110388a756baf')

package() {
  depends=('firejail')

  install -m755 -d "${pkgdir}/usr/share/libalpm/hooks"
  install -m644 "${srcdir}/firejail.hook" "${pkgdir}/usr/share/libalpm/hooks/firejail.hook"
}

