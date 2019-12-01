# Maintainer: Arthur Williams <taaparthur@gmail.com>


pkgname='crunchyroll-guest-pass-finder'
pkgver='2.1'
pkgrel=0
pkgdesc='Automatically get Crunchyroll guest passes for free'
url="https://github.com/TAAPArthur/CrunchyrollGuestPassFinder"
arch=('any')
license=('MIT')
depends=('python3' 'python-selenium' )
optdepends=('firefox: to use Firefox driver (default)' 'geckodriver: to use Firefox driver (default)')
source=("https://github.com/TAAPArthur/CrunchyrollGuestPassFinder/archive/v2.1.tar.gz")
md5sums=('a8017de9bf7c8c6f8e620720f5fd5824')

package() {
  cd "CrunchyrollGuestPassFinder-$pkgver"
  install -D -m 0755 "crunchyroll-guest-pass-finder.py" "$pkgdir/usr/bin/crunchyroll-guest-pass-finder"
  install -m 0744 -Dt "$pkgdir/usr/share/man/man1/" crunchyroll-guest-pass-finder.1
  install -D -m 0755 "crunchyroll-guest-pass-finder-autocomplete.sh" "$pkgdir/etc/bash_completion.d/crunchyroll-guest-pass-finder-autocomplete"
}
