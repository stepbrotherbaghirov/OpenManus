FROM python:3.12-slim

WORKDIR /app

RUN curl -LsSf https://astral.sh/uv/install.sh  | sh
RUN uv pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "${PORT:-8000}"]
