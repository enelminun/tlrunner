# Maintainer: Your Name <your.email@example.com>
pkgname=tlrunner
pkgver=1.0.0
pkgrel=1
pkgdesc="Python-based TLauncher for Minecraft with system tray support"
arch=('x86_64')
url="https://github.com/your-username/tlrunner"
license=('GPL3')
depends=('python' 'python-pyqt5')  # Gerekli bağımlılıklar
makedepends=('python-setuptools')  # Python bağımlılıklarını yükleyecek
source=("start.sh" "tlrunner.desktop" "tlrunner.install" "requirements.txt")  # LICENSE dosyasını çıkarttık
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')  # Bu kısmı da güncelledik

package() {
    mkdir -p "$pkgdir"/usr/local/bin
    cp "$srcdir"/start.sh "$pkgdir"/usr/local/bin/start.sh
    chmod +x "$pkgdir"/usr/local/bin/start.sh

    # Gerekli Python bağımlılıklarını kurma
    if [ -f "$srcdir/requirements.txt" ]; then
        cd "$pkgdir"/usr/local/bin
        python3 -m venv venv  # Sanal ortam oluşturuluyor
        source venv/bin/activate
        pip install -r "$srcdir"/requirements.txt  # Python bağımlılıkları yükleniyor
    fi

    # tlrunner.desktop dosyasını doğru dizine kopyalama
    install -Dm644 "$srcdir"/tlrunner.desktop "$pkgdir"/usr/share/applications/tlrunner.desktop

    # tlrunner.install dosyasını doğru dizine kopyalama
    install -Dm644 "$srcdir"/tlrunner.install "$pkgdir"/usr/share/udiskie/tlrunner.install
}

post_install() {
    echo "TLRunner kurulumu tamamlandı!"
    echo "Uygulamayı çalıştırmak için: start.sh"
}

pre_remove() {
    echo "TLRunner kaldırılıyor..."
}
