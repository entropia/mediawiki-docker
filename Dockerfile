FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:50d5b0907d72c1811cc5fd5551b92e820d45b0e10564babab891d9985f9167e8  AS extension-base

FROM mediawiki:1.43.11@sha256:6b24a06db8d66f4fc8dd0f664375cc9d03a556b521c79fce1474e45225580548

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
