# Maintainer:   Maximilian Weiss   <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Martin Fiedler     <$(echo "a2V5akBlbXBoeS5kZQ==" | base64 -d)>
# Contributor:  Vladimir Ivanov    <$(echo "dmxhZGltaXJpdmFub3Y4MTVAZ21haWwuY29t" | base64 -d)>

pkgname=vcsteg
pkgver=2.0
pkgrel=1
pkgdesc='Real Steganography with TrueCrypt'
arch=('any')
url='http://keyj.emphy.de/real-steganography-with-truecrypt/'
# See python file for license
license=('custom:FOSS')

depends=('python2')

provides=('vcsteg')
conflicts=('tcsteg' 'tcsteg2' 'tcsteg.py' 'tcsteg2.py' 'vcsteg' 'vcsteg2' 'vcsteg.py' 'vcsteg2.py')

source=('vcsteg.py')
sha256sums=('19130a705f2337dccd5f9633576d3f616b56fa47b909a2ac6005796eec82f7a7')

package() {
    cd "$srcdir/"
    install -Dm755 "vcsteg.py" "$pkgdir/usr/bin/vcsteg"
}

