#!/bin/bash

# docker build -f ./back/Dockerfile-dev -t ghcr.io/randall-coding/chief-onboarding ./back  && \
docker build -f ./back/Dockerfile -t ghcr.io/randall-coding/chief-onboarding .  && \
docker push ghcr.io/randall-coding/chief-onboarding && \

acorn build -t ghcr.io/randall-coding/acorn/chief-onboarding && \
acorn push ghcr.io/randall-coding/acorn/chief-onboarding && \

acorn run -n chief-onboarding  \
  -s chief-onboarding:chief-onboarding      \
  ghcr.io/randall-coding/acorn/chief-onboarding
