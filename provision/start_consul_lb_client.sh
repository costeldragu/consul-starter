#!/usr/bin/env bash


ip=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2,6) }')
consul agent -advertise $ip -config-file /vagrant/common.json -config-file /vagrant/lb.service.json &
