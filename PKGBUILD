# Maintainer: Kayra / github:enelminun
pkgname=tlrunner
pkgver=1.0.0
pkgrel=1
pkgdesc="Python-based TLauncher for Minecraft with system tray support"
arch=('x86_64')
url="https://github.com/enelminun/tlrunner"
license=('GPL3')
depends=('python' 'python-pyqt5') 
makedepends=('python-setuptools')  
source=("tlrunner.py" "requirements.txt" "LICENSE")  r
md5sums=('SKIP' 'SKIP' 'SKIP') 


package() {
    mkdir -p "$pkgdir"/usr/local/bin
    cp "$srcdir"/tlrunner.py "$pkgdir"/usr/local/bin/tlrunner.py
    chmod +x "$pkgdir"/usr/local/bin/tlrunner.py

    mkdir -p "$pkgdir"/usr/local/share/licenses/tlrunner
    cp "$srcdir"/LICENSE "$pkgdir"/usr/local/share/licenses/tlrunner/LICENSE

    if [ -f "$srcdir/requirements.txt" ]; then
        cd "$pkgdir"/usr/local/bin
        python3 -m venv venv  
        source venv/bin/activate
        pip install -r "$srcdir"/requirements.txt 
    fi
}

post_install() {
    echo "TLRunner kurulumu tamamlandı!"
    echo "Uygulamayı çalıştırmak için: tlrunner.py"
}

pre_remove() {
    echo "TLRunner kaldırılıyor..."
}
