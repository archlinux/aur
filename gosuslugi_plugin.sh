#!/usr/bin/env bash

# Вендорский лаунчер: bundled-библиотеки плагина (bin:lib) должны быть в
# LD_LIBRARY_PATH. Браузер передаёт "$@" = <путь_манифеста> <origin>;
# по пути манифеста бинарь сам находит config (опция --config не нужна).
if [ ! -z "$LD_LIBRARY_PATH" ]; then
  export LD_LIBRARY_PATH="/opt/iitrust/gosuslugi_plugin/bin:/opt/iitrust/gosuslugi_plugin/lib:$LD_LIBRARY_PATH"
else
  export LD_LIBRARY_PATH="/opt/iitrust/gosuslugi_plugin/bin:/opt/iitrust/gosuslugi_plugin/lib"
fi

/opt/iitrust/gosuslugi_plugin/bin/gosuslugi_plugin "$@"