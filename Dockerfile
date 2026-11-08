FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:976801f4c9f023d8b9366e1ede1fcfcb53584b15faebc53c83771d1d7e6561f6 AS extension-base

FROM mediawiki:1.43.11@sha256:324da5c8abe249bf7229ca6a4e0e689fab06b028eaa9f3a3820cce375611cf83

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
