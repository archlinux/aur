pkgname=beanstalkd-cli-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="Simple to use commandline tool for Beanstalkd"
arch=('i686' 'x86_64')
url="https://github.com/schickling/beanstalkd-cli/"
license=('MIT')
source=("https://github.com/schickling/beanstalkd-cli/releases/download/${pkgver}/beanstalkd-cli-linux.tar.gz")
md5sums=('1eb9be95e2124651464d6cfe8065faf5')

package() {
  cd "$srcdir/"
  install -D -m755 "beanstalkd-cli" "${pkgdir}/usr/bin/beanstalkd-cli"
}

# vim:set ts=2 sw=2 et:
