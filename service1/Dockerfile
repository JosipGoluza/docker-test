FROM ghcr.io/openfaas/classic-watchdog:0.3.4 as watchdog

FROM python:3.12

WORKDIR /service1/app

RUN groupadd -r myuser && useradd -r -g myuser myuser

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

USER myuser

ENV fprocess="python entrypoint.py"
COPY entrypoint.py .

EXPOSE 8080
CMD [ "fwatchdog" ]