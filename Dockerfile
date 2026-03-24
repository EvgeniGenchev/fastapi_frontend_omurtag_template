FROM alpine:latest

RUN apk add --no-cache python3 uv

WORKDIR /app

COPY pyproject.toml uv.lock* ./
RUN uv sync --no-dev

COPY . .

EXPOSE 8000

CMD ["uv", "run", "sh", "run.sh"]
