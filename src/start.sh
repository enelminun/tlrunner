#!/bin/bash

# Sanal ortam için ana dizin
VENV_DIR="$HOME/.local/venv"

# Sanal ortam yoksa, oluştur
if [ ! -d "$VENV_DIR" ]; then
    echo "Sanal ortam bulunamadı. Yeni sanal ortam oluşturuluyor..."
    python3 -m venv "$VENV_DIR"  # Sanal ortamı oluştur
    echo "Sanal ortam oluşturuldu: $VENV_DIR"
fi

# Sanal ortamı aktifleştir
echo "Sanal ortam aktif ediliyor..."
source "$VENV_DIR/bin/activate"

# Gereken Python paketlerini yükle
echo "Gerekli paketler yükleniyor..."
pip install --upgrade pip
pip install -r requirements.txt  # requirements.txt dosyasını yükle

# Python betiğini çalıştır
echo "Uygulama başlatılıyor..."
python tlrunner.py
