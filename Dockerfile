FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:79b6219d50379cd6fe9a315406e4878e74a69480063fae607722f6c6915188f2 AS extension-base

FROM mediawiki:1.43.11@sha256:491be985fd966e97b7df2d2dbd1bb005fa5e26924693de22fc4c8e52c536357c

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
