# Maintainer: Muflone <muflone@vbsimple.net>
pkgname=tn5250j-plugin-mail
pkgver=1.5.0
pkgrel=1
pkgdesc="Support for send e-mail messages from tn5250j"
arch=(any)
url="https://java.net/projects/javamail/pages/Home"
license=('LGPL')
depends=(tn5250j)
source=(
        "https://maven.java.net/content/repositories/releases/com/sun/mail/javax.mail/${pkgver}/javax.mail-${pkgver}.jar"
        "https://maven.java.net/content/repositories/releases/com/sun/mail/mailapi/${pkgver}/mailapi-${pkgver}.jar"
        "https://maven.java.net/content/repositories/releases/com/sun/mail/smtp/${pkgver}/smtp-${pkgver}.jar"
       )
md5sums=(
         'dabf8c0f32c7f6eb5c87aebd53e07fce'
         'aae1b3a758e279a8ef0e2e3887a6ead4'
         'c5e8a16a5325ab7d098198ad30e84058'
        )
noextract=(
           "javax.mail-${pkgver}.jar"
           "mailapi-${pkgver}.jar"
           "smtp-${pkgver}.jar"
          )

package() {
  # Install files for the package
  install -m 644 -D "$srcdir/javax.mail-${pkgver}.jar" "$pkgdir/usr/share/java/tn5250j/mail.jar"
  install -m 644 -D "$srcdir/mailapi-${pkgver}.jar" "$pkgdir/usr/share/java/tn5250j/mailapi.jar"
  install -m 644 -D "$srcdir/smtp-${pkgver}.jar" "$pkgdir/usr/share/java/tn5250j/smtp.jar"
}


