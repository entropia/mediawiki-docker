FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:194e564deb96f487eeab78a256e854c0d25145b9d1577b8b23d3138ce0890fae AS extension-base

FROM mediawiki:1.43.9-fpm-alpine@sha256:941f2e3fd1877ad6b456fd11691934b34210145f33a0f8560c01f20b6b1dd930

COPY --from=extension-base --chown=www-data:www-data --chmod=0640 extensions /var/www/html/extensions
COPY --from=extension-base --chown=www-data:www-data --chmod=0640 skins /var/www/html/skins
COPY --from=extension-base --chown=www-data:www-data --chmod=0640 vendor /var/www/html/vendor
