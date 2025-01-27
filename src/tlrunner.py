import os
import sys
import json
from tkinter import Tk, filedialog
import pystray
from pystray import MenuItem as item
from PIL import Image, ImageDraw
import subprocess

CONFIG_FILE = os.path.expanduser("~/.tlrunner_config.json")
ICON_PATH = os.path.expanduser("~/.local/share/tlrunner/tlrunner.png")  # Simge dosyasının yolu

def create_config():
    # Varsayılan config dosyasını oluşturacak
    if not os.path.exists(CONFIG_FILE):
        with open(CONFIG_FILE, 'w') as config_file:
            json.dump({"jar_path": None}, config_file)

def load_config():
    # Config dosyasından veriyi okur
    if os.path.exists(CONFIG_FILE):
        with open(CONFIG_FILE, 'r') as config_file:
            return json.load(config_file)
    return {"jar_path": None}

def save_config(config):
    # Config dosyasına kaydeder
    with open(CONFIG_FILE, 'w') as config_file:
        json.dump(config, config_file)

def ask_for_jar_location():
    # Kullanıcıdan jar dosyasının yolunu alır
    root = Tk()
    root.withdraw()  # Pencereyi gizle
    jar_path = filedialog.askopenfilename(title="TLauncher JAR dosyasını seçin", filetypes=[("JAR Files", "*.jar")])
    return jar_path

def on_quit(icon, item):
    # Çıkış fonksiyonu
    icon.stop()

def run_tlauncher(jar_path):
    # TLauncher'ı çalıştırır
    try:
        subprocess.run(['java', '-jar', jar_path], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Bir hata oluştu: {e}")

def create_icon():
    # Uygulama simgesini oluşturur
    image = Image.open(ICON_PATH)  # Iconu belirtilen dosyadan yükle
    
    icon = pystray.Icon("TLRunner", image, "TLRunner")
    icon.menu = (item('Quit', on_quit),)
    icon.run()

def main():
    create_config()  # Config dosyasını oluştur (eğer yoksa)
    
    config = load_config()  # Config dosyasını yükle
    jar_path = config.get("jar_path")

    if not jar_path:
        print("TLauncher JAR dosyasının yolunu belirtmelisiniz.")
        # Kullanıcıdan jar dosyasının yolunu al
        jar_path = ask_for_jar_location()

        if jar_path:
            # Config dosyasına kaydediyoruz
            config["jar_path"] = jar_path
            save_config(config)
            print(f"TLauncher JAR dosyasının yolu {jar_path} olarak kaydedildi.")
        else:
            print("JAR dosyası seçilmedi. Çıkılıyor...")
            sys.exit(1)

    # TLauncher'ı çalıştır
    print(f"TLauncher başlatılıyor: {jar_path}")
    run_tlauncher(jar_path)

    # Sistem tepsisi simgesini oluştur ve çalıştır
    create_icon()

if __name__ == "__main__":
    main()
