# Docker 101

Build image for development
```
docker build . -t docker-101-dev --target dev
```

Runing development container (bash emulator)
```
docker run -it -v ~/Documents/code/docker-101/:/docker-101 docker-101-dev bash
```

Build image for production
```
docker build . -t docker-101-prod --target production
```

Runing production container
```
docker run docker-101-prod
```

### Development using Docker Compose

Build image for development
```
docker-compose build app
```

Runing development container (bash emulator)
```
docker-compose run app bash
```

Runing development container (other command)
```
docker-compose run app ruby test_ruby.rb
```
