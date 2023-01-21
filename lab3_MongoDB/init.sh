docker-compose exec configsvr1 sh -c 'mongo < /scripts/init_config_server.js'

docker-compose exec shard1-a sh -c 'mongo < /scripts/init-shard1.js'
docker-compose exec shard2-a sh -c 'mongo < /scripts/init-shard2.js'
docker-compose exec shard3-a sh -c 'mongo < /scripts/init-shard3.js'