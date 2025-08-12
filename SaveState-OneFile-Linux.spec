# -*- mode: python ; coding: utf-8 -*-

# --- OPZIONI PRINCIPALI ---
a = Analysis(
    ['main.py'], # Script principale della tua applicazione
    pathex=[],   # Percorsi aggiuntivi per la ricerca di moduli (solitamente vuoto se la struttura è standard)
    binaries=[], # File binari non Python da includere (lascia vuoto se non necessario)
    datas=[
         ('icons', 'icons'),              # Copia la cartella 'icons' nella root dell'output [cite: 11]
         ('splash.png', '.'),
		 ('icon.png', '.'),
		 ('backup_runner.py', '.'),
         ('emulator_utils/citra_titles_map.pkl', 'emulator_utils'), # Include il DB dei titoli 3ds
         ('emulator_utils/switch_game_map.pkl', 'emulator_utils'), # Include il DB dei titoli swich
         ('emulator_utils/ps4_game_map.pkl', 'emulator_utils'), # Include il DB dei titoli ps4
         ('emulator_utils/xenia_title_map.pkl', 'emulator_utils'), # include il DB dei titoli xbox 360
    ],
    hiddenimports=[
        'PySide6.QtSvg',             # Necessario per icone SVG se usate
        'PySide6.QtNetwork',         # Usato per QLocalServer/QLocalSocket per single instance
        'PySide6.QtGui',             # Moduli Qt essenziali
        'PySide6.QtWidgets',         # Moduli Qt essenziali
        'PySide6.QtCore',            # Moduli Qt essenziali
        'shiboken6',                 # Runtime PySide6
        # Rimuovi moduli Windows-specifici
        # 'winreg',                  # Windows-specifico
        # 'winshell',                # Windows-specifico
        # 'win32com',                # Windows-specifico
        # 'win32com.client',         # Windows-specifico
        'pkg_resources',             # Spesso richiesto da altre librerie
        'importlib.metadata',        # Richiesto da pkg_resources o altri
        'vdf',                       # Dipendenza opzionale per Steam ID
        'nbtlib',                    # Dipendenza opzionale per nomi mondi Minecraft
        'thefuzz',                   # Usato in core_logic per similarità
        'thefuzz.fuzz',              # Parte di thefuzz
        'thefuzz.process',           # Parte di thefuzz
        'psutil',                    # Includi per possibili usi nascosti
        'xml.etree.ElementTree',     # Usato per leggere XML (Cemu meta/settings)
        'configparser',              # Usato per leggere INI (mGBA config)
        # 'Levenshtein',             # Opzionale: per thefuzz[speedup], se installato
    ],
    hookspath=[],          # Percorsi per script hook personalizzati
    hooksconfig={},
    runtime_hooks=[],      # Script da eseguire al runtime prima del codice principale
    excludes=[],           # Moduli da escludere esplicitamente
    noarchive=False,
    optimize=0             # Livello di ottimizzazione bytecode
)
pyz = PYZ(a.pure)

splash = Splash(
    'splash.png',
    binaries=a.binaries,
    datas=a.datas,
    # --- Aggiungi parametri extra dal minimale ---
    text_pos=None,
    text_size=12,
    minify_script=True,
    always_on_top=False,
    # --- Fine parametri extra ---
)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    splash,
    splash.binaries,
    # splash.datas,
    [],
    #splash=splash,
    name='SaveState',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=False,
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon='icon.png'  # Usa l'icona PNG per Linux invece di ICO
)

# coll = COLLECT(
#     exe,
#     a.binaries,
#     a.datas,
#     strip=False,
#     upx=True,
#     upx_exclude=[],
#     name='SaveState'
# )