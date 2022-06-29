 # Maintainer: wszqkzqk <wszqkzqk@qq.com>
 
 pkgname=easy-zsh-config
 pkgver=0.1.0
 pkgrel=1
 pkgdesc="My fast and out of the box configuration of zsh powered by oh-my-posh and zsh pulgins"
 arch=(any)
 url=https://github.com/wszqkzqk/easy-zsh-config
 license=("MIT")
 conflicts=("grml-zsh-config"
            "manjaro-zsh-config")
 depends=(  "zsh"
            "nerd-fonts-noto"
            "oh-my-posh"
            "zsh-syntax-highlighting"
            "zsh-autosuggestions"
            "zsh-history-substring-search"
            )
backup=("root/.zshrc"
        "etc/skel/.zshrc")
source=(zshrc)
sha256sums=('a3217dce497408b8bfa86a3a9e9cd359e547ad360d3d5533396605867dc5a395')

package(){
    install -Dm644 zshrc "${pkgdir}/etc/skel/.zshrc"
    install -Dm644 zshrc "${pkgdir}/etc/zsh/zshrc"
    install -Dm640 zshrc "${pkgdir}/root/.zshrc"
    chmod 750 "${pkgdir}/root"
}
