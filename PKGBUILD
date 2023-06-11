# Maintainer: WithTheBraid <the-one@with-the-braid.cf>

pkgname=android-sdk-deb
pkgver=28.0.2+9
pkgrel=1
pkgdesc="Software development kit for Android platform - built out of Debian's repository"
arch=("x86_64" "aarch64")
url="https://salsa.debian.org/android-tools-team/android-sdk-meta"
license=("Apache" "BSD" "SSLeay" "ISC" "GPL3" "MIT" "OpenSSL" "Khronos" "Expat" "PD" "LGPL")
depends=("android-tools" "android-udev" "java-environment" "proguard")
optdepends=("gradle" "maven")
provides=("android-sdk" "android-sdk-build-tools" "android-sdk-debian" "anroid-build-tools" "aapt" "apksign" "zipalign" "aidl" "split-select" "devlink")
conflicts=("adroid-sdk" "android-sdk-build-tools")
makedepends=("binutils" "tar")
backup=("opt/${pkgname}/packages/${pkgname}_test/pubspec.yaml" "opt/${pkgname}/packages/${pkgname}/pubspec.yaml")
source_x86_64=(
  "http://ftp.us.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk_28.0.2+9_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk-build-tools_29.0.3+9_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-frameworks-base/aapt_10.0.0+r36-10_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-frameworks-base/android-libaapt_10.0.0+r36-10_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-frameworks-base/android-libandroidfw_10.0.0+r36-10_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libbase_29.0.6-28_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-liblog_29.0.6-28_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libutils_29.0.6-28_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libbacktrace_29.0.6-28_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libcutils_29.0.6-28_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libziparchive_29.0.6-28_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-system-tools-aidl/aidl_10.0.0+r36-4+b1_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools-apksig/libapksig-java_31.0.2-1_all.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-frameworks-base/split-select_10.0.0+r36-10_amd64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-build/zipalign_10.0.0+r36-1_amd64.deb"
)
source_aarch64=(
  "http://ftp.us.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk_28.0.2+9_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk-build-tools_29.0.3+9_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-frameworks-base/aapt_10.0.0+r36-10_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-frameworks-base/android-libaapt_10.0.0+r36-10_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-frameworks-base/android-libandroidfw_10.0.0+r36-10_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libbase_29.0.6-28_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-liblog_29.0.6-28_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libutils_29.0.6-28_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libbacktrace_29.0.6-28_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libcutils_29.0.6-28_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools/android-libziparchive_29.0.6-28_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-system-tools-aidl/aidl_10.0.0+r36-4_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools-apksig/apksigner_31.0.2-1_all.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-frameworks-base/split-select_10.0.0+r36-10_arm64.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-build/zipalign_10.0.0+r36-1_arm64.deb"
)
source=(
  "http://ftp.us.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk-build-tools-common_29.0.3+9_all.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-tools-apksig/libapksig-java_31.0.2-1_all.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-platform-dalvik/dalvik-exchange_10.0.0+r36-4_all.deb"
  "http://ftp.us.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk-common_28.0.2+9_all.deb"
)

sha256sums=('fd8bdaf9c303b50b30a7c149aad12949c6736b4f28fdff4488f8003332066d6f'
            'cfb1babb843de0c7490c4554dca31187ceb326ea7f53c9cd77e9ce46342cba59'
            '2c07f5c646fd89841a7a28ff38a2e214395cc3aa1499617f4f27eb59059d5555'
            'bf64032b0de93912be713f0fd6f34a9a86b5557c6ec1f54ec742d34b4c4c1509')
sha256sums_x86_64=('7710165a7f5723d42f49290ade0e0449a101dcd1e62053b9b3c3aa0439b53d12'
                   '35b620d9cac8109864e877d8ffef8be441615ab5bda71e6eef9314dcbd48fb85'
                   'a4790dd07923a45ba17982d257abbce3f8050e8b30b0952545255502a5d1f505'
                   'e18333b3d0259c3ceffeed142a5bbce2114eb7021c0ca5ef1ac505c0629c5171'
                   '26add03f0edf12da9d710b9be2bf0ec867f583d490135d99b9789bbbfe1bab4e'
                   'c651582c9beb229b6a4581eef5d03796293aa2da3b602eafc5427b198060819f'
                   'd495761ec2dc87070f6ac75c771d221d05e2be387cbaeab7e7c7fcd740ce4ce2'
                   'c9554365cd0d20ac22138195963b2b790e45fc3edade3626a05311a9cae5cf36'
                   '78733043d8e8f5906eb969a18c3178c1898f50d3684de23398a3eeb7ba7ea122'
                   '12ac0a99beb683269d77af09bf80ddd7b8c428fda442c05070ea3ff50429718c'
                   'e6d674143b948017a96740f449547799127feba75109875446c89e0e05a3e29d'
                   '9b465434f6b67f1359f44a74f57bc91633a125a60ae16fdab7943ee3bd5c7948'
                   'cfb1babb843de0c7490c4554dca31187ceb326ea7f53c9cd77e9ce46342cba59'
                   '162934f9b26aeca114f83dc210f889a57d97fb84ae0983f8631b3a675f301ce3'
                   '522d9efffbd2602a508530e58c8e2f21b1fb2598c7986350e41906d439e4758c')
sha256sums_aarch64=('c19b0b908820c4f7e7d0bb388619e36701186c03a34bed5249106844517a146b'
                    '5c499a69ae20e4a554ebda511a7e797b45c98f2f1608cdf42306e5ff1f8819b3'
                    'ec2d2e6ae414ac6eae52626e74715af5d7402f4b24f329c94f706934a15034fb'
                    'a784a933ce7219920116a23badae2dfb6373c3c252c699654ff7756f936579c2'
                    '3833d44f55b1c63b985455ada8f08dc15a7a0cca7f22ebf11096515a9dd29a4b'
                    'cae49d095f25ab9fbadf2c062123885e87ac5bf861e2ab415510e5b60575decd'
                    'd21c4868a3118dd24feb5b7f82b7e1eaaf3c85544a1f26cd94fb0f9d9def9108'
                    '22148b383dd323d9d431571eb94247c7aef07c9503f9c0f8e2af4d553892d8bf'
                    '354de7435e9d4c52b2db26648629c8768fa9b88df61b430f87bfc204d7cb446f'
                    'ac1565d9f4b4c1c8a3e50d577e785086856c8928089e0bb857adb9a5c52e4839'
                    'bcec60dac69fa6bd1a1124a78ae1a8aeec5e95ef4ea2cda27960bfe753664cc4'
                    '89be4e6bd466bd8ece2003566165c7ccf2043f01fa61dadcd60535c89e6816cf'
                    '6ded96d6156f8b0bc1355e87b5fad8e6ebfcf8a694dedd9987768b37a41878d4'
                    'cc643dba2db978c1b7ac441aa440a3b89789196e06c0c48e4ee6d946e4b6b9fa'
                    '51a72c132ce2d61839112a7edb1f20cefedff186b427edad6f4cd535cc497ea6')

package() {
  for file in *.deb; do
    echo "Extracting $file"
    ar x "$file"
    tar -xf data.tar.* -C $pkgdir
    rm data.tar.* control.tar.*
  done
  rm "$srcdir/debian-binary"

  install -Dm644 "../android-home.sh" "${pkgdir}/etc/profile.d/android-home.sh"
  install -Dm644 "../android-home.csh" "${pkgdir}/etc/profile.d/android-home.csh"
}

