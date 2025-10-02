FROM ghcr.io/openfaas/classic-watchdog:0.3.4 AS watchdog

FROM python:3.12-alpine

WORKDIR /service2/app

RUN addgroup -S myuser && adduser -S -G myuser myuser

# TODO promijeniti u requirements.txt (dodati cache?)
RUN pip install requests

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

USER myuser

ENV fprocess="python entrypoint.py"
COPY entrypoint.py .

EXPOSE 8080
CMD [ "fwatchdog" ]