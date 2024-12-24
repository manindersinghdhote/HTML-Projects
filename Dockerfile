# Use the latest NGINX image as the base
FROM nginx:latest

# Copy the HTML and CSS files to the NGINX HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 for the web server
EXPOSE 80
