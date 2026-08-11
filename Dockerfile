FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:194e564deb96f487eeab78a256e854c0d25145b9d1577b8b23d3138ce0890fae AS extension-base

FROM mediawiki:1.46.0-fpm-alpine@sha256:b0e9413c015268322cfb67908e5f92121372c7407f09f97a4ce8938a4351e4ad

COPY --from=extension-base --chown=www-data:www-data --chmod=0640 extensions /var/www/html/extensions
COPY --from=extension-base --chown=www-data:www-data --chmod=0640 skins /var/www/html/skins
COPY --from=extension-base --chown=www-data:www-data --chmod=0640 vendor /var/www/html/vendor
