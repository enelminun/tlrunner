# Maintainer: Your Name <your.email@example.com>
pkgname=tlrunner
pkgver=1.0.0
pkgrel=1
pkgdesc="A launcher for TLauncher with system tray icon"
arch=('x86_64')
url="https://github.com/your-username/tlrunner"
license=('GPL3')
depends=('python' 'python-pyqt5')  # Gerekli Python bağımlılıklarını burada belirtin
makedepends=('python-setuptools')  # Gerekli yapım bağımlılıkları
source=("src/tlrunner.py" "src/tlrunner.png" "src/tlrunner.desktop" "src/LICENSE")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')  # Dosya kontrolleri için md5 hashleri

install=src/tlrunner.install

# Paket kurulum betiği
package() {
    # Dosyaların doğru bir şekilde hedef dizine kopyalanması
    mkdir -p "$pkgdir"/usr/local/bin
    cp "$srcdir"/src/tlrunner.py "$pkgdir"/usr/local/bin/tlrunner
    
    mkdir -p "$pkgdir"/usr/local/share/icons
    cp "$srcdir"/src/tlrunner.png "$pkgdir"/usr/local/share/icons/tlrunner.png

    mkdir -p "$pkgdir"/usr/share/applications
    cp "$srcdir"/src/tlrunner.desktop "$pkgdir"/usr/share/applications/tlrunner.desktop
    
    mkdir -p "$pkgdir"/usr/local/share/licenses/tlrunner
    cp "$srcdir"/src/LICENSE "$pkgdir"/usr/local/share/licenses/tlrunner/LICENSE
}

# Paket yüklenmeden önce veya sonra yapılacak işlemler
post_install() {
    echo "TLRunner kurulumu tamamlandı!"
}

pre_remove() {
    echo "TLRunner kaldırılıyor..."
}
