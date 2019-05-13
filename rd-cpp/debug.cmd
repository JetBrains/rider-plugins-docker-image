set REPO=ivanpashchenko
set IMAGE=rd-cpp
set RAM=2GB
for /F %%A in ('docker ps -a ^| find "%IMAGE%"') do (docker stop %%A && docker rm %%A)
docker build -t %REPO%/%IMAGE% -m %RAM% .
docker run -dit --name %IMAGE% --memory %RAM% %IMAGE%
docker attach %IMAGE%