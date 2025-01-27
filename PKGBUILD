# Maintainer: Kayra 
pkgname=tlrunner
pkgver=1.0.0
pkgrel=1
pkgdesc="TLauncher için dinamik bir bash launcher"
arch=('any')
url="https://github.com/kayra/tlrunner" # Eğer bir GitHub projen yoksa burayı boş bırakabilirsin.
license=('MIT')
depends=('bash' 'java-runtime')
source=("tlrunner.sh" "tlrunner.png")
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/tlrunner.sh" "$pkgdir/usr/bin/tlrunner"
    install -Dm644 "$srcdir/tlrunner.png" "$pkgdir/usr/share/pixmaps/tlrunner.png"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/tlrunner.desktop" <<EOF
[Desktop Entry]
Name=TLRunner
Comment=TLauncher için bash launcher
Exec=tlrunner
Icon=/usr/share/pixmaps/tlrunner.png
Terminal=true
Type=Application
Categories=Game;
EOF
}
