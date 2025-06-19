FROM python:3.10

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    curl \
    gcc \
    build-essential \
    python3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN python3 -m pip install --upgrade pip setuptools wheel --break-system-packages && \
    python3 -m pip install -r requirements.txt --break-system-packages

CMD ["python3", "bot.py"]





