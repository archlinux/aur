# Maintainer: u0_a266 <cagf2emv@anonaddy.me>
pkgname=search-orphans-pkgs-pacman-hook
pkgver=0.0.1
pkgrel=2
pkgdesc="Check orphans packages in pacman"
arch=("any")
url=
license=('custom')
depends=("pacman" "ncurses")
source=("search-orphans-packages.hook"
        "search-orphans-packages.sh")

sha256sums=('cbfdfba9886099e8f10aa6048625eada5f25329a6ae9eee2081c2be33f130251'
            '4f71c100dd841c704a0ef954f3ccd0501cb568121485e7d87de1758b0bcb8e94')

package() {
	cd "$srcdir"
	install -Dm644 "search-orphans-packages.hook" "$pkgdir/usr/share/libalpm/hooks/search-orphans-packages.hook"
    install -Dm755 "search-orphans-packages.sh" "$pkgdir/usr/share/libalpm/scripts/search-orphans-packages.sh"
}

