# Start mail server
docker run -d --name "govdemo_mail" jmorales/services-mail

# Start some switchyard servers per environment
docker run -d -p 19990:9990 -p 18080:8080 -h dev   -v /home/jboss/dev   --name "govdemo_sy_dev"   governance_demo/sy
docker run -d -p 19991:9990 -p 28080:8080 -h qa    -v /home/jboss/qa    --name "govdemo_sy_qa"    governance_demo/sy
docker run -d -p 19992:9990 -p 38080:8080 -h stage -v /home/jboss/stage --name "govdemo_sy_stage" governance_demo/sy

# Start nexus as the production environment
docker run -d -p 48080:8081 -h nexus --name "govdemo_nexus" jmorales/ci_nexus

# Start dtgov server
docker run -d -p 59990:9990 -p 8190:8080 -h dtgov --volumes-from="govdemo_sy_dev" --volumes-from="govdemo_sy_qa" --volumes-from="govdemo_sy_stage" --link govdemo_mail:mail --link govdemo_sy_dev:dev --link govdemo_sy_qa:qa --link govdemo_sy_stage:stage --link govdemo_nexus:nexus --name "govdemo_dtgov" governance_demo/dtgov

echo "DTGov running on http://localhost:59990/console -  Endpoint: http://localhost:8190/dtgov-ui"
echo "SwitchYard environments:"
echo " Dev:   http://localhost:19990/console  -  Endpoint: http://localhost:18080"
echo " Qa:    http://localhost:29990/console  -  Endpoint: http://localhost:28080"
echo " Stage: http://localhost:39990/console  -  Endpoint: http://localhost:38080"
echo " "
echo "Nexus: http://localhost:48080"
