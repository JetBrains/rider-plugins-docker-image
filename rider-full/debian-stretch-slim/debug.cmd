for /F %%A in ('docker ps -a ^| find "rider-full-debian"') do (docker stop %%A && docker rm %%A)
docker build -t rider-full-debian -m 4GB .
docker run -dit --name rider-full-debian --memory 4GB rider-full-debian
docker attach rider-full-debian