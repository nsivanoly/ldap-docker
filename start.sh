#!/bin/bash

chmod +x ./stop.sh && ./stop.sh
# docker-compose up -d
docker-compose up --build -d
