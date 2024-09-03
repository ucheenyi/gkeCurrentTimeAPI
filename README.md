Steps To run and test the api Locally:
1. Install docker, see link below for installing docker:
   
     https://docs.docker.com/engine/install
3. Run the docker command below in your terminal to launch the api-app as a docker container using my custom dockerhub image(ucheenyi/current-time-api):

   docker run --name current-time-app -d -p 80:8080 ucheenyi/current-time-api 
  ** Note: The container runs on Port 8080**
4. Test the app by running the curl command below in your terminal:
   
     curl -vk http://localhost:80/time
6. You can also test the app in your browser by visiting http://localhost:80/time or http://127.0.0.1:80/time or http://<ServerPublicIP>:80/time
   
    ** Note: <ServerPublicIP> is the Public IP of your server/local server**
