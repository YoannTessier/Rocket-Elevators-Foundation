<img align="center" src="http://www.rocketelevators-yt.com/assets/logo-transparent-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png"  alt="Logo" width="850" height="200">


# Rocket Elevators Information System #

<details>
<summary><i>CLICK TO EXPAND</i></summary>

This week converted our static website into a Ruby on Rails application.

The first step was to use the Assett Pipeline to provide the JS, CSS and HTML files needed to run the website. 

We implemented Embeded Ruby Syntax to the HTML code.

We created a database which contained multiple tables :

The employee table is used to assign permissions to access the Backoffice. It is also used to store e-mails and passwords of said employees.

If you want to access the Backoffice use these credentials:

- username: nicolas.genest@codeboxx.biz
- password: newdog1

</br>

![](2021-02-19-19-06-57.png)

</br>

The users table is used to store login information for employees. It also assigns an ID to each one in order to link the tables together.


![](2021-02-19-19-09-22.png)

</br>

In order to create a Backoffice, we first had to implement an authentication process. To achieve this, we used Gem Devise which took care of all the controllers necessary for user creation and user sessions. We then used RailsAdmin that provided us with a Backoffice interface for managing our data, such as the Employee table, the Users table and a Quote table which is used to store all the quote requests made on the website.


![](2021-02-19-19-31-26.png)

</br>

Here is a screenshot of what the list of quotes looks like :

![](2021-02-19-19-30-54.png)

</br>

We then deployed the website to AWS Ubuntu Server using Cloudflare to secure it.

</br>
</br>

The Backoffice was updated to include more data from Mysql as well as adding a Data Warehouse.

![](2021-02-26-17-48-58.png)

</br>

It is now possible to Query the database and show the results in a graph :

![](2021-02-26-17-52-10.png)

</br>

We can also group multiple Graphs at the same time using a Dashboard :

![](2021-02-26-17-53-32.png)

</br>

In order to link the two databases together and to keep them up to date, we had to create tasks :

![](2021-02-26-17-55-30.png)

</details>


# Rocket Elevators APIs #

<details>
<summary><i>CLICK TO EXPAND</i></summary>

**Use these credentials to access the back office:**

- Username: nicolas.genest@codeboxx.biz
- Password: newdog1
---------------------------------------------------------------------------------------------------------------
</br>

<u><b>This week we had to implement APIs to our Rocket Elevators Rails Applications:</u></b>

</br>

First we added the **Twilio** and **Slack** APIs which were pretty similar. We added this code to the *Elevator Model*:

![](2021-03-11-12-17-18.png)

</br>

Next we linked the *Quotes* and *Leads* controller to **Zendesk**:

![](2021-03-11-12-56-02.png)

![](2021-03-11-12-56-45.png)

</br>

Here is what the **Sendgrid** code looks like in the *Leads Controller*:

![](2021-03-11-12-59-13.png)

This is the email that the customer receives when he/she completes the *Contact Form*:

![](2021-03-11-13-06-02.png)

</br>

In order to have *Contact Form Attachment Files* sent to **Dropbox**,(Le login est cmoutlook17@gmail.com password: rocketelevators2021) here is what we added:

![](2021-03-11-13-15-36.png)

</br>

Next comes **IBM Watson Text-to-Speech**. We started by adding an audio player to *Rails Admin* in a new tab called Watson:

![](2021-03-11-13-26-19.png)

Then, we created a method that updates the audio file with Watson reading the text provided, here is the code:

![](2021-03-11-13-51-19.png)

See what the audio player looks like:

![](2021-03-11-13-54-10.png)

</br>

Finally, we implemented **Google Maps** in the *Back Office*. This is the code:

![](2021-03-12-11-08-22.png)

![](2021-03-12-11-09-12.png)

Here is what it looks like on the website:

![](2021-03-12-11-11-36.png)

## BONUS ##

</br>

We added a **Spotify Player** to the *Admin Page*:

![](2021-03-12-17-25-18.png)
![](2021-03-12-17-25-45.png)
![](2021-03-12-17-26-46.png)

</br>

Next, we added a new **Watson** to provide interesting facts about *Star Wars*:

![](2021-03-12-17-28-30.png)
![](2021-03-12-17-29-23.png)
![](2021-03-12-17-30-09.png)

</br>

Finally we tried to add **Weather** to *Google Maps* but this is as far as we got:

![](2021-03-12-22-28-09.png)
</details>

# Extented Data Warehouse #
<details>
<summary><i>CLICK TO EXPAND</i></summary>

<u><b>This week we had to extend our data warehouse with a table named Fact Intervention:</u></b>

![](fact_int.jpg)

</br>

Then we developed a rake task to generate random data into that table.

![](fact_int2.jpg)
</details>

# Rocket Elevators Foundations #

<details>
<summary><i>CLICK TO EXPAND</i></summary>

**Use these credentials to access the back office:**

- Username: nicolas.genest@codeboxx.biz
- Password: newdog1

**Links to other Repos:**

REST API: https://github.com/YoannTessier/Rocket-Elevators-Rest-API.git

GraphQL API: https://github.com/YoannTessier/GraphQL_Deployment.git

**Website URL:**

http://www.rocketelevators-yt.com/

**Zendesk URL:**

https://rocketelevators5995.zendesk.com/

**REST API Query Examples:**

```
https://rocket-elevators-yt.azurewebsites.net/api/interventions

https://rocket-elevators-yt.azurewebsites.net/api/interventions/1/InProgress

https://rocket-elevators-yt.azurewebsites.net/api/interventions/2/Completed
```
---------------------------------------------------------------------------------------------------------------

Here is what I did this week: 

Switched all existing APIs to my API keys + made sure all of them were functional.

Created a new *Interventions Table* in *MySql Database*:

![](2021-03-26-22-38-03.png)

<br>

Created a *Interventions Form* in a new tab on the website:

![](2021-03-26-22-43-13.png)

Here is some of the code for this:

![](2021-03-26-22-43-56.png)
![](2021-03-26-22-59-30.png)

<br>

When an *Intervention Form* is sent it also creates a *Zendesk Ticket:*

![](2021-03-26-22-57-12.png)

The code: 

![](2021-03-26-22-58-06.png)


<br>

Added new *End Points* to the existing *REST API*:

![](2021-03-26-22-46-17.png)

So when we send a *Query*, here is what we get:

![](2021-03-26-22-47-44.png)

<br>

Finally, I deployed my website on *Ubuntu Server* and the *REST API* on Azure. 

</details>

# Rocket Elevators Test-Driven Development #

**Paths to different TDDs :**

*ElevatorMedia:*

- Method : lib/elevator_media.rb
- Spec : spec/streamer_spec.rb

*Others:*

- InterventionController : spec/requests/intervention_spec.rb
- PagesController : spec/requests/pages_controller_spec.rb
- FindBuildings Method : spec/routing/find_buildings_spec.rb


**Link to Bonus Repo:**

TDD-JavaScript : https://github.com/YoannTessier/TDD-JavaScript.git
<br>

_____________________________________________________________________________________________________________

Here are the methods I wrote for ElevatorMedia :

![](2021-04-01-15-20-48.png)

The Specs associated with it :

![](2021-04-01-15-21-32.png)
![](2021-04-01-15-21-54.png)

<br>

For the three others, I tested a *Controller*, a *Route* and a *View*:

![](2021-04-01-15-24-02.png)
![](2021-04-01-15-24-21.png)
![](2021-04-01-15-24-39.png)




