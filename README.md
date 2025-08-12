# LDAP Server with Docker Compose

![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)
![OpenLDAP](https://img.shields.io/badge/OpenLDAP-2CA5E0?style=for-the-badge&logo=openldap&logoColor=white)

This project provides a complete Docker-based OpenLDAP server with phpLDAPadmin web interface, pre-configured with organizational units, groups, and sample users for integration with WSO2 Identity Server.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [Configuration](#configuration)
- [Accessing the Services](#accessing-the-services)
- [User and Group Management](#user-and-group-management)
- [Integration with WSO2 IS](#integration-with-wso2-is)
- [References](#references)

## Features

- 🐳 Dockerized OpenLDAP 2.4.57
- 🌐 phpLDAPadmin web interface
- 🔄 Automatic schema loading at startup
- 👥 Pre-configured organizational structure:
  - Employees OU with sample users
  - Groups OU with sample groups
- 🔒 Secure admin access
- ⚙️ Ready for WSO2 Identity Server integration

## Prerequisites

- Docker Engine 20.10+
- Docker Compose 2.0+
- 2GB RAM available
- 1GB disk space

## Quick Start

1. Clone the repository
   ```bash
   git clone https://github.com/nsivanoly/ldap-docker.git
   cd ldap-docker
   ```
2. Make the scripts executable:
   ```bash
   chmod +x start.sh stop.sh
   ```
3. Start the services:
   ```bash
   ./start.sh
   ```
4. Access phpLDAPadmin at `http://localhost:8082`

5. Stop services
   ```bash
   ./stop.sh
   ```

## Project Structure

```
.
├── docker-compose.yml          # Main Docker configuration
├── Dockerfile                  # Custom OpenLDAP image
├── start.sh                    # Startup script
├── stop.sh                     # Shutdown script
├── ldap-confs/                 # LDAP configuration files
│   ├── wso2Person.schema       # Custom WSO2 schema
│   ├── sldap.conf              # LDAP server config
│   ├── scimperson.ldif         # SCIM schema extension
│   ├── cn={3}wso2person.ldif   # WSO2 person schema
│   ├── identityperson.ldif     # Identity person schema
│   └── employees_and_groups-example.org.ldif # Sample data
└── README.md                   # This documentation
```

## Configuration

### Port Mapping
| Service        | Container Port | Host Port |
|----------------|----------------|-----------|
| OpenLDAP       | 389            | 10389     |
| OpenLDAP (SSL) | 636            | 10636     |
| phpLDAPadmin   | 80             | 8082      |

### Environment Variables
| Variable               | Default Value    | Description                     |
|------------------------|------------------|---------------------------------|
| LDAP_ORGANISATION      | "sampleOrg"      | Organization name               |
| LDAP_DOMAIN            | "example.org"    | Base domain                     |
| LDAP_ADMIN_PASSWORD    | "admin"          | Admin password                  |

## Accessing the Services

### phpLDAPadmin Web Interface
- URL: `http://localhost:8082`
- Login DN: `cn=admin,dc=example,dc=org`
- Password: `admin`

### Command Line Access
```bash
ldapsearch -x -H ldap://localhost:10389 -b "dc=example,dc=org" -D "cn=admin,dc=example,dc=org" -w admin
```

## User and Group Management

### Pre-loaded Data

#### Organizational Units
- `ou=employees,dc=example,dc=org`
- `ou=Groups,dc=example,dc=org`

#### Sample Groups
| Group Name | Members               | Description           |
|------------|-----------------------|-----------------------|
| developers | alice, charlie        | Development Team      |
| hr         | bob, ahmed, muhammad  | Human Resources Team  |

#### Sample Users
| Username | Name          | Email                  | Password  |
|----------|---------------|------------------------|-----------|
| alice    | Alice Smith   | alice@example.org      | Test@123  |
| bob      | Bob Johnson   | bob@example.org        | Test@123  |
| charlie  | Charlie Brown | charlie@example.org    | Test@123  |
| ahmed    | Ahmed Mallah   | ahmed@example.org      | Test@123  |
| muhammad | Muhammad Ali  | muhammad@example.org   | Test@123  |

## Integration with WSO2 IS

### Configurations
Sampel configurations
- [Read only LDAP](configurations/LDAP-Read-Only.xml)
- [Read Write LDAP](configurations/LDAP-Read-Write.xml)


## References
1. [OpenLDAP Official Documentation](https://www.openldap.org/doc/)
2. [WSO2 Identity Server Documentation](https://is.docs.wso2.com/)
3. [LDAP Schema Extension Guide](https://rami-desilva.medium.com/extend-intorgperson-in-openldap-2-4-5b19f8350f18)
4. [WSO2-LDAP Integration Guide](https://rami-desilva.medium.com/integrating-openldap-with-wso2-identity-server-and-mapping-users-and-groups-3e7505787e25)