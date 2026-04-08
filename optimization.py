class LauncherOptimizer:
    def __init__(self):
        self.ram_mb = 4096

    def get_jvm_arguments(self):
        # Реально работающая передача ОЗУ + лютые флаги для слабых ноутов
        args = [
            f"-Xmx{int(self.ram_mb)}M", # Максимальная память
            f"-Xms{int(self.ram_mb)}M", # Минимальная память (равенство убирает скачки FPS)
            "-XX:+UnlockExperimentalVMOptions",
            "-XX:+UseG1GC",             # Современный сборщик мусора
            "-XX:G1NewSizePercent=20",
            "-XX:G1ReservePercent=20",
            "-XX:MaxGCPauseMillis=50",  # Уменьшает задержки
            "-XX:G1HeapRegionSize=32M",
            "-XX:+DisableExplicitGC",
            "-XX:+AlwaysPreTouch",      # Выделяет память сразу, предотвращая лаги в игре
            "-XX:+ParallelRefProcEnabled",
            "-Dsun.rmi.dgc.server.gcInterval=3600000",
            "-Dsun.rmi.dgc.client.gcInterval=3600000"
        ]
        return args