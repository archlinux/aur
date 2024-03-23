# Maintainer: Castor <whoisyoges@castorisdead.xyz>
pkgname=local-arch-wiki
pkgver=2.0
pkgrel=0
pkgdesc="A convenient wrapper for arch-wiki-docs, enabling effortless searching and access to the offline Arch Wiki."
arch=('any')
url="https://github.com/whoisyoges/local-arch-wiki"
license=('GPL2')
depends=('arch-wiki-docs' 'bash' 'sed')
optdepends=('dmenu: tofi, dmenu, rofi or any other menu.'
            'firefox: Firefox or any other web browser.'
            'libnotify: For notification support.')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/$pkgname"
  chmod +x local-arch-wiki
  install -Dm755 local-arch-wiki "${pkgdir}/usr/local/bin/local-arch-wiki"
}
