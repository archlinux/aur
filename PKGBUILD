# Maintainer Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname='zsh-autosuggestions'
pkgver=0.3.2
pkgrel=1
pkgdesc='Fish-like autosuggestions for zsh'
url='https://github.com/zsh-users/zsh-autosuggestions'
arch=('any')
license=('Custom:MIT')
depends=('zsh')
provides=('zsh-autosuggestions-git')
conflicts=('zsh-autosuggestions-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zsh-users/${pkgname}/tarball/v${pkgver}")
install="${pkgname}.install"
md5sums=('465044a2de962f588fbc6d8e64bce79e')

package() {
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/zsh-autosuggestions.zsh" \
                   "${pkgdir}/usr/share/zsh/plugins/${pkgname}/zsh-autosuggestions.zsh"

    # license
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

