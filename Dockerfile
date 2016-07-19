FROM python:2

RUN pip install --no-cache-dir \
		thumbor==6.1.1

EXPOSE 8888
CMD ["thumbor"]
