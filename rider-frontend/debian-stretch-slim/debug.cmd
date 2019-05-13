for /F %%A in ('docker ps -a ^| find "rider-frontend-debian"') do (docker stop %%A && docker rm %%A)
docker build -t rider-frontend-debian -m 6GB .
docker run -dit --name rider-frontend-debian --memory 6GB rider-frontend-debian
docker attach rider-frontend-debian