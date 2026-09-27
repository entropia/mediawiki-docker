FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:194e564deb96f487eeab78a256e854c0d25145b9d1577b8b23d3138ce0890fae AS extension-base

FROM mediawiki:1.43.9-fpm-alpine@sha256:ee5f6eba02eebd4d1dbdf2f425ca551e3250febf337ee50c73f03b33fa875aee

COPY --from=extension-base --chown=www-data:www-data --chmod=0640 extensions /var/www/html/extensions
COPY --from=extension-base --chown=www-data:www-data --chmod=0640 skins /var/www/html/skins
COPY --from=extension-base --chown=www-data:www-data --chmod=0640 vendor /var/www/html/vendor
