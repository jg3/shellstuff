FROM nginx:alpine
RUN mkdir /opt/www /opt/www/images /home/pi
RUN ln -s /opt/www/images /home/pi/timelapse
COPY static-html/* /opt/www/
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
# add in imgcat
#RUN curl -o /usr/local/bin/imgcat -O https://iterm2.com/utilities/imgcat \
#    && chmod +x /usr/local/bin/imgcat
EXPOSE 80
