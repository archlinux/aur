#!/usr/bin/env python3
import sys
import re
import os

def yardim_menusu():
    print("\033[94m" + "--- MUHTAR DİLİ YARDIM MASASI ---" + "\033[0m")
    print("Kullanım: muhtar1 [dosya.muh] veya [komut]")
    print("\n\033[93mKomutlar:\033[0m")
    print("  --yardim    : Bu ekranı açar.")
    print("  --versiyon  : Muhtar'ın kaçıncı sürümde olduğunu söyler.")
    print("\n\033[92mBazı Mahalle Kuralları:\033[0m")
    print("  yaz() -> Ekrana laf fırlatır.")
    print("  sor() -> Bilgi ister.")
    print("  dene / denebozuldu -> Hata yakalar.")

def muhtar_sistemini_calistir(dosya_yolu):
    # Komut Kontrolleri
    if dosya_yolu == "--yardim":
        yardim_menusu()
        return
    if dosya_yolu == "--versiyon":
        print("Muhtar Dili V1.8.3 - Açık Kaynak Çekirdek (Anonim)")
        return

    try:
        with open(dosya_yolu, 'r', encoding='utf-8') as f:
            turkce_kod = f.read()

        # Sözlük: Artık Regex değil, düz kelime eşleşmesi kullanacağız
        temiz_sozluk = {
            'dizla': 'import', 'yaz': 'print', 'sor': 'input',
            'eger': 'if', 'egerdegil': 'elif', 'degilse': 'else',
            'gorev': 'def', 'dondur': 'return', 'dongu': 'while',
            'icin': 'for', 'icinde': 'in', 'aralik': 'range',
            'dogru': 'True', 'yanlis': 'False', 've': 'and',
            'veya': 'or', 'tam_sayi': 'int', 'tamsayi': 'int',
            'yazi': 'str', 'metin': 'str', 'uyu': 'time.sleep',
            'dene': 'try', 'denebozuldu': 'except', 'ondalik': 'float',
            'liste': 'list', 'ekle': 'append', 'cikar': 'remove',
            'sirala': 'sort', 'ters_cevir': 'reverse', 'uzunluk': 'len',
            'kir': 'break',
            'kirmizi': "'\\033[91m'",
            'yesil': "'\\033[92m'",
            'sari': "'\\033[93m'",
            'mavi': "'\\033[94m'",
            'renk_bitir': "'\\033[0m'"
        }
        # KÖKTEN ÇÖZÜM: Yeni Tokenizer Mantığı
        # Bu satır; tırnak içindekileri, kelimeleri, boşlukları ve sembolleri birbirinden ayırır.
        cevrilmis_kod = ""
        # Satır satır işleyerek boşlukları (indentation) koruyoruz
        for satir in turkce_kod.splitlines():
            # Regex: Tırnaklı metinler OR Kelimeler OR Boşluklar OR Geri kalan her şey
            parcalar = re.findall(r'(\"[^\"]*\"|\'[^\']*\'|\b\w+\b|\s+|[^\w\s])', satir)
            yeni_satir = ""
            for parca in parcalar:
                # Eğer parça sözlüğümüzde tam olarak varsa çevir, yoksa olduğu gibi bırak
                if parca in temiz_sozluk:
                    yeni_satir += temiz_sozluk[parca]
                # Noktalı metotlar için özel kontrol (.buyult() gibi)
                elif parca == "buyult": yeni_satir += "upper"
                elif parca == "kucult": yeni_satir += "lower"
                else:
                    yeni_satir += parca
            cevrilmis_kod += yeni_satir + "\n"

        import time, math, random, os
        muhtar_globals = {
            "time": time,
            "math": math,
            "random": random,
            "os": os,
            "__builtins__": __builtins__
        }
        exec(cevrilmis_kod, muhtar_globals)

    except FileNotFoundError:
        print(f"Muhtar diyor ki: '{dosya_yolu}' mahallede yok kanka!")
    except Exception as hata:
        import traceback
        _, _, tb = sys.exc_info()
        satir = traceback.extract_tb(tb)[-1].lineno
        print(f"Muhtar Çöktü! Satır {satir} Detay: {hata}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Kullanım: muhtar1 dosya.muh")
    else:
        muhtar_sistemini_calistir(sys.argv[1])
