# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=appium
pkgver=3.1.2
pkgrel=1
pkgdesc="Cross-platform automation framework for all kinds of apps"
arch=('x86_64')
url="https://appium.io"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
optdepends=(
  'nodejs-appium-chromium-driver: Appium 2.x driver for Chromium-based browsers that work with Chromedriver'
  'nodejs-appium-espresso-driver: Espresso integration for Appium'
  'nodejs-appium-geckodriver: Appium driver for Gecko-based browsers and web views'
  'nodejs-appium-mac2-driver: XCTest-based Appium driver for macOS apps automation'
  'nodejs-appium-safari-driver: Appium driver for Safari browser'
  'nodejs-appium-uiautomator2-driver: UiAutomator2 integration for Appium'
  'nodejs-appium-windows-driver: Appium bridge to WinAppDriver'
  'nodejs-appium-xcuitest-driver: Appium driver for iOS using XCUITest for backend'
)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('0e2a7525aa9c147bf511f0a21bd16bd4bda016a3b155cd86aac1ef419ea99f19')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
