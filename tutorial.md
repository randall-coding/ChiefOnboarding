# Self host a pre-made company on boarding server


## ChiefOnBoarding
- Emails 
  - Send email to new hire with login credentials
  - Send email to new hire with updates
  - Send email to new hire when tasks are overdue

## OrangeHRM
[OrangeHRM](https://www.orangehrm.com/) is a comprehensive HRM system that captures all the essential functionalities required for any enterprise: employee management, HR administration, reporting, performance, career development, training, recruitment, onboarding, payroll and more.

OrangeHRM is open source with optional paid services, and no matter what tier you are on this is an impressive product.  The user interface is gorgeous and easy to use while also being feature rich. The best part is this server can be setup in minutes using a pre-made acorn image.

![orange_dashboard](https://github.com/randall-coding/orangehrm/assets/39175191/322fc65b-f6c0-4238-86f5-3c74537f6a4e)

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
 * **mysql_password** - database password
 
Create secrets for your application using acorn-cli.  Change the <> values to your actual credentials.
```
acorn secret create \
 --data mysql_password=<password> \
   opensupports
```

## Deploying Acorn
Now that we have our secret file we can deploy our server from a pre-made image with just a click.

On the acorn.io dashboard, click "Deploy Acorn" and select "From Acorn Image".

Fill in the following fields:

- Name: `<any name you like>`
- Acorn Image: `ghcr.io/randall-coding/acorn/orangehrm`

![orange_new_deploy](https://github.com/randall-coding/orangehrm/assets/39175191/833b7de5-f9ab-4b44-af67-73bc19035947)

Visit the acorn dashboard and find your recent deployment.  Click on the name of your deployment and find the endpoint section in the right panel.  Click "copy" on the website endpoint and visit the link.

![endpoint](https://github.com/randall-coding/orangehrm/assets/39175191/15e37f0c-2dda-42cd-9e01-362d959e65d5)

Visiting the endpoint should show a screen like this:

![orange_install_step1](https://github.com/randall-coding/orangehrm/assets/39175191/19de76e5-0610-4994-9f0d-5efeab61ad6c)

## Setup ChiefOnBoarding
- first we create the admin account
- next we login
- add new hire
- add new tasks
- where is email integration?  It says it sends emails in settings.. 
  -> see Deployment.md   https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md#email

SMTP Setup
EMAIL_HOST=smtp.chiefonboarding.com
EMAIL_PORT=587
EMAIL_HOST_USER=exampleuser
EMAIL_HOST_PASSWORD=examplePass
EMAIL_USE_TLS=False
EMAIL_USE_SSL=True

# References
[Set up email](https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md#email)
[Deployment docs](https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md)