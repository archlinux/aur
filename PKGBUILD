# Maintainer: Andriy Yanko <andriy dot yanko at gmail dot com>
pkgname=jakpod
pkgver=2.83
pkgrel=1
pkgdesc='JakPod is based on Java and allows you to copy music and video files to your iPod.'
arch=('any')
url='http://www.jakpod.de'
license=('custom')
depends=('java-runtime')
source=("jakpod-$pkgver.zip::http://www.jakpod.de/en/downloads/func-download/69/chk,997275a3ad7eb41141505c97ca262cd1/no_html,1/"
        'jakpod.desktop'
        'jakpod.properties'
        'jakpod.sh'
)
md5sums=('b2d83d0b576ef55a5db594981d88d90b'
         '890e4fc3bcc8d24d452772e1aa910223'
         '68d27e3876efaef150d1d1b252c7d4f7'
         '23af517369a793c8e1eafc4e6d1e425d')

package() {
  cd "${srcdir}"

  install -Dm644 "jakpod.ico" "$pkgdir/opt/$pkgname/jakpod.ico"
  install -Dm644 "jakpod.jar" "$pkgdir/opt/$pkgname/jakpod.jar"
  install -Dm644 "jakpod.png" "$pkgdir/opt/$pkgname/jakpod.png"

  install -Dm644 "thirdparty/sqlite/sqlite-jdbc-3.7.2.jar" "$pkgdir/opt/$pkgname/thirdparty/sqlite/sqlite-jdbc-3.7.2.jar"
  install -Dm644 "thirdparty/jtattoo/jtattoo.jar" "$pkgdir/opt/$pkgname/thirdparty/jtattoo/jtattoo.jar"

  install -Dm644 "jakpod.desktop" "$pkgdir/usr/share/applications/jakpod.desktop"
  install -Dm644 "jakpod.properties" "$pkgdir/opt/$pkgname/jakpod.properties"
  install -Dm755 "jakpod.sh" "$pkgdir/usr/bin/jakpod"
}

# vim:set ts=2 sw=2 et:

