FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:194e564deb96f487eeab78a256e854c0d25145b9d1577b8b23d3138ce0890fae AS extension-base

FROM mediawiki:1.43.11-fpm-alpine@sha256:67f3ba8a36613b98c14129b686e294ea5ae77761e27bae3b717f5211a17881b0

COPY --from=extension-base --chown=www-data:www-data --chmod=0640 extensions /var/www/html/extensions
COPY --from=extension-base --chown=www-data:www-data --chmod=0640 skins /var/www/html/skins
COPY --from=extension-base --chown=www-data:www-data --chmod=0640 vendor /var/www/html/vendor
