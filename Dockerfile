FROM python:3.10-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ffmpeg \
    curl \
    git \
    gcc \
    python3-dev \
    build-essential \
    && apt-get clean

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

CMD ["python3", "main.py"]


