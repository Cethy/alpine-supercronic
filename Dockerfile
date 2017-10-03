FROM alpine:3.6

ENV SUPERCRONIC_VERSION="v0.1.3" \
    SUPERCRONIC_PACKAGE=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=96960ba3207756bb01e6892c978264e5362e117e

ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/$SUPERCRONIC_VERSION/$SUPERCRONIC_PACKAGE

# install dependencies
RUN apk add --update --no-cache ca-certificates curl \
# install supercronic
    && curl -fsSLO "$SUPERCRONIC_URL" \
    && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC_PACKAGE}" | sha1sum -c - \
    && chmod +x "${SUPERCRONIC_PACKAGE}" \
    && mv "${SUPERCRONIC_PACKAGE}" "/bin/${SUPERCRONIC_PACKAGE}" \
    && ln -s "/bin/${SUPERCRONIC_PACKAGE}" /bin/supercronic \
# remove unwanted deps & cleanup
    && apk del --purge ca-certificates curl \
    && rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["supercronic"]
CMD ["/etc/crontabs/crontab"]
