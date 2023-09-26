FROM amazon/aws-lambda-python:3.8
# 람다에서 제공하는 이미지로 바꿔주면 더 간단합니다
ARG FUNCTION_DIR="/var/task/"
# 람다는 /var/task를 작업환경으로 사용합니다
COPY ./ ${FUNCTION_DIR}
# 똑같이 작업환경에 모든 코드를 복사해줍니다
RUN pip3 install flask
# 똑같이 플라스크를 설치합니다
RUN pip3 install zappa
# 자파도 설치해줍니다
# 자파의 핸들러를 작업환경으로 빼주어야 람다가 인식해줍니다
RUN ZAPPA_HANDLER_PATH=$( python -c "from zappa import handler; print (handler.__file__)" ) && echo $ZAPPA_HANDLER_PATH && cp $ZAPPA_HANDLER_PATH ${FUNCTION_DIR}
CMD [ "handler.lambda_handler" ]
# 플라스크 대신 이 핸들러를 실행해줍니다