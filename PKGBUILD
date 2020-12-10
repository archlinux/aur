# Maintainer: MailRu-im

pkgname=agent-bin
pkgver=10.0.1416
pkgrel=1
pkgdesc='Official agent desktop client for Arch Linux'
arch=('x86_64')
url=https://agent.mail.ru/
license=("Apache")
depends=(
        libxcursor
        libxinerama
        libxrandr
)
conflicts=('icqdesktop-bin' 'icqdesktop-git' 'icqdesktop')
provides=('agent')


source=(
        'https://hb.bizmrg.com/agent-www/linux/x64/packages/10.0.1416/agent-10.0.1416_64bit.tar.xz'
        'agent.png::https://hb.bizmrg.com/agent-www/linux/x64/packages/10.0.1416/agent.png'
        'agent.desktop'
)

sha256sums=(
        '2a3465aac4f2be4a76b65d4472da4fee6d7094c5a5c13edcdd06c855c637b0c3'
        'ac2ba04d386a58c551916e35011b586d5eb1e94c0c8e0d297879f1f207a82975'
        '3b8f95e95af2e413948ca816a262ab47bb27b1ab9cf98dcf131e7e7ee6dcc336'
)


package () {
    install -Dm755 agent "$pkgdir/usr/bin/agent"
    install -Dm644 agent.png "$pkgdir/usr/share/pixmaps/agent.png"
    install -Dm644 agent.desktop "$pkgdir/usr/share/applications/agent.desktop"
}
