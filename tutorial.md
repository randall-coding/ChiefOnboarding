# Self host a company onboarding server

## ChiefOnBoarding
Want to onboard employees on your own servers but don't want to code everything from scratch?  In this tutorial, we will be doing just that with [ChiefOnboarding](https://chiefonboarding.com).  ChiefOnboarding is a free and open source employee onboarding platform. You can onboard new hires through Slack or the dashboard.  Other server features include automatically provisioning user accounts, triggering webhooks, pre-boarding, email notifications, and [more](https://github.com/chiefonboarding/ChiefOnboarding#features).

Email notifications include: 
  - Sending an email to new hire with login credentials
  - Sending an email to new hire with updates
  - Sending an email to new hire when tasks are overdue

![onboarding_dashboard](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/187dba13-b641-4cfd-9440-fd56944de9be)

To deploy this server we will be using a pre-made Acorn image.

## What is Acorn? 
Acorn is a new cloud platform that allows you to easily deploy, develop and manage web services with containerization.  A single acorn image can deploy all that you need: from a single container webserver, to a multi service Kubernetes cluster with high availability.  Don't worry if you don't understand what all those terms mean; we don't have to know that in order to deploy our server.

## Setup Acorn Account
Setup an acorn account at [acorn.io](https://acorn.io).  This can be a free account for your first deployment, and if you'd like additional storage space you can look into the pro account or enterprise.  You will need a Github account to signup as shown in the image below.

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
 * **email_host** (optional) - SMTP host url (ex smtp.chiefonboarding.com) 
 * **email_port** (optional) - SMTP port number 
 * **email_host_user** (optional) - SMTP username 
 * **email_host_password** (optional) - SMTP password 

Create secrets for your application using acorn-cli.  Change the dummy <> values to your actual credentials.
```
acorn secrets create \
  --data secret_key=<your encryption key> \
  --data default_email=<your email> \
  --data email_host=<email host or blank> \
  --data email_port=<port or blank> \
  --data email_host_user=<your user or blank> \
  --data email_host_password=<your password or blank> \
   chief-onboarding
```

## Deploying Acorn
Now that we have our secret file we can deploy our server from a pre-made image with just a few clicks.

On the acorn.io dashboard, click "Deploy Acorn" and select "From Acorn Image".

![deploy_acorn](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/822ad8ba-574a-4aea-86e3-33ab94a63d4d)

Fill in the following fields:
- Name: `<any name you like>`
- Acorn Image: `ghcr.io/randall-coding/acorn/chief-onboarding`


Visit the acorn dashboard and find your recent deployment.  Click on the name of your deployment and find the endpoint section in the right panel.  Click "copy" on the `web` endpoint and visit the link.

![onboarding_endpoint](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/d073913d-a77f-4a48-9d9a-f89c8f80a129)

Visiting the endpoint should show a screen like this:

![first_page_onboarding](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/53379149-8f8f-4ce0-873e-7e7e9a8d19d5)

## Setup ChiefOnboarding
- First we create the admin account
  -  Fill in the form on the first page
- Next we are redirected to the login page.  Please login

   ![login_onboarding](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/801b372d-b9bc-4cb2-8363-3f211e74056f)

- Add new hire
  - Visit the New Hires dashboard page
  - Click "+Add" button
  - Fill in the new hire form

![people_new_hires_onboarding](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/f6bc9094-e64a-4866-b06d-48422dbf0f81)![add_btn_onboarding](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/b7ec4547-f039-40b8-922d-54d2c190fcbb)

- Add new tasks
  - Visit the Tasks dashboard page
  - Click "+Add" button
  - Fill in the new task form

![all_tasks_onboarding](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/57c65820-0519-4d00-8547-ad1e4231a445)![add_btn_onboarding](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/b7ec4547-f039-40b8-922d-54d2c190fcbb)

- Set up email integration (see SMTP Setup below)
- Set email settings in Settings > General

![email_settings_onboarding](https://github.com/randall-coding/ChiefOnboarding/assets/39175191/ec5d6b32-a555-4c71-9c83-6b92bea98e33)

### SMTP Setup
To setup your email integrtion for ChiefOnboarding, make sure you add all the optional email values in your secret file (see instructions [above](/tutorial.md#setup-server)).  For more information see the email setup [documentation](https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md#email).

## Conclusion
That's it!  It's just that easy to get up and running with your own onboarding server.  

## References
* [Set up email docs](https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md#email)
* [Deployment docs](https://github.com/chiefonboarding/ChiefOnboarding/blob/master/docs/Deployment.md)
* [Acorn docs](https://docs.acorn.io/)
