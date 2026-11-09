FROM ghcr.io/entropia/mediawiki-extension-bundle-base:REL1_47 AS extension-base

FROM mediawiki:1.47

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
