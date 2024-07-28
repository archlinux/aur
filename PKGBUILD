# Maintainer: system64 <system64fumo@protonmail.com>

pkgname=jre8-arm
pkgver=8.211.u12
pkgrel=1
pkgdesc="Java 8 runtime for the ARM architecture"
arch=('aarch64' 'armv7')
url="https://openjdk.java.net/"
license=('LicenseRef-Java')
provides=('java-runtime=8' 'java-runtime-openjdk=8')
source_aarch64=("https://github.com/jrullan/java8_arm/raw/master/jdk-8u211-linux-arm64-vfp-hflt.tar.gz")
source_armv7=("https://github.com/jrullan/java8_arm/raw/master/jdk-8u211-linux-armv7-vfp-hflt.tar.gz")
sha256sums_aarch64=('SKIP')
sha256sums_armv7=('SKIP')

package() {
	install -d "$pkgdir/usr/lib/jvm/"
	cp -r "jdk1.8.0_211/jre" "$pkgdir/usr/lib/jvm/java-8-jre"
}
