# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

pkgbase=opentelemetry-python-contrib
pkgver=0.66b1
pkgrel=3
arch=("any")
_url="https://github.com/open-telemetry/${pkgbase}"
license=("Apache-2.0")
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgbase}::git+${_url}.git#tag=v${pkgver}")
b2sums=('b6628f7da2c0fd1a5ea50c38c7d9a5d49be5d8b135729f6b77fc89844311c9ae958638b82289926b8a01f42bf81555870bf5465799cc8e6698703bbfd6d737e7')

# run './geninfo.sh' to generate following variables
pkgname=(
    "python-opentelemetry-exporter-prometheus-remote-write"
    "python-opentelemetry-instrumentation-openai-agents-v2"
    "python-opentelemetry-instrumentation-openai-v2"
    "python-opentelemetry-instrumentation-vertexai"
    "python-opentelemetry-instrumentation-aio-pika"
    "python-opentelemetry-instrumentation-aiokafka"
    "python-opentelemetry-instrumentation-asyncclick"
    "python-opentelemetry-instrumentation-cassandra"
    "python-opentelemetry-instrumentation-celery"
    "python-opentelemetry-instrumentation-confluent-kafka"
    "python-opentelemetry-instrumentation-kafka-python"
    "python-opentelemetry-instrumentation-pymemcache"
    "python-opentelemetry-instrumentation-pymssql"
    "python-opentelemetry-instrumentation-pyramid"
    "python-opentelemetry-instrumentation-remoulade"
    "python-opentelemetry-instrumentation-tortoiseorm"
    "python-opentelemetry-instrumentation-valkey-py"
    "python-opentelemetry-opamp-client"
    "python-opentelemetry-contrib-instrumentations"
    "opentelemetry-python-contrib"
)
_pkgdescs=(
    "Prometheus Remote Write Metrics Exporter for OpenTelemetry"
    "OpenTelemetry Official OpenAI Agents instrumentation"
    "OpenTelemetry Official OpenAI instrumentation"
    "OpenTelemetry Official VertexAI instrumentation"
    "OpenTelemetry Aio-pika instrumentation"
    "OpenTelemetry aiokafka instrumentation"
    "Async Click instrumentation for OpenTelemetry"
    "OpenTelemetry Cassandra instrumentation"
    "OpenTelemetry Celery Instrumentation"
    "OpenTelemetry Confluent Kafka instrumentation"
    "OpenTelemetry Kafka-Python instrumentation"
    "OpenTelemetry pymemcache instrumentation"
    "OpenTelemetry pymssql instrumentation"
    "OpenTelemetry Pyramid instrumentation"
    "OpenTelemetry Remoulade instrumentation"
    "OpenTelemetry Instrumentation for Tortoise ORM"
    "OpenTelemetry Valkey instrumentation"
    "OpenTelemetry OpAMP client"
    "OpenTelemetry Contrib Instrumentation Packages"
    "OpenTelemetry Python Contrib meta package (depends on all instrumentation sub-packages)"
)
_urls=(
    "${_url}/tree/main/exporter/opentelemetry-exporter-prometheus-remote-write"
    "${_url}/tree/main/instrumentation-genai/opentelemetry-instrumentation-openai-agents-v2"
    "${_url}/tree/main/instrumentation-genai/opentelemetry-instrumentation-openai-v2"
    "${_url}/tree/main/instrumentation-genai/opentelemetry-instrumentation-vertexai"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-aio-pika"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-aiokafka"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-asyncclick"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-cassandra"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-celery"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-confluent-kafka"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-kafka-python"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-pymemcache"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-pymssql"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-pyramid"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-remoulade"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-tortoiseorm"
    "${_url}/tree/main/instrumentation/opentelemetry-instrumentation-valkey-py"
    "${_url}/tree/main/opamp/opentelemetry-opamp-client"
    "${_url}/tree/main/opentelemetry-contrib-instrumentations"
    "${_url}"
)
_depends=(
    "python-opentelemetry-api python-opentelemetry-sdk python-protobuf python-requests python-snappy"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-opentelemetry-util-genai python-typing_extensions"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-opentelemetry-util-genai python-typing_extensions"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-opentelemetry-util-genai"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-wrapt"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-typing_extensions"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-typing_extensions python-wrapt"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-wrapt"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-wrapt"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-wrapt"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-instrumentation-dbapi"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-instrumentation-wsgi python-opentelemetry-semantic-conventions python-opentelemetry-util-http python-wrapt"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions"
    "python-opentelemetry-api python-opentelemetry-instrumentation python-opentelemetry-semantic-conventions python-wrapt"
    "python-opentelemetry-api python-protobuf python-requests python-uuid-utils"
    "python-opentelemetry-instrumentation-aio-pika python-opentelemetry-instrumentation-aiohttp-client python-opentelemetry-instrumentation-aiohttp-server python-opentelemetry-instrumentation-aiokafka python-opentelemetry-instrumentation-aiopg python-opentelemetry-instrumentation-asgi python-opentelemetry-instrumentation-asyncclick python-opentelemetry-instrumentation-asyncio python-opentelemetry-instrumentation-asyncpg python-opentelemetry-instrumentation-aws-lambda python-opentelemetry-instrumentation-boto3sqs python-opentelemetry-instrumentation-botocore python-opentelemetry-instrumentation-cassandra python-opentelemetry-instrumentation-celery python-opentelemetry-instrumentation-click python-opentelemetry-instrumentation-confluent-kafka python-opentelemetry-instrumentation-dbapi python-opentelemetry-instrumentation-django python-opentelemetry-instrumentation-exceptions python-opentelemetry-instrumentation-falcon python-opentelemetry-instrumentation-fastapi python-opentelemetry-instrumentation-flask python-opentelemetry-instrumentation-grpc python-opentelemetry-instrumentation-httpx python-opentelemetry-instrumentation-jinja2 python-opentelemetry-instrumentation-kafka-python python-opentelemetry-instrumentation-logging python-opentelemetry-instrumentation-mysql python-opentelemetry-instrumentation-mysqlclient python-opentelemetry-instrumentation-pika python-opentelemetry-instrumentation-psycopg python-opentelemetry-instrumentation-psycopg2 python-opentelemetry-instrumentation-pymemcache python-opentelemetry-instrumentation-pymongo python-opentelemetry-instrumentation-pymssql python-opentelemetry-instrumentation-pymysql python-opentelemetry-instrumentation-pyramid python-opentelemetry-instrumentation-redis python-opentelemetry-instrumentation-remoulade python-opentelemetry-instrumentation-requests python-opentelemetry-instrumentation-sqlalchemy python-opentelemetry-instrumentation-sqlite3 python-opentelemetry-instrumentation-starlette python-opentelemetry-instrumentation-structlog python-opentelemetry-instrumentation-system-metrics python-opentelemetry-instrumentation-threading python-opentelemetry-instrumentation-tornado python-opentelemetry-instrumentation-tortoiseorm python-opentelemetry-instrumentation-urllib python-opentelemetry-instrumentation-urllib3 python-opentelemetry-instrumentation-wsgi"
    "python-opentelemetry-exporter-prometheus-remote-write python-opentelemetry-instrumentation-openai-agents-v2 python-opentelemetry-instrumentation-openai-v2 python-opentelemetry-instrumentation-vertexai python-opentelemetry-instrumentation-aio-pika python-opentelemetry-instrumentation-aiokafka python-opentelemetry-instrumentation-asyncclick python-opentelemetry-instrumentation-cassandra python-opentelemetry-instrumentation-celery python-opentelemetry-instrumentation-confluent-kafka python-opentelemetry-instrumentation-kafka-python python-opentelemetry-instrumentation-pymemcache python-opentelemetry-instrumentation-pymssql python-opentelemetry-instrumentation-pyramid python-opentelemetry-instrumentation-remoulade python-opentelemetry-instrumentation-tortoiseorm python-opentelemetry-instrumentation-valkey-py python-opentelemetry-opamp-client python-opentelemetry-contrib-instrumentations "
)
_optdepends=(
    ""
    "python-openai-agents"
    "python-openai"
    "python-google-cloud-aiplatform"
    "python-aio-pika"
    "python-aiokafka"
    "python-asyncclick"
    "python-cassandra-driver python-scylla-driver"
    "python-celery"
    "python-confluent-kafka"
    "python-kafka"
    "python-pymemcache"
    "python-pymssql"
    "python-pyramid"
    "python-remoulade"
    "python-pydantic python-tortoise-orm"
    "python-valkey"
    ""
    ""
    ""
)

build() {
    for ((i=0; i<${#pkgname[@]}; i++)); do
        # meta 包无需编译
        [[ "${pkgname[i]}" == "${pkgbase}" ]] && continue
        _pkgname="${pkgname[i]#*-}"
        _dirname=$(echo "${_urls[i]}" | sed -e "s|^${_url}/tree/main/||g" -e "s|${_pkgname}$||g")
        python -m build --wheel --no-isolation "${pkgbase}/${_dirname}${_pkgname}"
    done
}

main() {
    for ((i=0; i<${#pkgname[@]}; i++)); do
        # meta 包：仅作为依赖集合，无需编译/安装文件
        if [[ "${pkgname[i]}" == "${pkgbase}" ]]; then
            eval "package_${pkgbase}() {
                pkgdesc=\"${_pkgdescs[i]}\"
                url=\"${_urls[i]}\"
                depends=(${_depends[i]})
                optdepends=(${_optdepends[i]})
            }"
            continue
        fi
        _pkgname="${pkgname[i]#*-}"
        _dirname=$(echo "${_urls[i]}" | sed -e "s|^${_url}/tree/main/||g" -e "s|${_pkgname}$||g")
        eval "package_python-${_pkgname}() {
            pkgdesc=\"${_pkgdescs[i]}\"
            url=\"${_urls[i]}\"
            depends=(${_depends[i]})
            optdepends=(${_optdepends[i]})

            cd \"${pkgbase}/${_dirname}${_pkgname}\"
            python -m installer --destdir=\"\${pkgdir}\" dist/*.whl
            if [[ -f README.rst ]]; then
                install -Dm644 README.rst \"\${pkgdir}/usr/share/doc/python-${_pkgname}/README.rst\"
            fi
            if [[ -f CHANGELOG.md ]]; then
                install -Dm644 CHANGELOG.md \"\${pkgdir}/usr/share/doc/python-${_pkgname}/CHANGELOG.md\"
            fi
        }"
    done
}

main
