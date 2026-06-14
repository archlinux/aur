#!/usr/bin/env python3
import sys
import traceback
import gi
import subprocess
import os
import threading
import json
import shutil
import locale
import os
import sys

os.chdir(os.path.dirname(os.path.abspath(__file__)))

abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)
sys.path.append(dname)

gi.require_version('Gtk', '4.0')
gi.require_version('Adw', '1')
from gi.repository import Gtk, Adw, Gio, Gdk, GLib

# AYARLAR
CONFIG_DIR = os.path.expanduser("~/.config/debtapgui")
CONFIG_FILE = os.path.join(CONFIG_DIR, "config.json")

DEFAULT_CONFIG = {
    "delete_deb": False,
    "auto_close": False,
    "always_close": False,
    "auto_install": False,
    "delete_all": False
}

def load_config():
    if not os.path.exists(CONFIG_FILE):
        return DEFAULT_CONFIG.copy()
    try:
        with open(CONFIG_FILE, "r") as f:
            return json.load(f)
    except:
        return DEFAULT_CONFIG.copy()

def save_config(config):
    os.makedirs(CONFIG_DIR, exist_ok=True)
    with open(CONFIG_FILE, "w") as f:
        json.dump(config, f)

# DİLLER
LANGS = {
    "tr": {
        "title": "Debtap Arayüzü",
        "desc": ".deb dosyasını seçin veya buraya sürükleyin",
        "btn_select": "Dosya Seç",
        "update_db": "Veritabanını Güncelle",
        "loading": "Dönüştürülüyor...\nLütfen bekleyin.",
        "installing": "Paket kuruluyor...\nLütfen şifrenizi girin.",
        "success": "Başarılı! Dönüştürme tamamlandı.",
        "install_success": "Paket başarıyla sisteme kuruldu!",
        "err_deb": "Hata: Sadece .deb dosyaları!",
        "err_cmd": "Hata: Sistemde 'debtap' paketi bulunamadı! Lütfen önce kurun.",
        "install_err": "Kurulum iptal edildi veya bir hata oluştu.",
        "dialog_title": "Bilgi",
        "settings": "Ayarlar",
        "general_group": "Genel Ayarlar",
        "install_group": "Otomatik Kurulum Ayarları",
        "del_deb": "İşlem sonrası orijinal .deb dosyasını sil",
        "auto_close": "Dosyadan açıldıysa işlem sonrası otomatik kapat",
        "always_close": "İşlem sonrası programı her zaman kapat",
        "auto_install": "Dönüştürme yapıldıktan sonra otomatik kur",
        "delete_all": "Kurulum sonrası tüm paketleri sil (eski .deb ve yeni .zst)",
        "set_default": ".deb Dosyaları İçin Varsayılan Yap",
        "remove_default": "Varsayılanlığı Kaldır",
        "set_default_success": "Uygulama varsayılan olarak ayarlandı!",
        "remove_default_success": "Varsayılanlık kaldırıldı!",
        "deleted_msg": "\nOrijinal dosya silindi.",
        "deleted_all_msg": "\nEski ve yeni kurulum dosyaları temizlendi.",
        "copy_success": "Komut kopyalandı!",
        "info_title": "Nasıl Kurulur?",
        "info_footer": "<span size='small'>Geliştiren: Eren Dağlayan\nLisans: GPL-3.0\nSürüm: v2.2.0</span>",
        "info_lbl_pacman": "Ayarlardan otomatik kurulumu açmadıysanız veya açmayacaksanız:",
        "info_lbl_pamac": "Veya grafik arayüzlü 'pamac' aracını kullanabilirsiniz:"
    },
    "en": {
        "title": "Debtap GUI",
        "desc": "Select a .deb file or drag and drop",
        "btn_select": "Select File",
        "update_db": "Update Database",
        "loading": "Converting...\nPlease wait.",
        "installing": "Installing package...\nPlease enter your password.",
        "success": "Success! Conversion completed.",
        "install_success": "Package successfully installed to system!",
        "err_deb": "Error: Only .deb files!",
        "err_cmd": "Error: 'debtap' package not found in system! Please install it first.",
        "install_err": "Installation cancelled or an error occurred.",
        "dialog_title": "Information",
        "settings": "Settings",
        "general_group": "General Settings",
        "install_group": "Auto-Install Settings",
        "del_deb": "Delete original .deb file after conversion",
        "auto_close": "Auto-close after conversion if opened from file",
        "always_close": "Always close program after conversion",
        "auto_install": "Automatically install package after conversion",
        "delete_all": "Delete all packages after installation (.deb and .zst)",
        "set_default": "Set as Default for .deb files",
        "remove_default": "Remove Default",
        "set_default_success": "App set as default successfully!",
        "remove_default_success": "Default app setting removed!",
        "deleted_msg": "\nOriginal file deleted.",
        "deleted_all_msg": "\nOld and new installation files cleaned up.",
        "copy_success": "Command copied to clipboard!",
        "info_title": "How to Install?",
        "info_footer": "<span size='small'>Developer: Eren Dağlayan\nLicense: GPL-3.0\nVersion: v2.2.0</span>",
        "info_lbl_pacman": "If auto-install is disabled or you don't want to turn it on, use this command:",
        "info_lbl_pamac": "Or you can use the 'pamac' GUI tool. To install:"
    },
    "zh": {
        "title": "Debtap 界面",
        "desc": "选择一个 .deb 文件或拖放到这里",
        "btn_select": "选择文件",
        "update_db": "更新数据库",
        "loading": "正在转换...\n请稍候。",
        "installing": "正在安装包...\n请输入您的密码。",
        "success": "成功！转换完成。",
        "install_success": "包已成功安装到系统！",
        "err_deb": "错误：只能是 .deb 文件！",
        "err_cmd": "错误：系统中未找到 'debtap'！请先安装。",
        "install_err": "安装已取消或发生错误。",
        "dialog_title": "信息",
        "settings": "设置",
        "general_group": "常规设置",
        "install_group": "自动安装设置",
        "del_deb": "转换后删除原始 .deb 文件",
        "auto_close": "如果从文件打开，转换后自动关闭",
        "always_close": "转换后始终关闭程序",
        "auto_install": "转换后自动安装包",
        "delete_all": "安装后删除所有包文件（旧的 .deb 和新的 .zst）",
        "set_default": "设为 .deb 文件的默认程序",
        "remove_default": "取消默认",
        "set_default_success": "应用已成功设为默认！",
        "remove_default_success": "默认应用设置已取消！",
        "deleted_msg": "\n原始文件已删除。",
        "deleted_all_msg": "\n旧的和新的安装文件已清理。",
        "copy_success": "命令已复制到剪贴板！",
        "info_title": "如何安装？",
        "info_footer": "<span size='small'>开发者: Eren Dağlayan\n许可证: GPL-3.0\n版本: v2.2.0</span>",
        "info_lbl_pacman": "如果禁用了自动安装，请使用此命令：",
        "info_lbl_pamac": "或者您可以使用 'pamac' 图形界面工具："
    },
    "hi": {
        "title": "Debtap GUI",
        "desc": "एक .deb फ़ाइल चुनें या खींचें और छोड़ें",
        "btn_select": "फ़ाइल चुनें",
        "update_db": "डेटाबेस अपडेट करें",
        "loading": "कनवर्ट हो रहा है...\nकृपया प्रतीक्षा करें।",
        "installing": "पैकेज इंस्टॉल हो रहा है...\nकृपया अपना पासवर्ड दर्ज करें।",
        "success": "सफल! रूपांतरण पूर्ण हुआ।",
        "install_success": "पैकेज सफलतापूर्वक सिस्टम में इंस्टॉल हो गया!",
        "err_deb": "त्रुटि: केवल .deb फ़ाइलें!",
        "err_cmd": "त्रुटि: 'debtap' पैकेज सिस्टम में नहीं मिला! कृपया इसे पहले इंस्टॉल करें।",
        "install_err": "स्थापना रद्द कर दी गई या कोई त्रुटि हुई।",
        "dialog_title": "जानकारी",
        "settings": "सेटिंग्स",
        "general_group": "सामान्य सेटिंग्स",
        "install_group": "ऑटो-इंस्टॉल सेटिंग्स",
        "del_deb": "रूपांतरण के बाद मूल .deb फ़ाइल हटाएं",
        "auto_close": "यदि फ़ाइल से खोला गया है तो बाद में ऑटो-क्लोज़ करें",
        "always_close": "रूपांतरण के बाद हमेशा प्रोग्राम बंद करें",
        "auto_install": "रूपांतरण के बाद स्वचालित रूप से पैकेज इंस्टॉल करें",
        "delete_all": "स्थापना के बाद सभी पैकेज हटाएं (.deb और .zst)",
        "set_default": ".deb फ़ाइलों के लिए डिफ़ॉल्ट के रूप में सेट करें",
        "remove_default": "डिफ़ॉल्ट हटाएं",
        "set_default_success": "ऐप सफलतापूर्वक डिफ़ॉल्ट के रूप में सेट हो गया!",
        "remove_default_success": "डिफ़ॉल्ट ऐप सेटिंग हटा दी गई!",
        "deleted_msg": "\nमूल फ़ाइल हटा दी गई।",
        "deleted_all_msg": "\nपुरानी और नई इंस्टॉलेशन फ़ाइलें साफ कर दी गईं।",
        "copy_success": "कमांड क्लिपबोर्ड पर कॉपी हो गया!",
        "info_title": "कैसे इंस्टॉल करें?",
        "info_footer": "<span size='small'>डेवलपर: Eren Dağlayan\nलाइसेंस: GPL-3.0\nसंस्करण: v2.2.0</span>",
        "info_lbl_pacman": "यदि ऑटो-इंस्टॉल बंद है, तो इस कमांड का उपयोग करें:",
        "info_lbl_pamac": "या आप 'pamac' GUI टूल का उपयोग कर सकते हैं:"
    },
    "es": {
        "title": "Interfaz Debtap",
        "desc": "Seleccione un archivo .deb o arrástrelo y suéltelo",
        "btn_select": "Seleccionar archivo",
        "update_db": "Actualizar base de datos",
        "loading": "Convirtiendo...\nPor favor, espere.",
        "installing": "Instalando paquete...\nPor favor, introduzca su contraseña.",
        "success": "¡Éxito! Conversión completada.",
        "install_success": "¡Paquete instalado exitosamente en el sistema!",
        "err_deb": "Error: ¡Solo archivos .deb!",
        "err_cmd": "Error: ¡El paquete 'debtap' no se encuentra! Por favor, instálelo primero.",
        "install_err": "Instalación cancelada o ocurrió un error.",
        "dialog_title": "Información",
        "settings": "Ajustes",
        "general_group": "Ajustes Generales",
        "install_group": "Ajustes de Auto-Instalación",
        "del_deb": "Eliminar el archivo .deb original después de la conversión",
        "auto_close": "Cerrar automáticamente si se abrió desde un archivo",
        "always_close": "Cerrar siempre el programa después de la conversión",
        "auto_install": "Instalar automáticamente el paquete después de la conversión",
        "delete_all": "Eliminar todos los paquetes después de la instalación (.deb y .zst)",
        "set_default": "Establecer como predeterminado para archivos .deb",
        "remove_default": "Quitar predeterminado",
        "set_default_success": "¡Aplicación establecida como predeterminada exitosamente!",
        "remove_default_success": "¡Se quitó la configuración de aplicación predeterminada!",
        "deleted_msg": "\nArchivo original eliminado.",
        "deleted_all_msg": "\nArchivos de instalación viejos y nuevos limpiados.",
        "copy_success": "¡Comando copiado al portapapeles!",
        "info_title": "¿Cómo instalar?",
        "info_footer": "<span size='small'>Desarrollador: Eren Dağlayan\nLicencia: GPL-3.0\nVersión: v2.2.0</span>",
        "info_lbl_pacman": "Si la instalación automática está desactivada, use este comando:",
        "info_lbl_pamac": "O puede usar la herramienta gráfica 'pamac':"
    },
    "ar": {
        "title": "واجهة Debtap",
        "desc": "حدد ملف .deb أو اسحبه وأفلته هنا",
        "btn_select": "اختر ملف",
        "update_db": "تحديث قاعدة البيانات",
        "loading": "جاري التحويل...\nالرجاء الانتظار.",
        "installing": "جاري تثبيت الحزمة...\nالرجاء إدخال كلمة المرور.",
        "success": "نجاح! اكتمل التحويل.",
        "install_success": "تم تثبيت الحزمة بنجاح على النظام!",
        "err_deb": "خطأ: ملفات .deb فقط!",
        "err_cmd": "خطأ: حزمة 'debtap' غير موجودة! الرجاء تثبيتها أولاً.",
        "install_err": "تم إلغاء التثبيت أو حدث خطأ.",
        "dialog_title": "معلومات",
        "settings": "الإعدادات",
        "general_group": "الإعدادات العامة",
        "install_group": "إعدادات التثبيت التلقائي",
        "del_deb": "حذف ملف .deb الأصلي بعد التحويل",
        "auto_close": "إغلاق تلقائي بعد التحويل إذا فُتح من ملف",
        "always_close": "إغلاق البرنامج دائمًا بعد التحويل",
        "auto_install": "تثبيت الحزمة تلقائيًا بعد التحويل",
        "delete_all": "حذف جميع الحزم بعد التثبيت (.deb و .zst)",
        "set_default": "تعيين كافتراضي لملفات .deb",
        "remove_default": "إزالة الافتراضي",
        "set_default_success": "تم تعيين التطبيق كافتراضي بنجاح!",
        "remove_default_success": "تمت إزالة إعداد التطبيق الافتراضي!",
        "deleted_msg": "\nتم حذف الملف الأصلي.",
        "deleted_all_msg": "\nتم تنظيف ملفات التثبيت القديمة والجديدة.",
        "copy_success": "تم نسخ الأمر إلى الحافظة!",
        "info_title": "كيفية التثبيت؟",
        "info_footer": "<span size='small'>المطور: Eren Dağlayan\nالترخيص: GPL-3.0\nالإصدار: v2.2.0</span>",
        "info_lbl_pacman": "إذا تم تعطيل التثبيت التلقائي، استخدم هذا الأمر:",
        "info_lbl_pamac": "أو يمكنك استخدام أداة 'pamac' الرسومية:"
    },
    "fr": {
        "title": "Interface Debtap",
        "desc": "Sélectionnez un fichier .deb ou glissez-déposez",
        "btn_select": "Sélectionner un fichier",
        "update_db": "Mettre à jour la base de données",
        "loading": "Conversion en cours...\nVeuillez patienter.",
        "installing": "Installation du paquet...\nVeuillez entrer votre mot de passe.",
        "success": "Succès ! Conversion terminée.",
        "install_success": "Paquet installé avec succès sur le système !",
        "err_deb": "Erreur : Uniquement des fichiers .deb !",
        "err_cmd": "Erreur : paquet 'debtap' introuvable ! Veuillez l'installer d'abord.",
        "install_err": "Installation annulée ou une erreur s'est produite.",
        "dialog_title": "Information",
        "settings": "Paramètres",
        "general_group": "Paramètres généraux",
        "install_group": "Paramètres d'installation auto",
        "del_deb": "Supprimer le fichier .deb original après la conversion",
        "auto_close": "Fermeture automatique si ouvert depuis un fichier",
        "always_close": "Toujours fermer le programme après la conversion",
        "auto_install": "Installer automatiquement après la conversion",
        "delete_all": "Supprimer tous les paquets après l'installation (.deb et .zst)",
        "set_default": "Définir par défaut pour les fichiers .deb",
        "remove_default": "Supprimer le choix par défaut",
        "set_default_success": "Application définie par défaut avec succès !",
        "remove_default_success": "Paramètre d'application par défaut supprimé !",
        "deleted_msg": "\nFichier original supprimé.",
        "deleted_all_msg": "\nAnciens et nouveaux fichiers d'installation nettoyés.",
        "copy_success": "Commande copiée dans le presse-papiers !",
        "info_title": "Comment installer ?",
        "info_footer": "<span size='small'>Développeur : Eren Dağlayan\nLicence : GPL-3.0\nVersion : v2.2.0</span>",
        "info_lbl_pacman": "Si l'installation automatique est désactivée, utilisez cette commande :",
        "info_lbl_pamac": "Ou vous pouvez utiliser l'outil graphique 'pamac' :"
    },
    "bn": {
        "title": "Debtap GUI",
        "desc": "একটি .deb ফাইল নির্বাচন করুন অথবা টেনে আনুন",
        "btn_select": "ফাইল নির্বাচন করুন",
        "update_db": "ডেটাবেস আপডেট করুন",
        "loading": "রূপান্তর করা হচ্ছে...\nঅনুগ্রহ করে অপেক্ষা করুন।",
        "installing": "প্যাকেজ ইনস্টল করা হচ্ছে...\nআপনার পাসওয়ার্ড লিখুন।",
        "success": "সফল! রূপান্তর সম্পন্ন হয়েছে।",
        "install_success": "প্যাকেজ সফলভাবে সিস্টেমে ইনস্টল করা হয়েছে!",
        "err_deb": "ত্রুটি: শুধুমাত্র .deb ফাইল!",
        "err_cmd": "ত্রুটি: সিস্টেমে 'debtap' পাওয়া যায়নি! প্রথমে এটি ইনস্টল করুন।",
        "install_err": "ইনস্টলেশন বাতিল হয়েছে বা একটি ত্রুটি ঘটেছে।",
        "dialog_title": "তথ্য",
        "settings": "সেটিংস",
        "general_group": "সাধারণ সেটিংস",
        "install_group": "অটো-ইনস্টল সেটিংস",
        "del_deb": "রূপান্তরের পরে মূল .deb ফাইল মুছুন",
        "auto_close": "ফাইল থেকে খোলা হলে রূপান্তরের পরে স্বয়ংক্রিয়ভাবে বন্ধ করুন",
        "always_close": "রূপান্তরের পরে সর্বদা প্রোগ্রাম বন্ধ করুন",
        "auto_install": "রূপান্তরের পরে স্বয়ংক্রিয়ভাবে প্যাকেজ ইনস্টল করুন",
        "delete_all": "ইনস্টল করার পরে সমস্ত প্যাকেজ মুছুন (.deb এবং .zst)",
        "set_default": ".deb ফাইলের জন্য ডিফল্ট করুন",
        "remove_default": "ডিফল্ট সরান",
        "set_default_success": "অ্যাপ সফলভাবে ডিফল্ট সেট করা হয়েছে!",
        "remove_default_success": "ডিফল্ট অ্যাপ সেটিং সরানো হয়েছে!",
        "deleted_msg": "\nমূল ফাইল মুছে ফেলা হয়েছে।",
        "deleted_all_msg": "\nপুরানো এবং নতুন ইনস্টলেশন ফাইল পরিষ্কার করা হয়েছে।",
        "copy_success": "কমান্ড কপি করা হয়েছে!",
        "info_title": "কিভাবে ইনস্টল করবেন?",
        "info_footer": "<span size='small'>ডেভেলপার: Eren Dağlayan\nলাইসেন্স: GPL-3.0\nসংস্করণ: v2.2.0</span>",
        "info_lbl_pacman": "অটো-ইনস্টল বন্ধ থাকলে, এই কমান্ডটি ব্যবহার করুন:",
        "info_lbl_pamac": "অথবা আপনি 'pamac' গ্রাফিকাল টুল ব্যবহার করতে পারেন:"
    },
    "pt": {
        "title": "Interface Debtap",
        "desc": "Selecione um arquivo .deb ou arraste e solte",
        "btn_select": "Selecionar Arquivo",
        "update_db": "Atualizar Banco de Dados",
        "loading": "Convertendo...\nPor favor, aguarde.",
        "installing": "Instalando pacote...\nPor favor, digite sua senha.",
        "success": "Sucesso! Conversão concluída.",
        "install_success": "Pacote instalado com sucesso no sistema!",
        "err_deb": "Erro: Apenas arquivos .deb!",
        "err_cmd": "Erro: pacote 'debtap' não encontrado! Por favor, instale-o primeiro.",
        "install_err": "Instalação cancelada ou ocorreu um erro.",
        "dialog_title": "Informação",
        "settings": "Configurações",
        "general_group": "Configurações Gerais",
        "install_group": "Configurações de Auto-Instalação",
        "del_deb": "Excluir o arquivo .deb original após a conversão",
        "auto_close": "Fechar automaticamente se aberto a partir de um arquivo",
        "always_close": "Sempre fechar o programa após a conversão",
        "auto_install": "Instalar pacote automaticamente após a conversão",
        "delete_all": "Excluir todos os pacotes após a instalação (.deb e .zst)",
        "set_default": "Definir como padrão para arquivos .deb",
        "remove_default": "Remover padrão",
        "set_default_success": "Aplicativo definido como padrão com sucesso!",
        "remove_default_success": "Configuração de aplicativo padrão removida!",
        "deleted_msg": "\nArquivo original excluído.",
        "deleted_all_msg": "\nArquivos de instalação antigos e novos limpos.",
        "copy_success": "Comando copiado para a área de transferência!",
        "info_title": "Como instalar?",
        "info_footer": "<span size='small'>Desenvolvedor: Eren Dağlayan\nLicença: GPL-3.0\nVersão: v2.2.0</span>",
        "info_lbl_pacman": "Se a instalação automática estiver desativada, use este comando:",
        "info_lbl_pamac": "Ou você pode usar a ferramenta gráfica 'pamac':"
    },
    "ru": {
        "title": "Интерфейс Debtap",
        "desc": "Выберите файл .deb или перетащите его сюда",
        "btn_select": "Выбрать файл",
        "update_db": "Обновить базу данных",
        "loading": "Конвертация...\nПожалуйста, подождите.",
        "installing": "Установка пакета...\nПожалуйста, введите пароль.",
        "success": "Успех! Конвертация завершена.",
        "install_success": "Пакет успешно установлен в систему!",
        "err_deb": "Ошибка: Только файлы .deb!",
        "err_cmd": "Ошибка: пакет 'debtap' не найден! Сначала установите его.",
        "install_err": "Установка отменена или произошла ошибка.",
        "dialog_title": "Информация",
        "settings": "Настройки",
        "general_group": "Общие настройки",
        "install_group": "Настройки авто-установки",
        "del_deb": "Удалить исходный .deb файл после конвертации",
        "auto_close": "Авто-закрытие после конвертации при открытии из файла",
        "always_close": "Всегда закрывать программу после конвертации",
        "auto_install": "Автоматически установить пакет после конвертации",
        "delete_all": "Удалить все пакеты после установки (.deb и .zst)",
        "set_default": "Установить по умолчанию для файлов .deb",
        "remove_default": "Удалить по умолчанию",
        "set_default_success": "Приложение успешно установлено по умолчанию!",
        "remove_default_success": "Настройка приложения по умолчанию удалена!",
        "deleted_msg": "\nИсходный файл удален.",
        "deleted_all_msg": "\nСтарые и новые файлы установки очищены.",
        "copy_success": "Команда скопирована в буфер обмена!",
        "info_title": "Как установить?",
        "info_footer": "<span size='small'>Разработчик: Eren Dağlayan\nЛицензия: GPL-3.0\nВерсия: v2.2.0</span>",
        "info_lbl_pacman": "Если авто-установка отключена, используйте эту команду:",
        "info_lbl_pamac": "Или используйте графический инструмент 'pamac':"
    },
    "ur": {
        "title": "Debtap انٹرفیس",
        "desc": "ایک .deb فائل منتخب کریں یا ڈریگ اور ڈراپ کریں",
        "btn_select": "فائل منتخب کریں",
        "update_db": "ڈیٹا بیس کو اپ ڈیٹ کریں",
        "loading": "تبدیل ہو رہا ہے...\nبراہ کرم انتظار کریں۔",
        "installing": "پیکیج انسٹال ہو رہا ہے...\nبراہ کرم اپنا پاس ورڈ درج کریں۔",
        "success": "کامیابی! تبادلہ مکمل ہوا۔",
        "install_success": "پیکیج کامیابی کے ساتھ سسٹم میں انسٹال ہو گیا!",
        "err_deb": "خرابی: صرف .deb فائلیں!",
        "err_cmd": "خرابی: سسٹم میں 'debtap' نہیں ملا! براہ کرم اسے پہلے انسٹال کریں۔",
        "install_err": "تنصیب منسوخ ہو گئی یا کوئی خرابی پیش آ گئی۔",
        "dialog_title": "معلومات",
        "settings": "ترتیبات",
        "general_group": "عام ترتیبات",
        "install_group": "آٹو انسٹال کی ترتیبات",
        "del_deb": "تبدیل کرنے کے بعد اصل .deb فائل حذف کریں",
        "auto_close": "اگر فائل سے کھولا گیا ہے تو خودکار بند کریں",
        "always_close": "تبدیل کرنے کے بعد ہمیشہ پروگرام بند کریں",
        "auto_install": "تبدیل کرنے کے بعد خودکار طور پر پیکیج انسٹال کریں",
        "delete_all": "انسٹال کرنے کے بعد تمام پیکیجز حذف کریں (.deb اور .zst)",
        "set_default": ".deb فائلوں کے لیے ڈیفالٹ سیٹ کریں",
        "remove_default": "ڈیفالٹ ہٹائیں",
        "set_default_success": "ایپ کامیابی سے ڈیفالٹ سیٹ ہو گئی!",
        "remove_default_success": "ڈیفالٹ ایپ کی ترتیب ہٹا دی گئی!",
        "deleted_msg": "\nاصل فائل حذف کر دی گئی۔",
        "deleted_all_msg": "\nپرانی اور نئی انسٹالیشن فائلیں صاف کر دی گئیں۔",
        "copy_success": "کمانڈ کاپی ہو گئی!",
        "info_title": "کیسے انسٹال کریں؟",
        "info_footer": "<span size='small'>ڈیولپر: Eren Dağlayan\nلائسنس: GPL-3.0\nورژن: v2.2.0</span>",
        "info_lbl_pacman": "اگر آٹو انسٹال بند ہے، تو یہ کمانڈ استعمال کریں:",
        "info_lbl_pamac": "یا آپ 'pamac' گرافیکل ٹول استعمال کر سکتے ہیں:"
    }
}

# AYARLARIN PENCRESİ
class SettingsDialog(Adw.PreferencesWindow):
    def __init__(self, parent_window, lang, config):
        super().__init__(transient_for=parent_window)
        self.parent_window = parent_window
        self.lang = lang
        self.config = config

        self.set_title(LANGS[lang]["settings"])
        self.set_default_size(500, 450)

        page = Adw.PreferencesPage()
        self.add(page)

        # GENEL AYARLAR BÖLÜMÜ
        group_general = Adw.PreferencesGroup(title=LANGS[lang]["general_group"])
        page.add(group_general)

        self.row_del = Adw.ActionRow(title=LANGS[lang]["del_deb"])
        self.switch_del = Gtk.Switch(valign=Gtk.Align.CENTER)
        self.switch_del.set_active(self.config.get("delete_deb", False))
        self.row_del.add_suffix(self.switch_del)
        group_general.add(self.row_del)

        self.row_close = Adw.ActionRow(title=LANGS[lang]["auto_close"])
        self.switch_close = Gtk.Switch(valign=Gtk.Align.CENTER)
        self.switch_close.set_active(self.config.get("auto_close", False))
        self.row_close.add_suffix(self.switch_close)
        group_general.add(self.row_close)

        self.row_always_close = Adw.ActionRow(title=LANGS[lang]["always_close"])
        self.switch_always_close = Gtk.Switch(valign=Gtk.Align.CENTER)
        self.switch_always_close.set_active(self.config.get("always_close", False))
        self.row_always_close.add_suffix(self.switch_always_close)
        group_general.add(self.row_always_close)

        # KURULUM KISMI
        group_install = Adw.PreferencesGroup(title=LANGS[lang]["install_group"])
        page.add(group_install)

        self.row_auto_inst = Adw.ActionRow(title=LANGS[lang]["auto_install"])
        self.switch_auto_inst = Gtk.Switch(valign=Gtk.Align.CENTER)
        self.switch_auto_inst.set_active(self.config.get("auto_install", False))
        self.row_auto_inst.add_suffix(self.switch_auto_inst)
        group_install.add(self.row_auto_inst)

        self.row_del_all = Adw.ActionRow(title=LANGS[lang]["delete_all"])
        self.switch_del_all = Gtk.Switch(valign=Gtk.Align.CENTER)
        self.switch_del_all.set_active(self.config.get("delete_all", False))
        self.row_del_all.add_suffix(self.switch_del_all)
        group_install.add(self.row_del_all)


        self.switch_del.connect("notify::active", self.on_del_toggled)
        self.switch_close.connect("notify::active", self.on_close_toggled)
        self.switch_always_close.connect("notify::active", self.on_always_close_toggled)
        self.switch_auto_inst.connect("notify::active", self.on_auto_inst_toggled)
        self.switch_del_all.connect("notify::active", self.on_del_all_toggled)


        group_system = Adw.PreferencesGroup()
        page.add(group_system)

        self.btn_default = Gtk.Button()
        self.btn_default.set_margin_top(15)
        self.btn_default.add_css_class("suggested-action")
        self.btn_default.connect("clicked", self.on_toggle_default)
        self.update_default_button_ui()
        group_system.add(self.btn_default)

    def on_del_toggled(self, switch, pspec):
        if switch.get_active():
            self.switch_del_all.set_active(False)
        self.config["delete_deb"] = switch.get_active()
        save_config(self.config)

    def on_close_toggled(self, switch, pspec):
        if switch.get_active():
            self.switch_always_close.set_active(False)
        self.config["auto_close"] = switch.get_active()
        save_config(self.config)

    def on_always_close_toggled(self, switch, pspec):
        if switch.get_active():
            self.switch_close.set_active(False)
        self.config["always_close"] = switch.get_active()
        save_config(self.config)

    def on_auto_inst_toggled(self, switch, pspec):
        if not switch.get_active():
            self.switch_del_all.set_active(False)
        self.config["auto_install"] = switch.get_active()
        save_config(self.config)

    def on_del_all_toggled(self, switch, pspec):
        if switch.get_active():
            self.switch_del.set_active(False)
            self.switch_auto_inst.set_active(True)
        self.config["delete_all"] = switch.get_active()
        save_config(self.config)

    def is_app_default(self):
        try:
            res = subprocess.run(["xdg-mime", "query", "default", "application/vnd.debian.binary-package"], capture_output=True, text=True)
            return "org.eren.debtapgui.desktop" in res.stdout
        except:
            return False

    def update_default_button_ui(self):
        if self.is_app_default():
            self.btn_default.set_label(LANGS[self.lang]["remove_default"])
            self.btn_default.remove_css_class("suggested-action")
            self.btn_default.add_css_class("destructive-action")
        else:
            self.btn_default.set_label(LANGS[self.lang]["set_default"])
            self.btn_default.remove_css_class("destructive-action")
            self.btn_default.add_css_class("suggested-action")

    def on_toggle_default(self, btn):
        desktop_path = os.path.expanduser("~/.local/share/applications/org.eren.debtapgui.desktop")
        if self.is_app_default():
            if os.path.exists(desktop_path): os.remove(desktop_path)
            subprocess.run(["xdg-mime", "default", "", "application/vnd.debian.binary-package"])
            self.parent_window.show_toast(LANGS[self.lang]["remove_default_success"])
        else:
            script_path = os.path.abspath(sys.argv[0])
            desktop_entry = f"[Desktop Entry]\nName=Debtap GUI\nExec=python3 \"{script_path}\" %f\nType=Application\nTerminal=false\nMimeType=application/vnd.debian.binary-package;\nCategories=System;Utility;\n"
            os.makedirs(os.path.dirname(desktop_path), exist_ok=True)
            with open(desktop_path, "w") as f: f.write(desktop_entry)
            subprocess.run(["xdg-mime", "default", "org.eren.debtapgui.desktop", "application/vnd.debian.binary-package"])
            self.parent_window.show_toast(LANGS[self.lang]["set_default_success"])
        self.update_default_button_ui()

# BİZİM EGG
class DebtapWindow(Adw.ApplicationWindow):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        self.config = load_config()
        self.opened_from_file = False
        self.current_file_path = None
        self.work_dir = None
        self.zst_files_before = set()

        # DİL SEÇİMİ
        self.lang_keys = ["tr", "en", "zh", "hi", "es", "ar", "fr", "bn", "pt", "ru", "ur"]
        lang_display_names = ["Türkçe", "English", "中文", "हिन्दी", "Español", "العربية", "Français", "বাংলা", "Português", "Русский", "اردو"]

        # SİSTEM DİL ALGILAYICI
        self.current_lang = "en"
        default_index = 1

        try:
            sys_lang, _ = locale.getlocale()
            if sys_lang:
                short_lang = sys_lang[:2].lower() # Örn: 'tr_TR' -> 'tr'
                if short_lang in self.lang_keys:
                    self.current_lang = short_lang
                    default_index = self.lang_keys.index(short_lang)
        except Exception:
            pass
        # BİTİŞİ

        self.set_title(LANGS[self.current_lang]["title"])
        self.set_default_size(500, 450)

        self.toast_overlay = Adw.ToastOverlay()
        self.set_content(self.toast_overlay)

        view = Adw.ToolbarView()
        self.toast_overlay.set_child(view)

        header = Adw.HeaderBar()

        self.btn_info = Gtk.Button()
        self.btn_info.set_icon_name("dialog-information-symbolic")
        self.btn_info.connect("clicked", self.on_info_clicked)
        header.pack_start(self.btn_info)

        self.btn_update = Gtk.Button()
        self.btn_update.set_icon_name("view-refresh-symbolic")
        self.btn_update.connect("clicked", self.on_update_db_clicked)
        header.pack_start(self.btn_update)

        self.lang_model = Gtk.StringList.new(lang_display_names)
        self.lang_dropdown = Gtk.DropDown.new(model=self.lang_model, expression=None)
        self.lang_dropdown.set_selected(default_index) # Algılanan dili arayüzde seç
        self.lang_dropdown.set_valign(Gtk.Align.CENTER)
        self.lang_dropdown.connect("notify::selected", self.on_lang_changed)
        header.pack_end(self.lang_dropdown)

        self.btn_settings = Gtk.Button()
        self.btn_settings.set_icon_name("emblem-system-symbolic")
        self.btn_settings.connect("clicked", self.on_settings_clicked)
        header.pack_end(self.btn_settings)

        view.add_top_bar(header)

        self.stack = Gtk.Stack()
        self.stack.set_transition_type(Gtk.StackTransitionType.CROSSFADE)
        view.set_content(self.stack)

        # BİZİM EGG DESİGN
        self.page_main = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=20)
        self.page_main.set_valign(Gtk.Align.CENTER)

        self.status_page = Adw.StatusPage()
        self.status_page.set_icon_name("system-software-install")
        self.page_main.append(self.status_page)

        self.btn_select = Gtk.Button()
        self.btn_select.add_css_class("suggested-action")
        self.btn_select.add_css_class("pill")
        self.btn_select.set_halign(Gtk.Align.CENTER)
        self.btn_select.connect("clicked", self.on_open_file_dialog)
        self.page_main.append(self.btn_select)

        drop_target = Gtk.DropTarget.new(type=Gio.File.__gtype__, actions=Gdk.DragAction.COPY)
        drop_target.connect("drop", self.on_file_drop)
        self.page_main.add_controller(drop_target)

        self.stack.add_named(self.page_main, "main")

        # YÜKLENİYOR KISMI
        self.page_loading = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=20)
        self.page_loading.set_valign(Gtk.Align.CENTER)
        self.spinner = Gtk.Spinner()
        self.spinner.set_size_request(64, 64)
        self.page_loading.append(self.spinner)
        self.loading_label = Gtk.Label()
        self.page_loading.append(self.loading_label)
        self.stack.add_named(self.page_loading, "loading")

        self.update_ui_text()

        if len(sys.argv) > 1 and sys.argv[1].lower().endswith(".deb"):
            self.opened_from_file = True
            file_path = os.path.abspath(sys.argv[1])
            GLib.idle_add(self.start_conversion, file_path)

    def copy_to_clipboard(self, text):
        clipboard = self.get_clipboard()
        clipboard.set(text)
        self.show_toast(LANGS[self.current_lang]["copy_success"])

    def on_info_clicked(self, button):
        dialog = Adw.MessageDialog.new(self, LANGS[self.current_lang]["info_title"], "")
        dialog.set_body_use_markup(True)
        dialog.set_body(LANGS[self.current_lang]["info_footer"])
        dialog.add_response("ok", "OK")
        dialog.connect("response", lambda d, res: d.close())

        box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        box.set_margin_top(15)

        lbl1 = Gtk.Label(label=LANGS[self.current_lang]["info_lbl_pacman"])
        lbl1.set_halign(Gtk.Align.START)
        box.append(lbl1)

        row1 = Adw.ActionRow(title="cd &lt;file_location&gt; | sudo pacman -U &lt;file_name&gt;.pkg.tar.zst")
        btn1 = Gtk.Button(icon_name="edit-copy-symbolic", valign=Gtk.Align.CENTER)
        btn1.add_css_class("flat")
        btn1.connect("clicked", lambda b: self.copy_to_clipboard("sudo pacman -U <file_name>.pkg.tar.zst"))
        row1.add_suffix(btn1)
        box.append(row1)

        lbl2 = Gtk.Label(label=LANGS[self.current_lang]["info_lbl_pamac"])
        lbl2.set_halign(Gtk.Align.START)
        lbl2.set_margin_top(10)
        box.append(lbl2)

        row2 = Adw.ActionRow(title="sudo pacman -S pamac-aur")
        btn2 = Gtk.Button(icon_name="edit-copy-symbolic", valign=Gtk.Align.CENTER)
        btn2.add_css_class("flat")
        btn2.connect("clicked", lambda b: self.copy_to_clipboard("sudo pacman -S pamac-aur"))
        row2.add_suffix(btn2)
        box.append(row2)

        dialog.set_extra_child(box)
        dialog.present()


    def on_settings_clicked(self, button):
        dialog = SettingsDialog(self, self.current_lang, self.config)
        dialog.present()

    def update_ui_text(self):
        l = LANGS[self.current_lang]
        self.set_title(l["title"])
        self.status_page.set_title(l["title"])
        self.status_page.set_description(l["desc"])
        self.btn_select.set_label(l["btn_select"])
        self.loading_label.set_text(l["loading"])

    def on_lang_changed(self, dropdown, pspec):
        selected_index = dropdown.get_selected()
        self.current_lang = self.lang_keys[selected_index]
        self.update_ui_text()

    def on_update_db_clicked(self, button):
        terminals = ["kgx", "gnome-terminal", "konsole", "kitty", "alacritty", "xfce4-terminal", "ghosty"]
        found = False
        for t in terminals:
            if shutil.which(t):
                subprocess.Popen([t, "-e", "sudo", "debtap", "-u"]) if t != "kgx" and t != "gnome-terminal" else subprocess.Popen([t, "--", "sudo", "debtap", "-u"])
                found = True
                break
        if not found: self.show_error_dialog("Terminal bulunamadı! Lütfen manuel: sudo debtap -u")
        else: self.show_toast(LANGS[self.current_lang]["update_db"] + "...")

    def on_file_drop(self, drop_target, value, x, y):
        path = value.get_path()
        if path.lower().endswith(".deb"): self.start_conversion(path)
        else: self.show_toast(LANGS[self.current_lang]["err_deb"])
        return True

    def on_open_file_dialog(self, button):
        dialog = Gtk.FileDialog.new()
        dialog.open(self, None, self.on_file_selected)

    def on_file_selected(self, dialog, result):
        try:
            file = dialog.open_finish(result)
            if file: self.start_conversion(file.get_path())
        except: pass

    def get_zst_files(self, directory):
        return set(f for f in os.listdir(directory) if f.endswith(".pkg.tar.zst"))

    def start_conversion(self, path):
        if not shutil.which("debtap"):
            self.show_error_dialog(LANGS[self.current_lang]["err_cmd"])
            return

        self.current_file_path = path
        self.work_dir = os.path.dirname(path)
        self.zst_files_before = self.get_zst_files(self.work_dir)

        self.spinner.start()
        self.stack.set_visible_child_name("loading")
        threading.Thread(target=self.run_debtap_thread, args=(path,), daemon=True).start()

    def run_debtap_thread(self, path):
        try:
            process = subprocess.run(["debtap", "-q", path], cwd=self.work_dir, capture_output=True, text=True, input="y\n")
            success = (process.returncode == 0)
            msg = LANGS[self.current_lang]["success"] if success else (process.stderr.strip() or "Bilinmeyen Hata")
            GLib.idle_add(self.on_conversion_done, success, msg)
        except Exception as e:
            GLib.idle_add(self.on_conversion_done, False, str(e))

    def on_conversion_done(self, success, message):
        if not success:
            self.spinner.stop()
            self.stack.set_visible_child_name("main")
            self.show_error_dialog(message)
            return

        zst_files_after = self.get_zst_files(self.work_dir)
        new_files = zst_files_after - self.zst_files_before
        new_pkg_path = os.path.join(self.work_dir, list(new_files)[0]) if new_files else None

        if self.config.get("auto_install", False) and new_pkg_path:
            self.loading_label.set_text(LANGS[self.current_lang]["installing"])
            threading.Thread(target=self.run_install_thread, args=(new_pkg_path,), daemon=True).start()
        else:
            self.finish_all_tasks(message)

    def run_install_thread(self, pkg_path):
        try:
            process = subprocess.run(["pkexec", "pacman", "-U", "--noconfirm", pkg_path], capture_output=True, text=True)
            success = (process.returncode == 0)
            GLib.idle_add(self.on_install_done, success, pkg_path)
        except:
            GLib.idle_add(self.on_install_done, False, pkg_path)

    def on_install_done(self, success, pkg_path):
        if success:
            msg = LANGS[self.current_lang]["install_success"]
            if self.config.get("delete_all", False):
                try:
                    os.remove(self.current_file_path)
                    os.remove(pkg_path)
                    msg += LANGS[self.current_lang]["deleted_all_msg"]
                except: pass
            self.finish_all_tasks(msg)
        else:
            self.finish_all_tasks(LANGS[self.current_lang]["install_err"])

    def finish_all_tasks(self, message):
        self.spinner.stop()
        self.stack.set_visible_child_name("main")
        self.loading_label.set_text(LANGS[self.current_lang]["loading"])

        if self.config.get("delete_deb", False) and not self.config.get("delete_all", False):
            try:
                os.remove(self.current_file_path)
                message += LANGS[self.current_lang]["deleted_msg"]
            except: pass

        self.show_toast(message)


        if self.config.get("always_close", False) or (self.opened_from_file and self.config.get("auto_close", False)):
            GLib.timeout_add(500, self.get_application().quit)

    def show_toast(self, text):
        toast = Adw.Toast.new(text)
        toast.set_timeout(3)
        self.toast_overlay.add_toast(toast)

    def show_error_dialog(self, text):
        dialog = Adw.MessageDialog.new(self, LANGS[self.current_lang]["dialog_title"], text[:500])
        dialog.add_response("ok", "OK")
        dialog.connect("response", lambda d, res: d.close())
        dialog.present()

class DebtapApp(Adw.Application):
    def __init__(self):
        super().__init__(application_id="org.eren.debtapgui")
    def do_activate(self):
        Adw.StyleManager.get_default().set_color_scheme(Adw.ColorScheme.PREFER_DARK)
        DebtapWindow(application=self).present()

def main():
    app = DebtapApp()
    app.run(None)

if __name__ == "__main__":
    try:
        main()
    except Exception:
        traceback.print_exc()
        input("Hata oluştu, kapatmak için Enter'a bas...")
