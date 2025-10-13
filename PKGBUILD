# Maintainer: RK <rk at rkevin dot dev>
# inspired by the vencord-hook AUR package
pkgname=moonlight-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to automatically install moonlight after Discord updates"
arch=('any')
license=('0BSD')
depends=('bash' 'moonlight-cli')
source=("moonlight-hook.hook"
    "moonlight-hook.sh")
sha256sums=('SKIP'
    'SKIP')

package() {
    install -Dm644 "$srcdir/moonlight-hook.hook" "$pkgdir/etc/pacman.d/hooks/moonlight-hook.hook"
    install -Dm755 "$srcdir/moonlight-hook.sh" "$pkgdir/etc/pacman.d/hookbin/moonlight-hook.sh"
}
