# kitchenmate_test_app

## How run the project via docker-compose

1. Create the external volume  
```bash
docker volume create --name=kitchenmate_gems
```
2. Build the image  
```bash
docker-compose build
```
3. Run containers  
```bash
docker-compose up
```
4. Create DBs  
```bash
docker-compose exec app bundle exec rails db:setup
```
5. Run migrations
```bash
docker-compose exec app bundle exec rails db:migrate
```
6. Create 10 products
```bash
docker-compose exec app bundle exec rails db:seed
```