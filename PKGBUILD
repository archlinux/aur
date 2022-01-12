# Maintainer: Timo Sarawinski <timo at it-kraut dot net>
# Logpresso

pkgname=logpresso-log4j-scan
pkgver=2.7.2
pkgrel=2
pkgdesc="log4j2-scan is a single binary command-line tool for CVE-2021-44228 CVE-2021-45046 (log4j 2.15.0), CVE-2021-45105 (log4j 2.16.0), CVE-2021-44832 (log4j 2.17.0), CVE-2021-4104 (log4j 1.x), and CVE-2021-42550 (logback 0.9-1.2.7) vulnerabilities"
arch=('any')
url="https://github.com/mergebase/log4j-detector"
license=('GPL3')
optdepends=('java-runtime=11')


source=("https://github.com/logpresso/CVE-2021-44228-Scanner/releases/download/v${pkgver}/logpresso-log4j2-scan-${pkgver}-linux.tar.gz"
        "https://github.com/logpresso/CVE-2021-44228-Scanner/releases/download/v${pkgver}/logpresso-log4j2-scan-${pkgver}.jar")
sha256sums=('bd6b7597a840f66a07df04f33bb5b1d25cb8b12a9e7b2cc08ebe5f6281d6ed8b'
            'e6da143d39f2dbf751e7a81fc6af5216a2819b5810f6cde0764085cefa849ee9')


package() {
    install -Dm644 $srcdir/logpresso-log4j2-scan-${pkgver}.jar $pkgdir/usr/share/java/logpresso-log4j-scan/logpresso-log4j2-scan-${pkgver}.jar
    install -Dm655 $srcdir/log4j2-scan $pkgdir/usr/bin/logpresso-log4j2-scan-${pkgver}
}

