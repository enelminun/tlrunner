# Maintainer information
pkgname=tlrunner
pkgver=1.0.0
pkgrel=1
pkgdesc="A launcher for TLauncher with system tray icon"
arch=('any')
url="https://github.com/yourusername/tlrunner"
license=('GPL3')
depends=('python' 'python-pystray' 'python-tk' 'java-runtime')
makedepends=('python-setuptools')
source=("https://github.com/yourusername/tlrunner/archive/v$pkgver.tar.gz" 
        "tlrunner.png")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver/tlrunner.py" "$pkgdir/usr/bin/tlrunner.py"
  install -Dm755 "$srcdir/$pkgname-$pkgver/start.sh" "$pkgdir/usr/bin/start.sh"
  install -Dm644 "$srcdir/tlrunner.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/tlrunner.png"
  install -Dm644 "$srcdir/tlrunner.png" "$pkgdir/.local/share/tlrunner/tlrunner.png"
  install -Dm644 "$srcdir/$pkgname-$pkgver/requirements.txt" "$pkgdir/usr/share/tlrunner/requirements.txt"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/tlrunner.desktop"
}