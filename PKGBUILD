# Maintainer: Martynas Mickevičius <self at 2m dot lt>
pkgname=ucm-bin
pkgver=M4i
pkgrel=1
pkgdesc='Unison language code manager'
arch=('x86_64')
url='https://www.unison-lang.org/'
license=('custom')
depends=('gmp' 'zlib')

source=("ucm-$pkgver::https://github.com/unisonweb/unison/releases/download/release%2F$pkgver/ucm-linux.tar.gz"
        "https://raw.githubusercontent.com/unisonweb/unison/release/$pkgver/LICENSE")
sha256sums=('431f2f3bf55acf455d0865f023045022e325a78e21c42ae843b9bb63e9bb6979'
            '83b0f93a80eeb42f9894851822623bdd5c88cc63fa127d09f0a76d9799913d08')

package() {
  install -D -m755 ucm "$pkgdir/usr/bin/ucm"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
