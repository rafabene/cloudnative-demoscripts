FROM jenkins/jenkins:2.263
EXPOSE 50000
EXPOSE 8080
ENV JAVA_OPTS=-Dio.jenkins.plugins.kubernetes.disableNoDelayProvisioning=true -Djenkins.install.runSetupWizard=false -Dhudson.footerURL=http://cloudnative.oracle.com/

# Distributed Builds plugins
RUN jenkins-plugin-cli --plugins ssh-slaves kubernetes workflow-aggregator pollscm github-pullrequest block-queued-job blueocean 

# Overwrite Jenkins configuration
ADD --chown=jenkins:jenkins config.xml /var/jenkins_home/

# Overwrite Jenkins configuration
ADD --chown=jenkins:jenkins jobs /var/jenkins_home/jobs
