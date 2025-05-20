FROM python:3.11-slim

WORKDIR /app

# Установка системных зависимостей
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \  # Для компиляции пакетов
    libjpeg-dev \     # Для pillow
    zlib1g-dev \      # Для pillow
    libpng-dev \      # Для pillow
    ffmpeg \          # Для видео
    libsm6 \          # Для некоторых библиотек
    libxext6 \        # Для некоторых библиотек
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Установка Python-зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Если используется playwright
RUN pip install playwright && playwright install

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "${PORT:-8000}"]
