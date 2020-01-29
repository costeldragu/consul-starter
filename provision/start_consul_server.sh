#!/usr/bin/env bash
ip=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2,6) }')
consul agent -dev -advertise $ip -bind 0.0.0.0 &