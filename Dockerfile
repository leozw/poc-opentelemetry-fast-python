# Use uma imagem base do Python para o FastAPI
FROM python:3.8

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o arquivo de dependências e instale-as
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copie o restante dos arquivos da aplicação para o container
COPY . .

# ENV OTEL_SERVICE_NAME=fast-app-dev
# ENV OTEL_TRACES_EXPORTER=otlp
# ENV OTEL_METRICS_EXPORTER=otlp
# ENV OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=opentelemetrycollector.default.svc.cluster.local:4317
# ENV OTEL_EXPORTER_OTLP_METRICS_ENDPOINT=opentelemetrycollector.default.svc.cluster.local:4317
# ENV OTEL_EXPORTER_OTLP_TRACES_INSECURE=true
# ENV OTEL_EXPORTER_OTLP_METRICS_INSECURE=true

# A porta em que o FastAPI estará disponível
EXPOSE 8000

# Comando para executar a aplicação
CMD ["opentelemetry-instrument", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
