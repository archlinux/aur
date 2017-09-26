# Maintainer: Siôn le Roux <sinisterstuf@gmail.com>
pkgname=scmpuff
pkgver=0.2.1
pkgrel=1
pkgdesc="Add numbered shortcuts to common git commands"
arch=('i686' 'x86_64')
url="https://mroth.github.io/scmpuff/"
license=('MIT')
depends=('git')
optdepends=('bash: shell integration'
            'zsh: shell integration')
source=("https://github.com/mroth/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_386.tar.gz")
md5sums=('deb4c7afea0d2868f3a825332fe67909')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}_${pkgver}_linux_386/${pkgname}"
}

# vim: set sw=2 ts=2 et
