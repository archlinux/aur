# Maintainer: L. Puntillo <puntillol@hotmail.com>

pkgname=drjava
pkgver=2019
pkgrel=3
pkgdesc="DrJava is a lightweight development environment for writing Java programs. It is designed primarily for students, providing an intuitive interface and the ability to interactively evaluate Java code."
arch=('any')
url="https://www.cs.rice.edu/~javaplt/drjava/"
license=('BSD')
depends=('bash' 'java-environment')
source=('https://downloads.sourceforge.net/project/drjava/1.%20DrJava%20Stable%20Releases/drjava-beta-20190813-220051/drjava-beta-20190813-220051.jar'
        'drjava.sh'
        'drjava.desktop'
        'LICENSE')
sha512sums=('1f5f0c0bc99641554380b41921024ff7f8efc164e6ff23575a68496c734e5a7c1e736b328cdbba7203799cef1d23ff928959bb2ccb2c6f3888c396fbede31a22'
            '0ff77f1af5fb7a760300fb98465dbd36aa1067daf22ac8bd94185c0a990c749ec0991f6cbd53038b9f87a10496df6581e8a34114a3e599499cdabfd4b72add56'
            '5c54fcbe58dca4884af6dafe76cf791180a4591d8f50839f99d93a156b488581d0e260fc2dfba17f7e9fcc28b87bae1cad891c4b822274eb006ffb067b5a1106'
            'a30d75e4df224919d948eb1ce463c133babac43670f174205b61047cd9005edc1c0daeecb76647bb113a9d22b4186aca6854f30504951507b0ec216ab5c9f544')

package() {
	cd ${srcdir}

	install -Dm644 drjava-beta-20190813-220051.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm755 drjava.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 LICENSE ${pkgdir}/usr/share/license/${pkgname}/LICENSE
	install -Dm644 drjava.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
