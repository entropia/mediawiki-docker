FROM ghcr.io/entropia/mediawiki-extension-bundle-base:main@sha256:96c0ee2e870c62a2ed2613a46eaa2030618f64a2b2f558240e10ed2259466e7c AS extension-base

FROM mediawiki:1.43.11@sha256:6b24a06db8d66f4fc8dd0f664375cc9d03a556b521c79fce1474e45225580548

RUN a2enmod remoteip rewrite

COPY --from=extension-base extensions /var/www/html/extensions
COPY --from=extension-base skins /var/www/html/skins
COPY --from=extension-base vendor /var/www/html/vendor

RUN chown -R www-data:65534 . && chmod -R 0550 .
