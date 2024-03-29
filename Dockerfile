# Build stage
FROM public.ecr.aws/s5o5b4e6/images:maven3.8.4-jdk-11 as build
WORKDIR /app
COPY app /app
RUN mvn clean package

# Final image stage
FROM public.ecr.aws/s5o5b4e6/images:tomcat9.0-slim

# Copy the update script from the build stage
COPY --from=build /app/update.sh /update.sh
RUN chmod +x /update.sh

# Copy built war file to Tomcat
COPY --from=build /app/target/helloworld.war $CATALINA_HOME/webapps

# Expose port 8080
EXPOSE 8080

