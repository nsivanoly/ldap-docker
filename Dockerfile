FROM osixia/openldap:latest

# Copy schema and LDIFs into container
COPY ldap-confs/wso2Person.schema /etc/ldap/schema/
COPY ldap-confs/sldap.conf /tmp/openldapldif/
COPY ldap-confs/scimperson.ldif /tmp/openldapldif/
COPY ldap-confs/cn={3}wso2person.ldif /tmp/openldapldif/
COPY ldap-confs/identityperson.ldif /tmp/openldapldif/
COPY ldap-confs/employees_and_groups-example.org.ldif /tmp/openldapldif/

# Copy entrypoint script
COPY ldap-confs/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
