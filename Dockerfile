FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    HF_HOME=/app/models

WORKDIR /app

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      ffmpeg \
      ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
 && pip install torch torchaudio --index-url https://download.pytorch.org/whl/cpu \
 && pip install kittenml soundfile
RUN mkdir -p /app/models /app/reference /app/output

# COPY ./reference.wav /app/reference/speaker.wav

RUN python -c "from kittenml import KittenTTS; KittenTTS('KittenML/kitten-tts-2')"

COPY . .

VOLUME [ "/app/output" ]

ENTRYPOINT [ "python", "tts", "prose.txt" ]
CMD []
