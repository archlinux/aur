#!/usr/bin/env python
import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox
import os
import requests
import tempfile
import subprocess
import sys
import shutil
import zipfile
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

class EncryptionApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Şifreleme Uygulaması")
        self.root.geometry("250x280")

        # Arka plan rengi ayarı
        self.root.configure(bg='#f0f0f0')

        self.label = tk.Label(root, text="Parola:", font=("Helvetica", 10), bg='#f0f0f0')
        self.label.pack(pady=5)

        self.password_entry = tk.Entry(root, show="", font=("Helvetica", 10))
        self.password_entry.pack(pady=5)

        self.encrypt_button = tk.Button(root, text="Dosya Şifrele", command=self.encrypt, width=15, height=1, font=("Helvetica", 8), relief=tk.GROOVE)
        self.encrypt_button.pack(pady=5)

        self.decrypt_button = tk.Button(root, text="Dosya Çöz", command=self.decrypt, width=15, height=1, font=("Helvetica", 8), relief=tk.GROOVE)
        self.decrypt_button.pack(pady=5)

        self.encrypt_folder_button = tk.Button(root, text="Klasör Şifrele", command=self.encrypt_folder, width=15, height=1, font=("Helvetica", 8), relief=tk.GROOVE)
        self.encrypt_folder_button.pack(pady=5)

        self.decrypt_folder_button = tk.Button(root, text="Klasör Çöz", command=self.decrypt_folder, width=15, height=1, font=("Helvetica", 8), relief=tk.GROOVE)
        self.decrypt_folder_button.pack(pady=5)

        self.version_label = tk.Label(root, text="Versiyon: 1.2.8", font=("Helvetica", 8), bg='#f0f0f0')
        self.version_label.pack(pady=5)
        
        self.update_check_button = tk.Button(root, text="Güncelleme Kontrolü", command=self.prog_ver_check, width=20, font=("Helvetica", 8), relief=tk.GROOVE)
        self.update_check_button.pack(pady=5)

    def key_derivation(self, password, salt):
        kdf = PBKDF2HMAC(
            algorithm=hashes.SHA256(),
            iterations=100000,
            salt=salt,
            length=32,
            backend=default_backend()
        )
        return kdf.derive(password.encode())

    def encrypt_file(self, file_path, password):
        salt = os.urandom(16)
        key = self.key_derivation(password, salt)

        with open(file_path, 'rb') as f:
            plaintext = f.read()

        cipher = Cipher(algorithms.AES(key), modes.GCM(salt), backend=default_backend())
        encryptor = cipher.encryptor()
        ciphertext = encryptor.update(plaintext) + encryptor.finalize()

        with open(file_path + '.enc', 'wb') as f:
            f.write(encryptor.tag + salt + ciphertext)

        os.remove(file_path)  # Şifresiz verileri sil
        messagebox.showinfo("Başarılı", "Dosya başarıyla şifrelendi.")

    def decrypt_file(self, encrypted_file_path, password):
        with open(encrypted_file_path, 'rb') as f:
            data = f.read()
            tag = data[:16]
            salt = data[16:32]
            ciphertext = data[32:]

        key = self.key_derivation(password, salt)

        cipher = Cipher(algorithms.AES(key), modes.GCM(salt, tag), backend=default_backend())
        decryptor = cipher.decryptor()
        plaintext = decryptor.update(ciphertext) + decryptor.finalize()

        decrypted_file_path = encrypted_file_path[:-4]  # Remove the '.enc' extension
        with open(decrypted_file_path, 'wb') as f:
            f.write(plaintext)

        os.remove(encrypted_file_path)  # Şifreli verileri sil
        messagebox.showinfo("Başarılı", "Dosya başarıyla çözüldü.")

    def encrypt_folder(self):
        password = self.password_entry.get()
        folder_path = filedialog.askdirectory()

        if password and folder_path:
            for root, dirs, files in os.walk(folder_path):
                for file in files:
                    file_path = os.path.join(root, file)
                    self.encrypt_file(file_path, password)
            messagebox.showinfo("Başarılı", "Klasör başarıyla şifrelendi ve şifresiz veriler silindi.")
        else:
            messagebox.showwarning("Uyarı", "Parola veya klasör seçilmedi.")

    def decrypt_folder(self):
        password = self.password_entry.get()
        folder_path = filedialog.askdirectory()

        if password and folder_path:
            for root, dirs, files in os.walk(folder_path):
                for file in files:
                    file_path = os.path.join(root, file)
                    self.decrypt_file(file_path, password)
            messagebox.showinfo("Başarılı", "Klasör başarıyla çözüldü ve şifreli veriler silindi.")
        else:
            messagebox.showwarning("Uyarı", "Parola veya klasör seçilmedi.")

    def encrypt(self):
        password = self.password_entry.get()
        file_path = filedialog.askopenfilename()

        if password and file_path:
            self.encrypt_file(file_path, password)
            messagebox.showinfo("Başarılı", "Dosya başarıyla şifrelendi ve şifresiz veriler silindi.")
        else:
            messagebox.showwarning("Uyarı", "Parola veya dosya seçilmedi.")

    def decrypt(self):
        password = self.password_entry.get()
        file_path = filedialog.askopenfilename()

        if password and file_path:
            self.decrypt_file(file_path, password)
            messagebox.showinfo("Başarılı", "Dosya başarıyla çözüldü şifreli veriler silindi.")
        else:
            messagebox.showwarning("Uyarı", "Parola veya dosya seçilmedi.")

    def apply_update(self, temp_exe_path, current_exe_path):
        try:
            os.replace(temp_exe_path, current_exe_path)
            return True
        except Exception as e:
            print(f"Hata: {e}")
            return False

    def download_update(self, url, dest_path):
        try:
            response = requests.get(url, stream=True)
            with open(dest_path, 'wb') as file:
                for chunk in response.iter_content(chunk_size=1024):
                    if chunk:
                        file.write(chunk)
        except Exception as e:
            print(f"Hata: {e}")
            
    def extract_zip(self, zip_path, extract_path):
        try:
            with zipfile.ZipFile(zip_path, 'r') as zip_ref:
                zip_ref.extractall(extract_path)
            return extract_path
        except Exception as e:
            print(f"Hata: {e}")
            return None
        
    def get_single_exe_in_directory(self, directory):
        exe_files = [f for f in os.listdir(directory) if f.lower().endswith('.exe') and os.path.isfile(os.path.join(directory, f))]
        
        if len(exe_files) == 1:
            return os.path.join(directory, exe_files[0])
        else:
            return None

    def create_update_script(self, temp_exe_path, current_exe_path):
        # Bat dosyasını oluştur
        bat_content = f'@echo off\n'
        bat_content += f'taskkill /IM "{os.path.basename(current_exe_path)}" /F\n'  # Uygulama kapat
        bat_content += f'ping 127.0.0.1 -n 2 > nul\n'  # Kısa bir bekleme
        bat_content += f'start "" "{temp_exe_path}"\n'
        bat_content += f'exit\n'  # Bat dosyasından çık
        bat_path = os.path.join(tempfile.gettempdir(), "update_script.bat")
        with open(bat_path, 'w') as bat_file:
            bat_file.write(bat_content)
        return bat_path

    def run_update_script(self, bat_path):
        try:
            subprocess.run(bat_path, shell=True)
            return True
        except Exception as e:
            print(f"Hata: {e}")
            return False

    def prog_ver_check(self):
        gitlab_url = "https://gitlab.com/saydut/encrpter/-/raw/main/version.txt"

        local_version = self.version_label.cget("text").split(":")[-1].strip()

        try:
            response = requests.get(gitlab_url)
            remote_version_info = response.text.strip().split('\n')
            remote_version = remote_version_info[0]
            release_notes_start = response.text.find('*')
            release_notes = response.text[release_notes_start:].split('link=')[0].strip()
            update_link_start = response.text.find('link=')
            update_link = response.text[update_link_start + 5:].strip()

            if remote_version > local_version:
                # Yeni sürüm mevcut! Güncelleme yapılabilir.
                notes_response = requests.get(gitlab_url)
                release_notes = self.extract_release_notes(notes_response.text)

                result = messagebox.askquestion("Yeni Sürüm", f"Yeni bir sürüm mevcut!\nGüncelleme yapmak ister misiniz?\n\n{release_notes}")

                if result == 'yes':
                    # Kullanıcı evet dediği durum
                    print("Güncelleme işlemleri burada başlayacak.")
                    temp_zip_path = os.path.join(tempfile.gettempdir(), "temp_update.zip")
                    temp_exe_path = os.path.join(tempfile.gettempdir(), "temp_update.exe")

                    # Zip dosyasını indir ve çıkar
                    self.download_update(update_link, temp_zip_path)
                    extracted_path = self.extract_zip(temp_zip_path, tempfile.gettempdir())  # Zip dosyasını çıkar
                    exe_path = self.get_single_exe_in_directory(extracted_path)  # Çıkarılan dizindeki tek exe dosyasını al

                    # Bat dosyasını oluştur ve çalıştır
                    bat_path = self.create_update_script(exe_path, sys.executable)
                    self.run_update_script(bat_path)
                    
                    # Güncelleme script'i çalıştıktan sonra programı kapat
                    sys.exit()
            else:
                # Program güncel.
                messagebox.showinfo("Program Sürüm Kontrolü", "Program zaten güncel")
        except requests.RequestException as e:
            print(f"Hata: {e}")

    def extract_release_notes(self, version_txt_content):
        # version.txt içinden yenilik notlarını çıkar
        start_index = version_txt_content.find('*')
        if start_index != -1:
            end_index = version_txt_content.find('\n', start_index)
            if end_index != -1:
                release_notes = version_txt_content[start_index:end_index].strip('* \t\n')
                return release_notes
        return "Yenilik notları bulunamadı."

if __name__ == "__main__":
    root = tk.Tk()
    app = EncryptionApp(root)
    root.mainloop()
