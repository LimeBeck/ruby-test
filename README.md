# README

## Разработка

Для локальной разработки - запустите тестовое окружение:
```bash
cd docker/test_env
docker-compose up
```

Установите зависимости:
```bash
bundler install
```

Для запуска сервера:
```bash
rails server
```

## Запуск a-la production

```
cd docker/run
docker-compose up
```