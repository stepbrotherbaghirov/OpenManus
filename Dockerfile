FROM python:3.12-slim

WORKDIR /app

# До:
RUN uv pip install -r requirements.txt

# После:
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "${PORT:-8000}"]
