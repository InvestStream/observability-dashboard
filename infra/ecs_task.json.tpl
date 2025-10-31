[
  {
    "name": "langfuse-worker",
    "image": "docker.io/langfuse/langfuse-worker:3",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3030,
        "hostPort": 3030
      }
    ],
    "environment": [
      {
        "name": "POSTGRES_URL",
        "value": "postgres://langfuse:password@localhost:5432/langfuse"
      },
      {
        "name": "REDIS_URL",
        "value": "redis://localhost:6379"
      },
      {
        "name": "CLICKHOUSE_URL",
        "value": "http://localhost:8123"
      },
      {
        "name": "NEXTAUTH_URL",
        "value": "${NEXTAUTH_URL:-http://localhost:3000}"
      },
      {
        "name": "DATABASE_URL",
        "value": "${DATABASE_URL:-postgresql://postgres:postgres@postgres:5432/postgres}"
      },
      {
        "name": "SALT",
        "value": "${SALT:-mysalt}"
      },
      {
        "name": "ENCRYPTION_KEY",
        "value": "${ENCRYPTION_KEY:-0000000000000000000000000000000000000000000000000000000000000000}"
      },
      {
        "name": "TELEMETRY_ENABLED",
        "value": "${TELEMETRY_ENABLED:-true}"
      },
      {
        "name": "LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES",
        "value": "${LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES:-true}"
      },
      {
        "name": "CLICKHOUSE_MIGRATION_URL",
        "value": "${CLICKHOUSE_MIGRATION_URL:-clickhouse://clickhouse:9000}"
      },
      {
        "name": "CLICKHOUSE_URL",
        "value": "${CLICKHOUSE_URL:-http://clickhouse:8123}"
      },
      {
        "name": "CLICKHOUSE_USER",
        "value": "${CLICKHOUSE_USER:-clickhouse}"
      },
      {
        "name": "CLICKHOUSE_PASSWORD",
        "value": "${CLICKHOUSE_PASSWORD:-clickhouse}"
      },
      {
        "name": "CLICKHOUSE_CLUSTER_ENABLED",
        "value": "${CLICKHOUSE_CLUSTER_ENABLED:-false}"
      },
      {
        "name": "LANGFUSE_USE_AZURE_BLOB",
        "value": "${LANGFUSE_USE_AZURE_BLOB:-false}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_BUCKET",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_BUCKET:-langfuse}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_REGION",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_REGION:-auto}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_ACCESS_KEY_ID",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_ACCESS_KEY_ID:-minio}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_SECRET_ACCESS_KEY",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_SECRET_ACCESS_KEY:-miniosecret}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_ENDPOINT",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_ENDPOINT:-http://minio:9000}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_FORCE_PATH_STYLE",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_FORCE_PATH_STYLE:-true}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_PREFIX",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_PREFIX:-events/}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_BUCKET",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_BUCKET:-langfuse}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_REGION",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_REGION:-auto}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_ACCESS_KEY_ID",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_ACCESS_KEY_ID:-minio}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_SECRET_ACCESS_KEY",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_SECRET_ACCESS_KEY:-miniosecret}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_ENDPOINT",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_ENDPOINT:-http://localhost:9090}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_FORCE_PATH_STYLE",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_FORCE_PATH_STYLE:-true}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_PREFIX",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_PREFIX:-media/}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_ENABLED",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_ENABLED:-false}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_BUCKET",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_BUCKET:-langfuse}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_PREFIX",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_PREFIX:-exports/}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_REGION",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_REGION:-auto}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_ENDPOINT",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_ENDPOINT:-http://minio:9000}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_EXTERNAL_ENDPOINT",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_EXTERNAL_ENDPOINT:-http://localhost:9090}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_ACCESS_KEY_ID",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_ACCESS_KEY_ID:-minio}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_SECRET_ACCESS_KEY",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_SECRET_ACCESS_KEY:-miniosecret}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_FORCE_PATH_STYLE",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_FORCE_PATH_STYLE:-true}"
      },
      {
        "name": "LANGFUSE_INGESTION_QUEUE_DELAY_MS",
        "value": "${LANGFUSE_INGESTION_QUEUE_DELAY_MS:-}"
      },
      {
        "name": "LANGFUSE_INGESTION_CLICKHOUSE_WRITE_INTERVAL_MS",
        "value": "${LANGFUSE_INGESTION_CLICKHOUSE_WRITE_INTERVAL_MS:-}"
      },
      {
        "name": "REDIS_HOST",
        "value": "${REDIS_HOST:-redis}"
      },
      {
        "name": "REDIS_PORT",
        "value": "${REDIS_PORT:-6379}"
      },
      {
        "name": "REDIS_AUTH",
        "value": "${REDIS_AUTH:-myredissecret}"
      },
      {
        "name": "REDIS_TLS_ENABLED",
        "value": "${REDIS_TLS_ENABLED:-false}"
      },
      {
        "name": "REDIS_TLS_CA",
        "value": "${REDIS_TLS_CA:-/certs/ca.crt}"
      },
      {
        "name": "REDIS_TLS_CERT",
        "value": "${REDIS_TLS_CERT:-/certs/redis.crt}"
      },
      {
        "name": "REDIS_TLS_KEY",
        "value": "${REDIS_TLS_KEY:-/certs/redis.key}"
      },
      {
        "name": "EMAIL_FROM_ADDRESS",
        "value": "${EMAIL_FROM_ADDRESS:-}"
      },
      {
        "name": "SMTP_CONNECTION_URL",
        "value": "${SMTP_CONNECTION_URL:-}"
      }
    ],
    "dependsOn": [
      {
        "containerName": "postgres",
        "condition": "HEALTHY"
      },
      {
        "containerName": "minio",
        "condition": "HEALTHY"
      },
      {
        "containerName": "redis",
        "condition": "HEALTHY"
      },
      {
        "containerName": "clickhouse",
        "condition": "HEALTHY"
      }
    ]
  },
  {
    "name": "langfuse-web",
    "image": "docker.io/langfuse/langfuse:3",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ],
    "environment": [
      {
        "name": "POSTGRES_URL",
        "value": "postgres://langfuse:password@localhost:5432/langfuse"
      },
      {
        "name": "REDIS_URL",
        "value": "redis://localhost:6379"
      },
      {
        "name": "CLICKHOUSE_URL",
        "value": "http://localhost:8123"
      },
      {
        "name": "NEXTAUTH_URL",
        "value": "${NEXTAUTH_URL:-http://localhost:3000}"
      },
      {
        "name": "DATABASE_URL",
        "value": "${DATABASE_URL:-postgresql://postgres:postgres@postgres:5432/postgres}"
      },
      {
        "name": "SALT",
        "value": "${SALT:-mysalt}"
      },
      {
        "name": "ENCRYPTION_KEY",
        "value": "${ENCRYPTION_KEY:-0000000000000000000000000000000000000000000000000000000000000000}"
      },
      {
        "name": "TELEMETRY_ENABLED",
        "value": "${TELEMETRY_ENABLED:-true}"
      },
      {
        "name": "LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES",
        "value": "${LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES:-true}"
      },
      {
        "name": "CLICKHOUSE_MIGRATION_URL",
        "value": "${CLICKHOUSE_MIGRATION_URL:-clickhouse://clickhouse:9000}"
      },
      {
        "name": "CLICKHOUSE_URL",
        "value": "${CLICKHOUSE_URL:-http://clickhouse:8123}"
      },
      {
        "name": "CLICKHOUSE_USER",
        "value": "${CLICKHOUSE_USER:-clickhouse}"
      },
      {
        "name": "CLICKHOUSE_PASSWORD",
        "value": "${CLICKHOUSE_PASSWORD:-clickhouse}"
      },
      {
        "name": "CLICKHOUSE_CLUSTER_ENABLED",
        "value": "${CLICKHOUSE_CLUSTER_ENABLED:-false}"
      },
      {
        "name": "LANGFUSE_USE_AZURE_BLOB",
        "value": "${LANGFUSE_USE_AZURE_BLOB:-false}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_BUCKET",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_BUCKET:-langfuse}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_REGION",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_REGION:-auto}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_ACCESS_KEY_ID",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_ACCESS_KEY_ID:-minio}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_SECRET_ACCESS_KEY",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_SECRET_ACCESS_KEY:-miniosecret}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_ENDPOINT",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_ENDPOINT:-http://minio:9000}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_FORCE_PATH_STYLE",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_FORCE_PATH_STYLE:-true}"
      },
      {
        "name": "LANGFUSE_S3_EVENT_UPLOAD_PREFIX",
        "value": "${LANGFUSE_S3_EVENT_UPLOAD_PREFIX:-events/}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_BUCKET",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_BUCKET:-langfuse}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_REGION",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_REGION:-auto}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_ACCESS_KEY_ID",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_ACCESS_KEY_ID:-minio}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_SECRET_ACCESS_KEY",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_SECRET_ACCESS_KEY:-miniosecret}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_ENDPOINT",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_ENDPOINT:-http://localhost:9090}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_FORCE_PATH_STYLE",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_FORCE_PATH_STYLE:-true}"
      },
      {
        "name": "LANGFUSE_S3_MEDIA_UPLOAD_PREFIX",
        "value": "${LANGFUSE_S3_MEDIA_UPLOAD_PREFIX:-media/}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_ENABLED",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_ENABLED:-false}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_BUCKET",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_BUCKET:-langfuse}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_PREFIX",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_PREFIX:-exports/}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_REGION",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_REGION:-auto}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_ENDPOINT",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_ENDPOINT:-http://minio:9000}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_EXTERNAL_ENDPOINT",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_EXTERNAL_ENDPOINT:-http://localhost:9090}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_ACCESS_KEY_ID",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_ACCESS_KEY_ID:-minio}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_SECRET_ACCESS_KEY",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_SECRET_ACCESS_KEY:-miniosecret}"
      },
      {
        "name": "LANGFUSE_S3_BATCH_EXPORT_FORCE_PATH_STYLE",
        "value": "${LANGFUSE_S3_BATCH_EXPORT_FORCE_PATH_STYLE:-true}"
      },
      {
        "name": "LANGFUSE_INGESTION_QUEUE_DELAY_MS",
        "value": "${LANGFUSE_INGESTION_QUEUE_DELAY_MS:-}"
      },
      {
        "name": "LANGFUSE_INGESTION_CLICKHOUSE_WRITE_INTERVAL_MS",
        "value": "${LANGFUSE_INGESTION_CLICKHOUSE_WRITE_INTERVAL_MS:-}"
      },
      {
        "name": "REDIS_HOST",
        "value": "${REDIS_HOST:-redis}"
      },
      {
        "name": "REDIS_PORT",
        "value": "${REDIS_PORT:-6379}"
      },
      {
        "name": "REDIS_AUTH",
        "value": "${REDIS_AUTH:-myredissecret}"
      },
      {
        "name": "REDIS_TLS_ENABLED",
        "value": "${REDIS_TLS_ENABLED:-false}"
      },
      {
        "name": "REDIS_TLS_CA",
        "value": "${REDIS_TLS_CA:-/certs/ca.crt}"
      },
      {
        "name": "REDIS_TLS_CERT",
        "value": "${REDIS_TLS_CERT:-/certs/redis.crt}"
      },
      {
        "name": "REDIS_TLS_KEY",
        "value": "${REDIS_TLS_KEY:-/certs/redis.key}"
      },
      {
        "name": "EMAIL_FROM_ADDRESS",
        "value": "${EMAIL_FROM_ADDRESS:-}"
      },
      {
        "name": "SMTP_CONNECTION_URL",
        "value": "${SMTP_CONNECTION_URL:-}"
      },
      {
        "name": "NEXTAUTH_SECRET",
        "value": "${NEXTAUTH_SECRET:-mysecret}"
      },
      {
        "name": "LANGFUSE_INIT_ORG_ID",
        "value": "${LANGFUSE_INIT_ORG_ID:-}"
      },
      {
        "name": "LANGFUSE_INIT_ORG_NAME",
        "value": "${LANGFUSE_INIT_ORG_NAME:-}"
      },
      {
        "name": "LANGFUSE_INIT_PROJECT_ID",
        "value": "${LANGFUSE_INIT_PROJECT_ID:-}"
      },
      {
        "name": "LANGFUSE_INIT_PROJECT_NAME",
        "value": "${LANGFUSE_INIT_PROJECT_NAME:-}"
      },
      {
        "name": "LANGFUSE_INIT_PROJECT_PUBLIC_KEY",
        "value": "${LANGFUSE_INIT_PROJECT_PUBLIC_KEY:-}"
      },
      {
        "name": "LANGFUSE_INIT_PROJECT_SECRET_KEY",
        "value": "${LANGFUSE_INIT_PROJECT_SECRET_KEY:-}"
      },
      {
        "name": "LANGFUSE_INIT_USER_EMAIL",
        "value": "${LANGFUSE_INIT_USER_EMAIL:-}"
      },
      {
        "name": "LANGFUSE_INIT_USER_NAME",
        "value": "${LANGFUSE_INIT_USER_NAME:-}"
      },
      {
        "name": "LANGFUSE_INIT_USER_PASSWORD",
        "value": "${LANGFUSE_INIT_USER_PASSWORD:-}"
      }
    ],
    "dependsOn": [
      {
        "containerName": "postgres",
        "condition": "HEALTHY"
      },
      {
        "containerName": "minio",
        "condition": "HEALTHY"
      },
      {
        "containerName": "redis",
        "condition": "HEALTHY"
      },
      {
        "containerName": "clickhouse",
        "condition": "HEALTHY"
      }
    ]
  },
  {
    "name": "clickhouse",
    "image": "docker.io/clickhouse/clickhouse-server",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8123,
        "hostPort": 8123
      },
      {
        "containerPort": 9000,
        "hostPort": 9000
      }
    ],
    "environment": [
      {
        "name": "CLICKHOUSE_DB",
        "value": "default"
      },
      {
        "name": "CLICKHOUSE_USER",
        "value": "clickhouse"
      },
      {
        "name": "CLICKHOUSE_PASSWORD",
        "value": "clickhouse"
      }
    ],
    "healthcheck": {
      "command": [
        "CMD-SHELL",
        "wget --no-verbose --tries=1 --spider http://localhost:8123/ping || exit 1"
      ],
      "interval": 5,
      "timeout": 5,
      "retries": 10,
      "startPeriod": 1
    },
    "mountPoints": [
      {
        "sourceVolume": "langfuse_clickhouse_data",
        "containerPath": "/var/lib/clickhouse"
      },
      {
        "sourceVolume": "langfuse_clickhouse_logs",
        "containerPath": "/var/log/clickhouse-server"
      }
    ]
  },
  {
    "name": "minio",
    "image": "docker.io/minio/minio",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 9000,
        "hostPort": 9090
      },
      {
        "containerPort": 9001,
        "hostPort": 9091
      }
    ],
    "environment": [
      {
        "name": "MINIO_ROOT_USER",
        "value": "minio"
      },
      {
        "name": "MINIO_ROOT_PASSWORD",
        "value": "miniosecret"
      }
    ],
    "healthcheck": {
      "command": [
        "CMD",
        "mc",
        "ready",
        "local"
      ],
      "interval": 1,
      "timeout": 5,
      "retries": 5,
      "startPeriod": 1
    },
    "mountPoints": [
      {
        "sourceVolume": "langfuse_minio_data",
        "containerPath": "/data"
      }
    ]
  },
  {
    "name": "redis",
    "image": "docker.io/redis:7",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 6379,
        "hostPort": 6379
      }
    ],
    "environment": [
      {
        "name": "REDIS_AUTH",
        "value": "myredissecret"
      }
    ],
    "healthcheck": {
      "command": [
        "CMD",
        "redis-cli",
        "ping"
      ],
      "interval": 3,
      "timeout": 10,
      "retries": 10
    }
  },
  {
    "name": "postgres",
    "image": "docker.io/postgres:17",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 5432,
        "hostPort": 5432
      }
    ],
    "environment": [
      {
        "name": "POSTGRES_USER",
        "value": "postgres"
      },
      {
        "name": "POSTGRES_PASSWORD",
        "value": "postgres"
      },
      {
        "name": "POSTGRES_DB",
        "value": "postgres"
      },
      {
        "name": "TZ",
        "value": "UTC"
      },
      {
        "name": "PGTZ",
        "value": "UTC"
      }
    ],
    "healthcheck": {
      "command": [
        "CMD-SHELL",
        "pg_isready -U postgres"
      ],
      "interval": 3,
      "timeout": 3,
      "retries": 10
    },
    "mountPoints": [
      {
        "sourceVolume": "langfuse_postgres_data",
        "containerPath": "/var/lib/postgresql/data"
      }
    ]
  }
]