# Mantainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=pgpgram
pkgver=0.4
pkgrel=1
pkgdesc='PGP encrypted backups on Telegram Cloud'
arch=('any')
url='https://github.com/tallero/pgpgram'
license=('AGPL3')
depends=('python' 'python-appdirs' 'python-setproctitle' 
         'python-sqlitedict' 'telegram-tdlib' 'trovotutto')
optdepends=('youtube-dl')
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/tallero/pgpgram.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
