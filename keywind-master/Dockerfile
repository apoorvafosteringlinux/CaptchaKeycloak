FROM quay.io/keycloak/keycloak:latest as builder
WORKDIR /opt/keycloak
# NOTE: If you are using a version of Keycloak prior to 23 you must use 
# the retrocompat-*.jar. Look inside your target directory there is two jars file
# one *.jar and the other retrocompat-*.jar
COPY ./out/keywind.jar /opt/keycloak/providers/
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:23.0.7
COPY --from=builder /opt/keycloak/ /opt/keycloak/
ENV KC_HOSTNAME=localhost
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
