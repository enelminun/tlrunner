#!/bin/bash

# Uygulama bilgileri
SRC_DIR="$HOME/.tlrunner"  # Jar dosyası için özel src klasörü
TLAUNCHER_JAR="$SRC_DIR/TLauncher.jar"
ICON_PATH="./tlrunner.png"  # Betik yanındaki ikon

# Yardım mesajı
show_help() {
    echo "Kullanım:"
    echo "  tlrunner               - TLauncher uygulamasını açar."
    echo "  tlrunner -run          - TLauncher uygulamasını açar."
    echo "  tlrunner -h            - Yardım mesajını gösterir."
    echo "  tlrunner -p -set       - Yeni bir TLauncher jar dosyası seçer ve kaydeder."
    echo "  tlrunner -p -rem       - Kayıtlı TLauncher jar dosyasını kaldırır."
    exit 0
}

# Jar dosyasını başlatma
run_tlauncher() {
    if [[ -f "$TLAUNCHER_JAR" ]]; then
        echo "TLauncher başlatılıyor..."
        java -jar "$TLAUNCHER_JAR"
    else
        echo "TLauncher jar dosyası bulunamadı! Lütfen -p -set ile bir dosya seçin."
    fi
    exit 0
}

# Yeni jar dosyası seçme
set_new_jar() {
    echo "Yeni TLauncher jar dosyasının tam yolunu girin:"
    read -r NEW_JAR_PATH

    if [[ -f "$NEW_JAR_PATH" ]]; then
        mkdir -p "$SRC_DIR"
        cp "$NEW_JAR_PATH" "$TLAUNCHER_JAR"
        echo "Yeni TLauncher jar dosyası kaydedildi!"
    else
        echo "Geçersiz dosya yolu! Lütfen doğru bir jar dosyası girin."
    fi
    exit 0
}

# Jar dosyasını kaldırma
remove_jar() {
    if [[ -f "$TLAUNCHER_JAR" ]]; then
        rm -f "$TLAUNCHER_JAR"
        echo "TLauncher jar dosyası kaldırıldı."
    else
        echo "Kayıtlı bir TLauncher jar dosyası bulunamadı."
    fi
    exit 0
}

# Kullanıcıdan jar indirme ya da manuel seçim isteği
prompt_user() {
    echo "TLauncher'ın kendi sitesinden indirilmesini ister misiniz? (y/n)"
    read -r RESPONSE
    if [[ "$RESPONSE" == "y" || "$RESPONSE" == "Y" ]]; then
        echo "TLauncher sitesine giderek jar dosyasını indirip -p -set komutunu kullanabilirsiniz."
    else
        set_new_jar
    fi
    exit 0
}

# Komutlar için kontrol
if [[ $# -eq 0 ]]; then
    run_tlauncher
elif [[ "$1" == "-h" ]]; then
    show_help
elif [[ "$1" == "-run" ]]; then
    run_tlauncher
elif [[ "$1" == "-p" && "$2" == "-set" ]]; then
    set_new_jar
elif [[ "$1" == "-p" && "$2" == "-rem" ]]; then
    remove_jar
else
    echo "Geçersiz komut! Yardım için tlrunner -h yazabilirsiniz."
    exit 1
fi
