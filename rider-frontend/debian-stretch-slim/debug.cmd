for /F %%A in ('docker ps -a ^| find "rider-frontend-debian"') do (docker stop %%A && docker rm %%A)
docker build -t rider-frontend-debian -m 4GB .
docker run -dit --name rider-frontend-debian --memory 4GB rider-frontend-debian
docker attach rider-frontend-debian