FROM python:3.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    curl \
    gcc \
    build-essential \
    python3-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt

CMD ["python3", "main.py"]



