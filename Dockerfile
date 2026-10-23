FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:d1dd23125fb0f7f0865647426133c37b8a6297794e430ecdf06352ef5f49165c AS extension-base

FROM mediawiki:1.43.11-fpm-alpine@sha256:67f3ba8a36613b98c14129b686e294ea5ae77761e27bae3b717f5211a17881b0

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
