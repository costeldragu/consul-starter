vagrant up

install the web agent on each web node

consul agent -advertise $ip -config-file /vagrant/common.json &

killall consul
ip=$(ifconfig eth1 | grep 'inet addr' | awk '{ print substr($2,6) }')
consul agent -advertise $ip -config-file /vagrant/common.json -config-file /vagrant/web.services.json &

consul agent -dev -advertise 172.20.20.31 -bind 0.0.0.0 &


#local agent
consul agent -config-file desk.consul.json

dig @localhost -p 8600 web.service.consul SRV