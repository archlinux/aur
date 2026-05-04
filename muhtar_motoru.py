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
        print("Muhtar Dili V1.6 - Açık Kaynak Çekirdek (Anonim)")
        return

    try:
        with open(dosya_yolu, 'r', encoding='utf-8') as f:
            turkce_kod = f.read()

        sozluk = {
            r'\bdizla\b': 'import',
            r'\byaz\b': 'print',
            r'\bsor\b': 'input',
            r'\beger\b': 'if',
            r'\begerdegil\b': 'elif',
            r'\bdegilse\b': 'else',
            r'\bgorev\b': 'def',
            r'\bdondur\b': 'return',
            r'\bdongu\b': 'while',
            r'\bicin\b': 'for',
            r'\bicinde\b': 'in',
            r'\baralik\b': 'range',
            r'\bdogru\b': 'True',
            r'\byanlis\b': 'False',
            r'\bve\b': 'and',
            r'\bveya\b': 'or',
            r'\btam_sayi\b': 'int',
            r'\byazi\b': 'str',
            r'\buyu\b': 'time.sleep',
            r'\bdene\b': 'try',
            r'\bdenebozuldu\b': 'except',
            r'\bondalik\b': 'float',
            r'\btamsayi\b': 'int',
            r'\bmetin\b': 'str',
            r'\bkirmizi\b': '"\\033[91m"',
            r'\byesil\b': '"\\033[92m"',
            r'\bsari\b': '"\\033[93m"',
            r'\bmavi\b': '"\\033[94m"',
            r'\brenk_bitir\b': '"\\033[0m"',
            r'\.buyult\(\)': '.upper()',
            r'\.kucult\(\)': '.lower()',
        }

        cevrilmis_kod = turkce_kod
        for turkce, pythonca in sozluk.items():
            cevrilmis_kod = re.sub(turkce, pythonca, cevrilmis_kod)

        import time, math, random
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
        print(f"Muhtar Çöktü! Detay: {hata}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Kullanım: muhtar1 dosya.muh")
    else:
        muhtar_sistemini_calistir(sys.argv[1])
