ARG OS=alpine

# Download and extract Dalamud
FROM alpine:3.18 AS builder
ARG DALAMUD_BRANCH=latest
WORKDIR /build
RUN apk add --no-cache wget unzip \
    && wget -O dalamud.zip https://goatcorp.github.io/dalamud-distrib/${DALAMUD_BRANCH}.zip \
    && unzip dalamud.zip -d dalamud


# Build the final image
FROM mcr.microsoft.com/dotnet/sdk:7.0-${OS}
ENV DALAMUD_HOME=/usr/lib/dalamud
COPY --from=builder /build/dalamud/ ${DALAMUD_HOME}/