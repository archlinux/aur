# Maintainer Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname='zsh-autosuggestions'
pkgver=0.4.0
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
md5sums=('e7e1a9869039c52064e8043d26a3bec5')

package() {
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/zsh-autosuggestions.zsh" \
                   "${pkgdir}/usr/share/zsh/plugins/${pkgname}/zsh-autosuggestions.zsh"

    # license
    install -Dm644 "${srcdir}/zsh-users-${pkgname}"-*"/LICENSE" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

