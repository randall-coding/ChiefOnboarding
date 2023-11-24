# Self host a pre-made company onboarding server

## ChiefOnBoarding
Do you want to onboard employees on your own servers but don't want to code everything from scratch?  In this tutorial, we will be doing just that today with [ChiefOnboarding](https://chiefonboarding.com).  ChiefOnboarding is a  a free and open source employee onboarding platform. You can onboarding new hires through Slack or the dashboard.

Other server features include automatically provisioning user accounts, triggering webhooks, pre-boarding, email notifications, and more.  

Email notifications include: 
  - Sending an email to new hire with login credentials
  - Sending an email to new hire with updates
  - Sending an email to new hire when tasks are overdue

[Click here](https://github.com/chiefonboarding/ChiefOnboarding#features) for a more complete list of features.

!!!onboarding_dashboard.png 

## What is Acorn? 
Acorn is a new cloud platform that allows you to easily deploy, develop and manage web services with containerization.  A single acorn image can deploy all that you need: from a single container webserver, to a multi service Kubernetes cluster with high availability.  Don't worry if you don't understand what all those terms mean; we don't have to know that in order to deploy our server.

## Setup Acorn Account
Setup an acorn account at [acorn.io](https://acorn.io).  This can be a free account for your first deployment, and if you'd like additional storate space you can look into the pro account or enterprise.  You will need a Github account to signup as shown in the image below.

![signin_acorn](https://github.com/randall-coding/opensupports-docker/assets/39175191/d46815fb-d2d5-42cd-b93d-41ca541a63bd)

## Install acorn cli 
First we need to install acorn-cli locally.  Choose an install method from the list below:

**Linux or Mac** <br>
`curl https://get.acorn.io | sh`

**Homebrew (Linux or Mac)** <br>
`brew install acorn-io/cli/acorn`

**Windows** <br> 
Uncompress and move the [binary](https://cdn.acrn.io/cli/default_windows_amd64_v1/acorn.exe) to your PATH

**Windows (Scoop)** <br>
`scoop install acorn`

For up to date installation instructions, visit the [official docs](https://runtime-docs.acorn.io/installation/installing).

## Login with cli
Back in our local command terminal login to acorn.io with: <br>
`acorn login acorn.io` 

## Setup Server
The server has several basic settings controlled by a secret object.  
 * **secret_key** - encryption key (string) used for your app
 * **default_email** - default email used by your mailer
 * **email_host**(optional) - SMTP host url (ex smtp.chiefonboarding.com) 
 * **email_port**(optional) - SMTP port number 
 * **email_host_user**(optional) - SMTP username 
 * **email_host_password**(optional) - SMTP password 

Create secrets for your application using acorn-cli.  Change the dummy <> values to your actual credentials.
```
acorn secrets create \
  --data secret_key=<your encryption key> \
  --data default_email=<your email> \
  --data email_host=<email host> \
  --data email_port=<port> \
  --data email_host_user=<your user> \
  --data email_host_password=<your password> \
   chief-onboarding
```

## Deploying Acorn
Now that we have our secret file we can deploy our server from a pre-made image with just a few clicks.

On the acorn.io dashboard, click "Deploy Acorn" and select "From Acorn Image".

Fill in the following fields:

- Name: `<any name you like>`
- Acorn Image: `ghcr.io/randall-coding/acorn/chief-onboarding`

!! new deploy image

Visit the acorn dashboard and find your recent deployment.  Click on the name of your deployment and find the endpoint section in the right panel.  Click "copy" on the `web` endpoint and visit the link.

!! endpoint image

Visiting the endpoint should show a screen like this:

!! initial page

## Setup ChiefOnBoarding
- First we create the admin account
- Next we login
- Add new hire
  - Click "+Add" button on the New hires page
  - Fill in the new hire form
- Add new tasks
  - Click "+Add" button on the Tasks page
  - Fill in the new task form
- Set up email integration (see SMTP Setup)

### SMTP Setup
To setup your email integrtion for ChiefOnboarding, make sure you add all the optional email values in your secret file.  For more information see the email setup [documentation](https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md#email).

## Conclusion
That's it!  It's just that easy to get up and running with your own onboarding server.  

# References
[Set up email](https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md#email)
[Deployment docs](https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md)
[Acorn docs](https://docs.acorn.io/)