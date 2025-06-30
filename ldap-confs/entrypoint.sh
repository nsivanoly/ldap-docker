#!/bin/sh

# Start OpenLDAP in background
/container/tool/run --copy-service &

# Wait for OpenLDAP to start
sleep 5

# Load custom schemas
ldapadd -Y EXTERNAL -H ldapi:// -f /tmp/openldapldif/cn={3}wso2person.ldif
ldapadd -Y EXTERNAL -H ldapi:// -f /tmp/openldapldif/scimperson.ldif
ldapadd -Y EXTERNAL -H ldapi:// -f /tmp/openldapldif/identityperson.ldif

# Load entries
ldapadd -Y EXTERNAL -H ldapi:// -f /tmp/openldapldif/employees_and_groups-example.org.ldif

# Keep container running
wait
