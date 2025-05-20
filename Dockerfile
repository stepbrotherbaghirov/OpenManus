FROM python:3.12-slim

WORKDIR /app

RUN pip install --no-cache-dir uvicorn

COPY . .

RUN pip install --system -r requirements.txt

EXPOSE 10000

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "10000"]
