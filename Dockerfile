# syntax=docker/dockerfile:1.4

FROM alpine AS builder

ARG VERSION=dev
ENV VERSION=$VERSION

RUN --mount=type=ssh echo "App Version: $VERSION" > /index.html && \
    echo "Hostname: $(hostname)" >> /index.html && \
    echo "Server IP: $(hostname -i || echo unknown)" >> /index.html

FROM nginx:alpine

LABEL org.opencontainers.image.title="Lab 6 PAwChO"
LABEL org.opencontainers.image.description="Obraz Docker zbudowany z wykorzystaniem BuildKit, SSH i multi-stage"
LABEL org.opencontainers.image.version=$VERSION
LABEL org.opencontainers.image.source="https://github.com/zZo0mMeE/L6_PAwChO"

COPY --from=builder /index.html /usr/share/nginx/html/index.html

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost || exit 1

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
