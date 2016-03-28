# Maintainer Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname='zsh-autosuggestions'
pkgver=0.3.1
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
md5sums=('a6dbc0249c0f692cf6e11b9231e33d99')

package() {
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/zsh-autosuggestions.zsh" \
                   "${pkgdir}/usr/share/zsh/plugins/${pkgname}/zsh-autosuggestions.zsh"

    # license
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

