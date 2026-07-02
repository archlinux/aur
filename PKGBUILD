# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics
pkgver=0.0.1
pkgrel=1
pkgdesc="Agentics - The voice-driven AI platform by AgenticsAI (placeholder, official release imminent)"
arch=(any)
url="https://agentics.co.za"
license=('custom')

package() {
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  printf '%s\n' \
    "Agentics - https://agentics.co.za" \
    "" \
    "This package name is reserved by AgenticsAI (Pty) Ltd." \
    "The official Agentics release will be published here imminently." \
    > "${pkgdir}/usr/share/doc/${pkgname}/README"
}
