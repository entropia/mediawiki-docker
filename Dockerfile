FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:5a4e670664c79509935bb94f0b5d7f8338f239ce9468256860a1607171c811c7 AS extension-base

FROM mediawiki:1.43.11@sha256:324da5c8abe249bf7229ca6a4e0e689fab06b028eaa9f3a3820cce375611cf83

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
