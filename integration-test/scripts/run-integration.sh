docker-compose up -d
echo "waiting for db to be ready"
./scripts/wait-for-it.sh "postgresql://postgres:mysecretpassword@localhost:5432/postgres" -- echo "DB ready"
npx prisma migrate dev --name init
npx prisma generate
npm run test
docker-compose down
