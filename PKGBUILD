# Maintainer: fsyy <fossy2001 web de>
pkgname=remotelight-bin
_pkgname=remotelight
pkgver=0.2.5.2
pkgrel=2
pkgdesc="Multifunctional LED Control Software"
url="https://github.com/Drumber/RemoteLight"
license=('GPL3')
arch=('any')
depends=('jre8-openjdk')
provides=('remotelight')
conflicts=('remotelight')
source=("https://github.com/Drumber/RemoteLight/releases/download/v${pkgver}/RemoteLight-${pkgver}.jar"
        'RemoteLight.desktop'
        'remotelight'
        'remotelight.png'
        'https://raw.githubusercontent.com/Drumber/RemoteLight/master/LICENSE')
b2sums=('3c1382b67e00ba55bbc2469076840d022689602d93a1ba90cde9199350b07430627abeb9f39a12ad2c9ee3d93ceb3bc2f5dba8cd54ee433c6e5a041f55f0cf0c'
        '993c6353dab94b7c5709f9c02a65c7728a7df360129af4fb0dcd53a9c177596d8e6db3c4167cd0a5f8eb1d199601c0236993dd8ff0c8002a8864ad45cf7a9b90'
        'd0093893abb890c2d93abed2fe237d4c0f94faa8bf5dfa5b464ee2fb679d91ac925a527b9b99dfd77b7851cd733fa6ca8ebc4157cc3831ee1e3fc8308fe1f938'
        'f7b632a2e94006956ee8e9be0315fb63d7ca23c0fa92f1b6fae31ba5c2ed0f9cae966403156a58956d18936de43e3cde94661653b08cba2fe3132f5b7de7a446'
        'SKIP')

package() {
    install -Dm755 "$srcdir/RemoteLight-${pkgver}.jar" "$pkgdir/usr/share/java/RemoteLight/RemoteLight.jar"
    install -Dm755 "$srcdir/remotelight" "$pkgdir/usr/bin/remotelight"
    install -Dm644 "$srcdir/remotelight.png" "$pkgdir/usr/share/pixmaps/remotelight.png"
    install -Dm644 "$srcdir/RemoteLight.desktop" "$pkgdir/usr/share/applications/RemoteLight.desktop"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
